using WebApplication1.Models.Enums;
using WebApplication1.Models;
using WebApplication1.DTOS.Listing;

namespace WebApplication1.DTOS.Booking
{
    public class GetBookingDTO
    {
        public Guid Id { get; set; }
        public Guid GuestId { get; set; }
        public Guid ListingId { get; set; }
        public DateTime CheckInDate { get; set; }
        public DateTime CheckOutDate { get; set; }
        public int GuestsCount { get; set; }
        public decimal TotalPrice { get; set; }
        public string Status { get; set; }
        public DateTime? BookingDate { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string SpecialRequests { get; set; }
        public string CancellationReason { get; set; }
        public string PaymentIntentId { get; set; }
    }
}
