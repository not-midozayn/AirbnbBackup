using WebApplication1.DTOS.AvailabilityCalendar;
using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IAvailabilityCalendar : IRepository<AvailabilityCalendar>
    {
        Task<int> InitializeAvailabilityAsync(Guid listingId, InitAvailabilityCalendarDTO dto);
        Task<bool> GetIfAvailabilityListingsAsync(Guid listingId, DateTime startDate, DateTime endDate);
        Task<int> SetAvailabilityAsync(Guid listingId, SetAvailabilityCalendarDTO dto);
        Task<bool> UpdateAvailabilityAsync(Guid listingId, DateTime date, UpdateAvailabilityCalendarDTO dto);
        Task<int> BatchUpdateAvailabilityAsync(Guid listingId, List<SetAvailabilityCalendarDTO> updates);
        Task<IEnumerable<AvailabilityCalendar>> GetAvailablilityListingsAsync(Guid listingId, DateTime startDate, DateTime endDate);
        Task MarkDatesUnavailable(Guid listingId, DateTime checkIn, DateTime checkOut);
        Task MarkDatesAvailable(Guid listingId, DateTime checkIn, DateTime checkOut);
        Task<List<Guid>> GetAvailableListingIds(DateTime start, DateTime end);
        Task<bool> HasAvailabilityAsync(Guid listingId);
    }
}
