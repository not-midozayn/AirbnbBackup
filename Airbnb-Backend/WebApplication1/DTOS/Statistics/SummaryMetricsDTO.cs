namespace WebApplication1.DTOS.Statistics
{
    public class SummaryMetricsDTO
    {
        public int TotalBookings { get; set; }
        public decimal TotalRevenue { get; set; }
        public int ActiveUsers { get; set; }
        public decimal AvgRating { get; set; }
        public TrendDTO BookingTrend { get; set; }
        public TrendDTO RevenueTrend { get; set; }
        public TrendDTO UserTrend { get; set; }
        public TrendDTO RatingTrend { get; set; }
    }
}
