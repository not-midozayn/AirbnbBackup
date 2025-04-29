using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using WebApplication1.DTOS.AvailabilityCalendar;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class AvailabilityCalendarRepository : GenericRepository<AvailabilityCalendar>, IAvailabilityCalendar
    {
        #region Dependency Injection
        private readonly AirbnbDBContext context;
        private readonly IMapper mapper;
        public AvailabilityCalendarRepository(AirbnbDBContext _context, IMapper _mapper, IHttpContextAccessor httpContextAccessor) : base(_context, _mapper, httpContextAccessor)
        {
            context = _context;
            mapper = _mapper;
        }
        #endregion

        #region Initialize Availability
        public async Task<int> InitializeAvailabilityAsync(Guid listingId, InitAvailabilityCalendarDTO dto)
        {
            var listingExists = await context.Listings.AnyAsync(l => l.Id == listingId);
            if (!listingExists)
            {
                throw new Exception("Listing not found.");
            }

            var startDate = DateTime.UtcNow.Date;
            var endDate = startDate.AddMonths(dto.MonthsAhead);

            var existingDates = await context.AvailabilityCalendars
                .Where(a => a.ListingId == listingId && a.Date >= startDate && a.Date <= endDate)
                .Select(a => a.Date)
                .ToListAsync();

            var datesToAdd = new List<AvailabilityCalendar>();

            for (var date = startDate; date <= endDate; date = date.AddDays(1))
            {
                if (existingDates.Contains(date)) continue;

                var day = mapper.Map<AvailabilityCalendar>(dto);
                day.ListingId = listingId;
                day.Date = date;
                day.IsAvailable = true; // Default to available

                datesToAdd.Add(day);
            }

            if (datesToAdd.Count != 0)
            {
                await context.AvailabilityCalendars.AddRangeAsync(datesToAdd);
                await context.SaveChangesAsync();
            }

            return datesToAdd.Count;
        }
        #endregion

        #region Set Availability With Start and End Date
        public async Task<int> SetAvailabilityAsync(Guid listingId, SetAvailabilityCalendarDTO dto)
        {
            var dates = await GetDateRangeAsync(listingId, dto);

            var datesToAdd = new List<AvailabilityCalendar>();
            foreach (var date in dates)
            {
                var existingEntry = await context.AvailabilityCalendars
                    .FirstOrDefaultAsync(a => a.ListingId == listingId && a.Date == date);

                if (existingEntry == null) // Only add if it doesn't exist
                {
                    var availabilityCalendar = mapper.Map<AvailabilityCalendar>(dto);
                    availabilityCalendar.ListingId = listingId;
                    availabilityCalendar.Date = date;
                    datesToAdd.Add(availabilityCalendar);
                }
            }


            if (datesToAdd.Count != 0)
            {
                await context.AvailabilityCalendars.AddRangeAsync(datesToAdd);
                await context.SaveChangesAsync();
            }

            return datesToAdd.Count;
        }
        #endregion

        #region Update Availability
        public async Task<bool> UpdateAvailabilityAsync(Guid listingId, DateTime date, UpdateAvailabilityCalendarDTO dto)
        {
            var entity = await context.AvailabilityCalendars
                .FirstOrDefaultAsync(a => a.ListingId == listingId && a.Date == date);

            if (entity == null) return false;

            mapper.Map(dto, entity);
            await context.SaveChangesAsync();
            return true;
        }

        //public async Task<int> BatchUpdateAvailabilityAsync(Guid listingId, List<SetAvailabilityCalendarDTO> updates)
        //{
        //    int updated = 0;

        //    foreach (var dto in updates)
        //    {
        //        var dates = await GetDateRangeAsync(listingId, dto);

        //        foreach (var date in dates)
        //        {
        //            var updateDto = mapper.Map<UpdateAvailabilityCalendarDTO>(dto);

        //            var isUpdated = await UpdateAvailabilityAsync(listingId, date, updateDto);
        //            if (isUpdated) updated++;
        //        }
        //    }

        //    return updated;
        //}
        public async Task<int> BatchUpdateAvailabilityAsync(Guid listingId, List<SetAvailabilityCalendarDTO> updates)
        {
            int totalAffected = 0;

            foreach (var dto in updates)
            {
                var dates = await GetDateRangeAsync(listingId, dto);
                int updated = 0;

                foreach (var date in dates)
                {
                    var updateDto = mapper.Map<UpdateAvailabilityCalendarDTO>(dto);

                    bool isUpdated = await UpdateAvailabilityAsync(listingId, date, updateDto);

                    if (isUpdated)
                        updated++;
                }
                int inserted = 0;
                if (updated < dates.Count)
                {
                    inserted = await SetAvailabilityAsync(listingId, dto);
                    totalAffected += inserted;
                }
                else
                {
                    totalAffected += updated;
                }
            }

            return totalAffected;
        }

        #endregion

        #region Get Availability
        public async Task<bool> GetIfAvailabilityListingsAsync(Guid listingId, DateTime startDate, DateTime endDate)
        {
            int totalDays = (endDate - startDate).Days + 1;

            int availableDays = await context.AvailabilityCalendars
                .CountAsync(a => a.ListingId == listingId && a.Date >= startDate && a.Date <= endDate && (a.IsAvailable ?? true));

            return availableDays == totalDays;
        }
        public async Task<IEnumerable<AvailabilityCalendar>> GetAvailablilityListingsAsync(Guid listingId, DateTime startDate, DateTime endDate)
        {
            var availableListings = await context.AvailabilityCalendars
                .Where(a => a.ListingId == listingId && a.Date >= startDate && a.Date <= endDate && (a.IsAvailable ?? true))
                .ToListAsync();

            return availableListings;
        }

        #endregion

        #region Helper Method
        private async Task<List<DateTime>> GetDateRangeAsync(Guid listingId, SetAvailabilityCalendarDTO dto)
        {
            var listingExists = await context.Listings.AnyAsync(l => l.Id == listingId);
            if (!listingExists)
            {
                throw new Exception("Listing not found.");
            }

            DateTime endDate = dto.EndDate ?? dto.StartDate;

            if (endDate < dto.StartDate)
            {
                throw new Exception("End date cannot be earlier than start date.");
            }
            return [.. Enumerable.Range(0, (endDate - dto.StartDate).Days + 1).Select(offset => dto.StartDate.AddDays(offset))];
        }
        public async Task MarkDatesUnavailable(Guid listingId, DateTime checkIn, DateTime checkOut)
        {
            var dto = new SetAvailabilityCalendarDTO
            {
                StartDate = checkIn,
                EndDate = checkOut.AddDays(-1),
                IsAvailable = false
            };

            await BatchUpdateAvailabilityAsync(listingId, [dto]);
        }
        public async Task MarkDatesAvailable(Guid listingId, DateTime checkIn, DateTime checkOut)
        {
            var dto = new SetAvailabilityCalendarDTO
            {
                StartDate = checkIn,
                EndDate = checkOut.AddDays(-1),
                IsAvailable = true
            };

            await BatchUpdateAvailabilityAsync(listingId, [dto]);
        }
        #endregion

        #region Get available Listing ids
        public async Task<List<Guid>> GetAvailableListingIds(DateTime startDate, DateTime endDate)
        {
            if (startDate > endDate)
            {
                throw new ArgumentException("Start date cannot be after end date.");
            }

            var availableListings = await context.AvailabilityCalendars
                .Where(ac => ac.Date >= startDate && ac.Date <= endDate)
                .GroupBy(ac => ac.ListingId)
                .Where(group => group.Count() == (endDate - startDate).Days + 1)
                .Select(group => group.Key)
                .ToListAsync();

            return availableListings;
        }
        #endregion

        #region Check Availability
        public async Task<bool> HasAvailabilityAsync(Guid listingId)
        {
            return await context.AvailabilityCalendars.AnyAsync(a => a.ListingId == listingId);
        }
        #endregion

    }
}