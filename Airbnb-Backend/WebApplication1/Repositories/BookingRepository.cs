using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using WebApplication1.DTOS.Booking;
using WebApplication1.DTOS.Review;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Models.Enums;
using static WebApplication1.Repositories.BookingRepository;
using WebApplication1.Repositories.Payment;
using Stripe;

namespace WebApplication1.Repositories
{
    public class BookingRepository : GenericRepository<Booking>, IBooking
    {
        #region Dependency Injection
        private readonly AirbnbDBContext context;
        private readonly IMapper mapper;
        private readonly IAvailabilityCalendar availabilityCalendarRepository;
        public BookingRepository(AirbnbDBContext _context, IMapper _mapper, IAvailabilityCalendar _availabilityCalendarRepository, IHttpContextAccessor _httpContextAccessor) : base(_context, _mapper, _httpContextAccessor)
        {
            context = _context;
            mapper = _mapper;
            availabilityCalendarRepository = _availabilityCalendarRepository;
        }
        #endregion

        #region Create Methods
        public async Task<Booking> CreateBooking(CreateBookingDTO dto)
        {
            try
            {
                var listing = await context.Listings.FirstOrDefaultAsync(l => l.Id == dto.ListingId) ?? throw new Exception("Listing not found.");
                ValidateBookingDates(dto.CheckInDate, dto.CheckOutDate, listing);

                bool isAvailable = await IsListingAvailable(dto.ListingId, dto.CheckInDate, dto.CheckOutDate);
                if (!isAvailable)
                    throw new Exception("Listing is not available for the selected dates.");
                if (dto.GuestsCount > listing.Capacity)
                    throw new Exception("Guests count exceeds listing capacity.");


                var booking = mapper.Map<Booking>(dto);
                booking.TotalPrice = await CalculateTotalPrice(listing, dto.CheckInDate, dto.CheckOutDate);
                booking.GuestId = GetCurrentUserId();
                booking.Status = BookingStatus.Pending;

                await CreateAsync(booking);
                return booking;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error while creating Booking: {ex.Message}");
            }
        }
        #endregion

        #region Cancel Booking 
        public async Task CancelBookingAsync(Guid bookingId, string reason)
        {
            var currentUserId = GetCurrentUserId();

            var booking = await GetByIDAsync(bookingId, ["Listing", "Listing.CancellationPolicy"])
                ?? throw new Exception("Booking not found.");

            if (booking.GuestId != currentUserId)
                throw new UnauthorizedAccessException();

            switch (booking.Status)
            {
                case BookingStatus.Pending:
                    throw new InvalidOperationException("Booking cannot be cancelled at this stage.");
                case BookingStatus.Confirmed:
                    booking.CancellationReason = reason;
                    booking.Status = BookingStatus.Cancelled;
                    booking.UpdatedAt = DateTime.UtcNow;
                    await availabilityCalendarRepository.MarkDatesAvailable(booking.ListingId, booking.CheckInDate, booking.CheckOutDate);

                    await UpdateAsync(booking);
                    break;
                case BookingStatus.Completed:
                    throw new InvalidOperationException("Booking cannot be cancelled after completion.");
                case BookingStatus.Cancelled:
                    throw new InvalidOperationException("Booking already cancelled.");
                default:
                    throw new InvalidOperationException("Booking cannot be cancelled.");
            }
        }
        #endregion

        #region Helper Methods
        private async Task<bool> IsListingAvailable(Guid listingId, DateTime startDate, DateTime endDate)
        {
            var availableDates = await GetAvailableDates(listingId, startDate, endDate);
            var conflictingBookings = await GetConflictingBookings(listingId, startDate, endDate);

            return availableDates && conflictingBookings;
        }
        private async Task<bool> GetAvailableDates(Guid listingId, DateTime startDate, DateTime endDate)
        {
            var totalDays = (endDate - startDate).Days;
            if (totalDays <= 0) return false;

            var expectedDates = Enumerable.Range(0, totalDays).Select(offset => startDate.AddDays(offset)).ToList();
            var availableDates = await availabilityCalendarRepository.GetAvailablilityListingsAsync(listingId, startDate, endDate);
            var availableDateList = availableDates.Select(ad => ad.Date.Date).ToList();

            return !expectedDates.Except(availableDateList).Any();
        }
        private async Task<bool> GetConflictingBookings(Guid listingId, DateTime startDate, DateTime endDate)
        {
            var conflictingBookings = await context.Bookings
                .Where(b => b.ListingId == listingId
                            && ((b.CheckInDate < endDate && b.CheckOutDate >= startDate))
                            && (b.Status == BookingStatus.Confirmed))
                .ToListAsync();

            Console.WriteLine($"{conflictingBookings}");
            return conflictingBookings.Count == 0;
        }
        private async Task<decimal> CalculateTotalPrice(Listing listing, DateTime checkIn, DateTime checkOut)
        {
            if (listing == null) throw new Exception("Listing not found.");
            if (listing.PricePerNight <= 0) throw new Exception("Invalid price per night.");

            var days = (checkOut - checkIn).Days;
            if (days <= 0) throw new Exception("Invalid date range.");

            var dates = Enumerable.Range(0, days).Select(offset => checkIn.AddDays(offset)).ToList();
            var calendarEntries = await context.AvailabilityCalendars.Where(ac => ac.ListingId == listing.Id && dates.Contains(ac.Date)).ToListAsync();

            decimal totalPrice = 0;

            foreach (var date in dates)
            {
                var calendar = calendarEntries.FirstOrDefault(ac => ac.Date == date);
                totalPrice += calendar?.SpecialPrice ?? listing.PricePerNight;
            }

            return totalPrice + (listing.ServiceFee ?? 0) + (listing.SecurityDeposit ?? 0);
        }
        private static void ValidateBookingDates(DateTime checkInDate, DateTime checkOutDate, Listing listing)
        {
            if (checkInDate < DateTime.UtcNow.Date)
                throw new Exception("Check-in date cannot be in the past.");

            if (checkOutDate < checkInDate)
                throw new Exception("Check-out date cannot be earlier than check-in date.");

            var days = (checkOutDate - checkInDate).Days;
            if (days > listing.MaxNights || days < listing.MinNights)
                throw new Exception($"Maximum stay duration is {listing.MaxNights} days and Minimum is {listing.MinNights}");
        }
        #endregion
    }
}