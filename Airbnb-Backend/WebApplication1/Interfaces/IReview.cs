using WebApplication1.DTOS.Review;
using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IReview : IRepository<Review>
    {
        Task<Review> CreateReview(Guid bookingId, CreateReviewDTO dto);
        Task<bool> AddHostReplyAsync(Guid reviewId, Guid hostId, string replyMessage);
        Task UpdateListingReviewStats(Guid listingId);
    }
}