namespace WebApplication1.DTOS.Review
{
    public class UpdateReviewDTO
    {
        public decimal Rating { get; set; }
        public decimal CleanlinessRating { get; set; }
        public decimal AccuracyRating { get; set; }
        public decimal CommunicationRating { get; set; }
        public decimal LocationRating { get; set; }
        public decimal CheckInRating { get; set; }
        public decimal ValueRating { get; set; }
        public string Comment { get; set; }
    }   
}

