using WebApplication1.Models;

namespace WebApplication1.DTOS.AvailabilityCalendar
{
    public class GetAvailabilityCalendarDTO
    {
        public Guid Id { get; set; }
        public Guid ListingId { get; set; }
        public DateTime Date { get; set; }
        public bool? IsAvailable { get; set; }
        public decimal? SpecialPrice { get; set; }
    }
}