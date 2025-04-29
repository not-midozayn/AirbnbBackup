using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Stripe;
using WebApplication1.DTOS.Authentication;
using WebApplication1.DTOS.Booking;
using WebApplication1.DTOS.Listing;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Models.Enums;
using WebApplication1.Repositories;
using WebApplication1.Repositories.Payment;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        #region Dependency Injection
        private readonly IBooking _bookingRepository;
        private readonly IMapper _mapper;
        private readonly IListing _listingsRepository;
        private readonly IPayment _paymentRepository;
        private readonly IStripe _stripeRepository;
        public BookingController(IBooking bookingRepository, IMapper mapper, IListing listingsRepository, IPayment paymentRepository, IStripe stripeRepository)
        {
            _bookingRepository = bookingRepository;
            _mapper = mapper;
            _listingsRepository = listingsRepository;
            _paymentRepository = paymentRepository;
            _stripeRepository = stripeRepository;
        }
        private readonly List<string> includeProperties = ["Listing", "Listing.ListingPhotos", "Listing.Host", "Guest", "Listing.CancellationPolicy"];
        #endregion

        #region Post Methods
        [HttpPost]
        [Authorize(Roles = $"{UserRoles.Guest},{UserRoles.Host}")]
        public async Task<ActionResult> CreateBooking([FromBody] CreateBookingDTO dto)
        {
            if (dto == null)
            {
                return BadRequest("Booking data is required.");
            }
            try
            {
                var newbooking = await _bookingRepository.CreateBooking(dto);
                return CreatedAtAction(nameof(CreateBooking), new { id = newbooking.Id }, newbooking);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion

        #region Get Methods
        [HttpGet]
        [Authorize(Roles = $"{UserRoles.Admin},{UserRoles.Host}")]
        public async Task<ActionResult<IEnumerable<GetBookingDTO>>> GetAllBookings([FromQuery] Dictionary<string, string> queryParams)
        {
            var bookings = await _bookingRepository.GetAllAsync(queryParams, includeProperties);
            var bookingsDTOs = _mapper.Map<List<GetBookingDTO>>(bookings);
            return Ok(bookingsDTOs);
        }
        [HttpGet("me")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<ActionResult<IEnumerable<GetBookingDTO>>> GetUserBookings([FromQuery] Dictionary<string, string> queryParams)
        {
            if (!_bookingRepository.IsAuthenticated())
            {
                var emptyBookings = new List<GetBookingDTO>();
                return Ok(emptyBookings);
            }
            var userId = _bookingRepository.GetCurrentUserId();
            queryParams["GuestId"] = userId.ToString();
            var userBookings = await _bookingRepository.GetAllAsync(queryParams, includeProperties);
            var userBookingsDTOs = _mapper.Map<List<GetBookingDTO>>(userBookings);

            return Ok(userBookingsDTOs);
        }
        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<GetBookingDTO>> GetBookingById(Guid id)
        {
            var booking = await _bookingRepository.GetByIDAsync(id);
            if (booking == null)
                return NotFound();
            var bookingDTO = _mapper.Map<GetBookingDTO>(booking);
            return Ok(bookingDTO);
        }
        [HttpGet("listings/{id}")]
        [Authorize(Roles = $"{UserRoles.Admin},{UserRoles.Host}")]
        public async Task<ActionResult<IEnumerable<GetBookingDTO>>> GetListingBookings(Guid id)
        {
            var listing = await _listingsRepository.GetListingWithDetailsbyId(id);
            if (listing == null)
                return NotFound("Listing not found");
            var bookings = await _bookingRepository.GetAllAsync(new Dictionary<string, string> { { "ListingId", id.ToString() } });
            var bookingsDTOs = _mapper.Map<List<GetBookingDTO>>(bookings);
            return Ok(bookingsDTOs);
        }
        #endregion

        #region Get references
        [HttpGet("current-host")]
        public async Task<ActionResult<IEnumerable<GetBookingDTO>>> GetCurrentHostBookings([FromQuery] Dictionary<string, string> queryParams)
        {
            var userId = _bookingRepository.GetCurrentUserId();
            var hostBookings = await _bookingRepository.GetAllAsync(queryParams, includeProperties);
            var filteredBookings = hostBookings.Where(b => b.Listing.HostId == userId).ToList();
            var hostBookingsDTOs = _mapper.Map<List<GetBookingDTO>>(filteredBookings);
            return Ok(hostBookingsDTOs);
        }
        [HttpGet("{bookingId}/cancellation-policy")]
        //[Authorize]
        public async Task<ActionResult<CancellationPolicy>> GetCancellationPolicy(Guid bookingId)
        {
            var booking = await _bookingRepository.GetByIDAsync(bookingId, ["Listing", "Listing.CancellationPolicy"]);
            if (booking == null) return NotFound("Booking not found.");
            var cancellationPolicy = booking.Listing.CancellationPolicy;
            return Ok(cancellationPolicy);
        }
        [HttpGet("{bookingId}/refund-amount")]
        //[Authorize]
        public async Task<ActionResult<decimal>> GetRefundAmount(Guid bookingId)
        {
            try
            {
                var refundAmount = await _paymentRepository.GetRefundAmountAsync(bookingId);
                return Ok(refundAmount);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        #endregion

        #region Cancel Bookings
        [HttpPost("{bookingId}/cancel")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<IActionResult> CancelBooking(Guid bookingId, CancelBookingDTO request)
        {
            try
            {
                var booking = await _bookingRepository.GetByIDAsync(bookingId, ["Listing", "Listing.CancellationPolicy"]);
                if (booking == null) return NotFound("Booking not found.");

                await _paymentRepository.RefundBookingPaymentAsync(booking);
                await _bookingRepository.CancelBookingAsync(bookingId, request.Reason);
                return Ok("Booking cancelled and payment refunded.");
            }
            catch (UnauthorizedAccessException)
            {
                return Unauthorized();
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost("{bookingId}/expired")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<IActionResult> CancelExpiredBookings(Guid bookingId)
        {
            try
            {
                var booking = await _bookingRepository.GetByIDAsync(bookingId);
                if (booking == null)
                    return NotFound("Booking not found");

                if (booking.Status != BookingStatus.Pending)
                    return BadRequest("Booking is not in a cancelable state");
                else
                {
                    try
                    {
                        if (!string.IsNullOrEmpty(booking.PaymentIntentId))
                        {
                            await _stripeRepository.CancelPaymentIntentAsync(booking.PaymentIntentId);
                        }
                        await _bookingRepository.DeleteAsync<Booking>(booking.Id);
                        return Ok("Booking and payment intent have been cancelled.");
                    }
                    catch (Exception ex)
                    {
                        return BadRequest($"Error cancelling payment intent: {ex.Message}");

                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);

            }
        }
        #endregion
    }
}