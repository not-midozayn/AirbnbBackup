using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOS.Authentication;
using WebApplication1.DTOS.Listing;
using WebApplication1.DTOS.Review;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Repositories;

namespace WebApplication1.Controllers
{
    [Route("api/[Controller]")]
    [ApiController]
    public class ReviewsController : ControllerBase
    {
        #region Dependency Injection
        private readonly IReview _reviewRepository;
        private readonly IMapper _mapper;
        public ReviewsController(IReview reviewRepository, IMapper mapper)
        {
            _reviewRepository = reviewRepository;
            _mapper = mapper;
        }
        private readonly List<string> includeProperties =
        [
            "Reviewer",
        ];
        #endregion

        #region Post Methods
        [HttpPost("bookings/{bookingId}")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<IActionResult> CreateReviewOnBooking(Guid bookingId, [FromBody] CreateReviewDTO dto)
        {
            if (dto == null)
            {
                return BadRequest("Review data is required.");
            }
            try
            {
                dto.ReviewerId = _reviewRepository.GetCurrentUserId();

                var review = await _reviewRepository.CreateReview(bookingId, dto);
                var reviewDTO = _mapper.Map<GetReviewDTO>(review);

                await _reviewRepository.UpdateListingReviewStats(review.ListingId);
                return CreatedAtAction(nameof(CreateReviewOnBooking), new { id = reviewDTO.Id }, reviewDTO);

            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        [HttpPost("{id}/host-reply")]
        [Authorize(Roles = $"{UserRoles.Host}")]
        public async Task<IActionResult> AddHostReply(Guid id, [FromBody] HostReplyDTO dto)
        {
            if (dto == null || string.IsNullOrWhiteSpace(dto.HostReply))
            {
                return BadRequest("Reply message is required.");
            }
            try
            {
                var currentUserId = _reviewRepository.GetCurrentUserId();
                var review = await _reviewRepository.GetByIDAsync(id);

                await _reviewRepository.AddHostReplyAsync(id, currentUserId, dto.HostReply);

                return Ok(new { Message = "Reply added successfully." });
            }
            catch (UnauthorizedAccessException ex)
            {
                return Forbid(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion

        #region Get Methods
        [HttpGet("listings/{listingId}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<GetReviewDTO>>> GetReviewsForListing(Guid listingId)
        {
            try
            {
                var reviews = await _reviewRepository.GetAllAsync(new Dictionary<string, string> { { "ListingId", listingId.ToString()} },includeProperties);
                if (reviews == null || !reviews.Any())
                {
                    return NotFound("No Reviews Found For This Listing.");
                }
                var reviewsDTOs = _mapper.Map<List<GetReviewDTO>>(reviews);
                return Ok(reviewsDTOs);
            }
            catch(Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        [HttpGet("users/{userId}")]
        [Authorize(Roles = $"{UserRoles.Admin}")]
        public async Task<ActionResult<IEnumerable<GetReviewDTO>>> GetReviewsByUserID(Guid userId)
        {
            try
            {
                var reviews = await _reviewRepository.GetAllAsync(new Dictionary<string, string> { { "ReviewerId", userId.ToString() } }, includeProperties);
                if (reviews == null || !reviews.Any())
                {
                    return NotFound("No Reviews Found For This Guest.");
                }
                var reviewsDTOs = _mapper.Map<List<GetReviewDTO>>(reviews);
                return Ok(reviewsDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        [HttpGet("host/{hostId}")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<GetReviewDTO>>> GetReviewsByHostID(Guid hostId)
        {
            try
            {
                var reviews = await _reviewRepository.GetAllAsync(new Dictionary<string, string> { { "HostId", hostId.ToString() } }, includeProperties);
                if (reviews == null || !reviews.Any())
                {
                    return NotFound("No Reviews Found For This Host.");
                }
                var reviewsDTOs = _mapper.Map<List<GetReviewDTO>>(reviews);
                return Ok(reviewsDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<GetReviewDTO>> GetReviewById(Guid id)
        {
            try
            {
                var review = await _reviewRepository.GetByIDAsync(id,includeProperties);
                if (review == null)
                {
                    return NotFound("Review not found.");
                }
                var reviewDTO = _mapper.Map<GetReviewDTO>(review);
                return Ok(reviewDTO);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        #endregion

        #region Update Methods
        [HttpPut("{id}")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<ActionResult<GetReviewDTO>> UpdateReview(Guid id, [FromBody] UpdateReviewDTO dto)
        {
            if (dto == null)
            {
                return BadRequest("Review data is required.");
            }
            try
            {
                var currentUserId = _reviewRepository.GetCurrentUserId();
                var currentReview = await _reviewRepository.GetByIDAsync(id);
                if (currentReview.ReviewerId != currentUserId)
                {
                    return Forbid("You are not authorized to update this review.");
                }
                var updatedReview = await _reviewRepository.UpdateAsync<Review, UpdateReviewDTO>(id, dto);

                await _reviewRepository.UpdateListingReviewStats(updatedReview.ListingId);

                return Ok(updatedReview);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion

        #region Delete Methods
        [HttpDelete("{id}")]
        [Authorize(Roles = $"{UserRoles.Admin},{UserRoles.Host},{UserRoles.Guest}")]
        public async Task<ActionResult> DeleteReview(Guid id)
        {
            try
            {
                var currentUserId = _reviewRepository.GetCurrentUserId();
                var currentReview = await _reviewRepository.GetByIDAsync(id);
                if (currentReview.ReviewerId != currentUserId)
                {
                    return Forbid("You are not authorized to update this review.");
                }
                await _reviewRepository.DeleteAsync<Review>(id);
                await _reviewRepository.UpdateListingReviewStats(currentReview.ListingId);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion
    }
}