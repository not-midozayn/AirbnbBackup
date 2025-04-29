using AutoMapper;
using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOS.Review;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class ReviewsRepository:GenericRepository<Review>, IReview
    {
        #region Dependency Injection
        private readonly AirbnbDBContext context;
        private readonly IMapper mapper;
        public ReviewsRepository(AirbnbDBContext _context, IMapper _mapper, IHttpContextAccessor httpContextAccessor) : base(_context,_mapper, httpContextAccessor)
        {
            context = _context;
            mapper = _mapper;
        }
        #endregion

        #region Create Methods
        public async Task<Review> CreateReview(Guid bookingID, CreateReviewDTO dto)
        {
            try
            {
                var booking = await context.Bookings
                    .FirstOrDefaultAsync(b => b.Id == bookingID && b.GuestId == dto.ReviewerId);

                if (booking == null)
                    throw new Exception("Booking not found or does not belong to the reviewer.");

                var existingReview = await context.Reviews
                    .FirstOrDefaultAsync(r => r.BookingId == bookingID && r.ReviewerId == dto.ReviewerId);

                if (existingReview != null)
                    throw new Exception("A review already exists for this booking.");

                var listing = await context.Listings.FirstOrDefaultAsync(l => l.Id == booking.ListingId);
                if (listing == null)
                    throw new Exception("Listing not found for the booking.");

                var newReview = mapper.Map<Review>(dto);
                newReview.ListingId = listing.Id;
                newReview.HostId = listing.HostId;
                newReview.BookingId = booking.Id;

                await CreateAsync(newReview);
                return newReview;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error while creating review: {ex.Message}");
            }
        }

        #endregion

        #region Add Host Reply Method
        public async Task<bool> AddHostReplyAsync(Guid reviewId, Guid hostId, string replyMessage)
        {
            var review = await context.Reviews.FirstOrDefaultAsync(r => r.Id == reviewId);
            if (review == null)
                throw new Exception("Review not found.");

            if (review.HostId != hostId)
                throw new UnauthorizedAccessException("You are not authorized to reply to this review.");

            review.HostReply = replyMessage;
            review.HostReplyDate = DateTime.UtcNow;

            await context.SaveChangesAsync();
            return true;
        }
        #endregion

        #region Update Listing Rating
        public async Task UpdateListingReviewStats(Guid listingId)
        {
            var listing = await context.Listings.FirstOrDefaultAsync(l => l.Id == listingId);
            if (listing == null) return;

            var reviews = await context.Reviews
                .Where(r => r.ListingId == listingId)
                .ToListAsync();

            listing.ReviewCount = reviews.Count;
            listing.AverageRating = (reviews.Count > 0
                ? reviews.Average(r => r.Rating)
                : 0);

            context.Listings.Update(listing);
            await context.SaveChangesAsync();
        }
        #endregion

    }
}
