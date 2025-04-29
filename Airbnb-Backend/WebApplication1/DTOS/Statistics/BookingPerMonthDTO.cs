namespace WebApplication1.DTOS.Statistics
{
    public class BookingPerMonthDTO
    {
        public List<string> Labels { get; set; } = new();
        public List<int> NewBookingsData { get; set; } = new();
        public List<int> CancellationsData { get; set; } = new();
    }
}
