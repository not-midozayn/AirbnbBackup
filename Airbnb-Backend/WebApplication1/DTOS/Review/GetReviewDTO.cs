using WebApplication1.DTOS.ApplicationUser;

namespace WebApplication1.DTOS.Review
{
    public class GetReviewDTO
    {
        public Guid Id { get; set; }
        public Guid BookingId { get; set; }
        public GetApplicationUserDto Reviewer { get; set; }
        public Guid HostId { get; set; }
        public Guid ListingId { get; set; }
        public string Comment { get; set; }
        public string HostReply { get; set; }
        public DateTime? HostReplyDate { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public decimal Rating { get; set; }
        public decimal CleanlinessRating { get; set; }
        public decimal AccuracyRating { get; set; }
        public decimal CommunicationRating { get; set; }
        public decimal LocationRating { get; set; }
        public decimal CheckInRating { get; set; }
        public decimal ValueRating { get; set; }
    }
}