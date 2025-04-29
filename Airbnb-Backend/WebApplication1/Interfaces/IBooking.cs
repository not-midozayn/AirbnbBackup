using WebApplication1.DTOS.Booking;
using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IBooking : IRepository<Booking>
    {
        Task<Booking> CreateBooking(CreateBookingDTO dto);
        Task CancelBookingAsync(Guid bookingId, string reason);
    }
}
