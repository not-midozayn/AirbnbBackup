namespace WebApplication1.DTOS.AvailabilityCalendar
{
    public class SetAvailabilityCalendarDTO
    {
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool IsAvailable { get; set; }
        public decimal? SpecialPrice { get; set; }
    }
}
