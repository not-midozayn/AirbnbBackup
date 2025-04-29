namespace WebApplication1.DTOS.Review
{
    public class CreateReviewDTO
    {
        public Guid ReviewerId { get; set; }
        public string Comment { get; set; }
        public decimal Rating { get; set; }
        public decimal CleanlinessRating { get; set; }
        public decimal AccuracyRating { get; set; }
        public decimal CommunicationRating { get; set; }
        public decimal LocationRating { get; set; }
        public decimal CheckInRating { get; set; }
        public decimal ValueRating { get; set; }
    }
}