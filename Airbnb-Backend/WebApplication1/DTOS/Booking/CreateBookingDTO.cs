using WebApplication1.Models.Enums;

namespace WebApplication1.DTOS.Booking
{
    public class CreateBookingDTO
    {
        public Guid ListingId { get; set; }
        public DateTime CheckInDate { get; set; }
        public DateTime CheckOutDate { get; set; }
        public int GuestsCount { get; set; }
        public string SpecialRequests { get; set; }
    }
}