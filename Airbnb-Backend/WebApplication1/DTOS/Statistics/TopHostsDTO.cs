namespace WebApplication1.DTOS.Statistics
{
    public class TopHostsDTO
    {
        public List<string> Hosts { get; set; } = new();
        public List<int> BookingCounts { get; set; } = new();
    }
}
