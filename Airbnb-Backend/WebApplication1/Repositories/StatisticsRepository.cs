using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using WebApplication1.DTOS.Statistics;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Models.Enums;

namespace WebApplication1.Repositories
{
    public class StatisticsRepository : IStatistics
    {
        #region Dependency Injection
        private readonly AirbnbDBContext context;
        private readonly IMapper mapper;
        private readonly IBooking bookingRepository;
        private readonly UserManager<ApplicationUser> userManager;
        private readonly RoleManager<IdentityRole<Guid>> roleManager;
        public StatisticsRepository(AirbnbDBContext _context, IMapper _mapper, IBooking _bookingRepository, UserManager<ApplicationUser> _userManager, RoleManager<IdentityRole<Guid>> _roleManager)
        {
            context = _context;
            mapper = _mapper;
            bookingRepository = _bookingRepository;
            userManager = _userManager;
            roleManager = _roleManager;
        }
        #endregion

        #region Booking Statistics
        public async Task<BookingPerMonthDTO> GetBookingsByPeriodAsync(string period, int? year)
        {
            var confirmedBookingsQuery = context.Bookings.Where(b => b.Status == BookingStatus.Confirmed);
            var cancelledBookingsQuery = context.Bookings.Where(b => b.Status == BookingStatus.Cancelled);

            if (year.HasValue)
            {
                confirmedBookingsQuery = confirmedBookingsQuery.Where(b => b.CheckInDate.Year == year.Value);
                cancelledBookingsQuery = cancelledBookingsQuery.Where(b => b.CheckInDate.Year == year.Value);
            }

            var confirmedBookings = await confirmedBookingsQuery.ToListAsync();
            var cancelledBookings = await cancelledBookingsQuery.ToListAsync();

            List<string> labels = [];
            List<int> confirmedCounts = [];
            List<int> cancelledCounts = [];

            if (confirmedBookings.Count == 0 && cancelledBookings.Count == 0)
            {
                return new BookingPerMonthDTO
                {
                    Labels = ["No bookings"],
                    NewBookingsData = [0],
                    CancellationsData = [0]
                };
            }

            DateTime? startDate = confirmedBookings.Concat(cancelledBookings).Min(b => b.CheckInDate);
            DateTime? endDate = confirmedBookings.Concat(cancelledBookings).Max(b => b.CheckInDate);

            if (startDate == null || endDate == null)
            {
                throw new InvalidOperationException("No bookings found.");
            }

            switch (period.ToLower())
            {
                case "daily":
                    var dailyGroupsConfirmed = confirmedBookings
                        .GroupBy(b => b.CheckInDate.Date)
                        .ToDictionary(g => g.Key, g => g.Count());

                    var dailyGroupsCancelled = cancelledBookings
                        .GroupBy(b => b.CheckInDate.Date)
                        .ToDictionary(g => g.Key, g => g.Count());

                    for (DateTime date = startDate.Value.Date; date <= endDate.Value.Date; date = date.AddDays(1))
                    {
                        string label = date.ToString("yyyy-MM-dd");
                        labels.Add(label);
                        confirmedCounts.Add(dailyGroupsConfirmed.ContainsKey(date) ? dailyGroupsConfirmed[date] : 0);
                        cancelledCounts.Add(dailyGroupsCancelled.ContainsKey(date) ? dailyGroupsCancelled[date] : 0);
                    }
                    break;

                case "weekly":
                    var weeklyGroupsConfirmed = confirmedBookings
                        .GroupBy(b => CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(b.CheckInDate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                        .ToDictionary(g => g.Key, g => g.Count());

                    var weeklyGroupsCancelled = cancelledBookings
                        .GroupBy(b => CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(b.CheckInDate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                        .ToDictionary(g => g.Key, g => g.Count());

                    for (int week = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(startDate.Value, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
                        week <= CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(endDate.Value, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
                        week++)
                    {
                        string label = $"Week {week}";
                        labels.Add(label);
                        confirmedCounts.Add(weeklyGroupsConfirmed.ContainsKey(week) ? weeklyGroupsConfirmed[week] : 0);
                        cancelledCounts.Add(weeklyGroupsCancelled.ContainsKey(week) ? weeklyGroupsCancelled[week] : 0);
                    }
                    break;

                case "monthly":
                    var monthlyGroupsConfirmed = confirmedBookings
                        .GroupBy(b => new { b.CheckInDate.Year, b.CheckInDate.Month })
                        .ToDictionary(g => g.Key, g => g.Count());

                    var monthlyGroupsCancelled = cancelledBookings
                        .GroupBy(b => new { b.CheckInDate.Year, b.CheckInDate.Month })
                        .ToDictionary(g => g.Key, g => g.Count());

                    for (DateTime month = new DateTime(startDate.Value.Year, startDate.Value.Month, 1);
                        month <= new DateTime(endDate.Value.Year, endDate.Value.Month, 1);
                        month = month.AddMonths(1))
                    {
                        string label = $"{CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(month.Month)} {month.Year}";
                        labels.Add(label);
                        confirmedCounts.Add(monthlyGroupsConfirmed.ContainsKey(new { month.Year, month.Month }) ? monthlyGroupsConfirmed[new { month.Year, month.Month }] : 0);
                        cancelledCounts.Add(monthlyGroupsCancelled.ContainsKey(new { month.Year, month.Month }) ? monthlyGroupsCancelled[new { month.Year, month.Month }] : 0);
                    }
                    break;

                case "yearly":
                    var yearlyGroupsConfirmed = confirmedBookings
                        .GroupBy(b => b.CheckInDate.Year)
                        .ToDictionary(g => g.Key, g => g.Count());

                    var yearlyGroupsCancelled = cancelledBookings
                        .GroupBy(b => b.CheckInDate.Year)
                        .ToDictionary(g => g.Key, g => g.Count());

                    for (int bookingYear = startDate.Value.Year; bookingYear <= endDate.Value.Year; bookingYear++)
                    {
                        string label = bookingYear.ToString();
                        labels.Add(label);
                        confirmedCounts.Add(yearlyGroupsConfirmed.ContainsKey(bookingYear) ? yearlyGroupsConfirmed[bookingYear] : 0);
                        cancelledCounts.Add(yearlyGroupsCancelled.ContainsKey(bookingYear) ? yearlyGroupsCancelled[bookingYear] : 0);
                    }
                    break;

                default:
                    throw new ArgumentException("Invalid period. Choose from: daily, weekly, monthly, yearly.");
            }

            return new BookingPerMonthDTO
            {
                Labels = labels,
                NewBookingsData = confirmedCounts,
                CancellationsData = cancelledCounts
            };
        }

        #endregion

        #region Revenue Statistics
        public async Task<RevenueTrendDTO> GetRevenueByPeriodAsync(int year, string period)
        {
            var revenueData = new List<decimal>();
            var labels = new List<string>();

            // Retrieve all confirmed bookings for the year
            var bookingsQuery = context.Bookings
                .Where(b => b.CheckInDate.Year == year && b.Status == BookingStatus.Confirmed)
                .OrderBy(b => b.CheckInDate)
                .ToListAsync();

            var bookings = await bookingsQuery;

            // If no bookings, return empty data
            if (bookings.Count == 0)
            {
                return new RevenueTrendDTO
                {
                    Labels = new List<string> { "No bookings" },
                    Revenue = new List<decimal> { 0 }
                };
            }

            // Get the start and end date for the entire year based on available bookings
            DateTime startDate = bookings.Min(b => b.CheckInDate);
            DateTime endDate = bookings.Max(b => b.CheckInDate);

            // Define the grouping and labeling logic based on the selected period
            switch (period.ToLower())
            {
                case "daily":
                    var dailyGroups = bookings
                        .GroupBy(b => b.CheckInDate.Date)
                        .ToDictionary(g => g.Key, g => g.Sum(b => b.TotalPrice));

                    for (DateTime date = startDate.Date; date <= endDate.Date; date = date.AddDays(1))
                    {
                        string label = date.ToString("yyyy-MM-dd");
                        labels.Add(label);
                        revenueData.Add(dailyGroups.ContainsKey(date) ? dailyGroups[date] : 0);
                    }
                    break;

                case "weekly":
                    var weeklyGroups = bookings
                        .GroupBy(b => CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(b.CheckInDate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                        .ToDictionary(g => g.Key, g => g.Sum(b => b.TotalPrice));

                    var startWeek = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(startDate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
                    var endWeek = CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(endDate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);

                    for (int week = startWeek; week <= endWeek; week++)
                    {
                        string label = $"Week {week}";
                        labels.Add(label);
                        revenueData.Add(weeklyGroups.ContainsKey(week) ? weeklyGroups[week] : 0);
                    }
                    break;

                case "monthly":
                    var monthlyGroups = bookings
                        .GroupBy(b => new { b.CheckInDate.Year, b.CheckInDate.Month })
                        .ToDictionary(g => g.Key, g => g.Sum(b => b.TotalPrice));

                    DateTime currentMonth = new DateTime(startDate.Year, startDate.Month, 1);
                    while (currentMonth <= endDate)
                    {
                        string label = $"{CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(currentMonth.Month)} {currentMonth.Year}";
                        labels.Add(label);
                        revenueData.Add(monthlyGroups.ContainsKey(new { currentMonth.Year, currentMonth.Month }) ? monthlyGroups[new { currentMonth.Year, currentMonth.Month }] : 0);
                        currentMonth = currentMonth.AddMonths(1);
                    }
                    break;

                case "yearly":
                    var yearlyGroups = bookings
                        .GroupBy(b => b.CheckInDate.Year)
                        .ToDictionary(g => g.Key, g => g.Sum(b => b.TotalPrice));

                    for (int bookingYear = startDate.Year; bookingYear <= endDate.Year; bookingYear++)
                    {
                        string label = bookingYear.ToString();
                        labels.Add(label);
                        revenueData.Add(yearlyGroups.ContainsKey(bookingYear) ? yearlyGroups[bookingYear] : 0);
                    }
                    break;

                default:
                    throw new ArgumentException("Invalid period. Choose from: daily, weekly, monthly, yearly.");
            }

            // Return the result as a DTO
            return new RevenueTrendDTO
            {
                Labels = labels,
                Revenue = revenueData
            };
        }
        #endregion

        #region Helper Methods
        private static Dictionary<string, decimal> GroupBookingsByPeriod(List<Booking> bookings, string period)
        {
            return period.ToLower() switch
            {
                "daily" => bookings.GroupBy(b => b.CheckInDate.Date).ToDictionary(g => g.Key.ToString("yyyy-MM-dd"), g => g.Sum(b => b.TotalPrice)),
                "weekly" => bookings.GroupBy(b => CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(b.CheckInDate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                                    .ToDictionary(g => $"Week {g.Key}", g => g.Sum(b => b.TotalPrice)),
                "monthly" => bookings.GroupBy(b => new { b.CheckInDate.Year, b.CheckInDate.Month })
                                    .ToDictionary(g => $"{CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(g.Key.Month)} {g.Key.Year}", g => g.Sum(b => b.TotalPrice)),
                "yearly" => bookings.GroupBy(b => b.CheckInDate.Year)
                                    .ToDictionary(g => g.Key.ToString(), g => g.Sum(b => b.TotalPrice)),
                _ => throw new ArgumentException("Invalid period. Choose from: daily, weekly, monthly, yearly."),
            };
        }
        private static (DateTime? startDate, DateTime? endDate) GetBookingDateRange(List<Booking> bookings)
        {
            if (bookings.Count == 0)
            {
                return (null, null);
            }

            DateTime? startDate = bookings.Min(b => b.CheckInDate);
            DateTime? endDate = bookings.Max(b => b.CheckInDate);

            return (startDate, endDate);
        }

        #endregion

        #region User Role Distribution
        public async Task<UserRoleDitributionDTO> GetRoleDistributionAsync()
        {
            var result = new UserRoleDitributionDTO();
            var allRoles = roleManager.Roles.Select(r => r.Name).ToList();
            foreach (var role in allRoles)
            {
                var usersInRole = await userManager.GetUsersInRoleAsync(role);
                result.Roles.Add(role);
                result.Counts.Add(usersInRole.Count);
            }
            return result;
        }
        #endregion

        #region Top Hosts
        public async Task<TopHostsDTO> GetTopHostsAsync(int topN, int? year)
        {
            var query = context.Bookings
                .Include(b => b.Listing)
                .ThenInclude(l => l.Host)
                .Where(b => b.Status == BookingStatus.Confirmed)
                .AsQueryable();
            if (year.HasValue)
            {
                query = query.Where(b => b.CheckInDate.Year == year.Value);
            }
            var result = await query
                .GroupBy(b => new { b.Listing.Host.Id, b.Listing.Host.FirstName, b.Listing.Host.LastName })
                .Select(g => new
                {
                    FullName = g.Key.FirstName + " " + g.Key.LastName,
                    Count = g.Count()
                })
                .OrderByDescending(x => x.Count)
                .Take(topN)
                .ToListAsync();

            return new TopHostsDTO
            {
                Hosts = result.Select(r => r.FullName).ToList(),
                BookingCounts = result.Select(r => r.Count).ToList()
            };
        }
        #endregion

        #region Listing Ratings
        public async Task<ListingRatingDTO> GetListingsWithRatingsAsync(int? year = null)
        {
            var query = context.Bookings
                .Include(b => b.Listing)
                .Where(b => b.Status == BookingStatus.Confirmed)
                .AsQueryable();

            if (year.HasValue)
            {
                query = query.Where(b => b.CheckInDate.Year == year.Value);
            }

            var result = await query
                .GroupBy(b => b.Listing)
                .Select(g => new
                {
                    ListingName = g.Key.Title,
                    Rating = g.Key.AverageRating ?? 0
                })
                .OrderByDescending(x => x.Rating)
                .Take(5)
                .ToListAsync();

            return new ListingRatingDTO
            {
                ListingName = result.Select(r => r.ListingName).ToList(),
                Rating = result.Select(r => r.Rating).ToList()
            };
        }
        #endregion

        #region Summary Metrics
        public async Task<int> GetTotalBookingsAsync(int? year)
        {
            var query = context.Bookings.Where(b => b.Status == BookingStatus.Confirmed);

            if (year.HasValue)
            {
                query = query.Where(b => b.CheckInDate.Year == year.Value);
            }

            return await query.CountAsync();
        }
        public async Task<decimal> GetTotalRevenueAsync(int? year)
        {
            var query = context.Bookings.Where(b => b.Status == BookingStatus.Confirmed);

            if (year.HasValue)
            {
                query = query.Where(b => b.CheckInDate.Year == year.Value);
            }

            return await query.AnyAsync()
                ? await query.SumAsync(b => b.TotalPrice)
                : 0;
        }
        public async Task<int> GetActiveUsersAsync(int year)
        {
            return await context.Users
                .Where(u => u.Bookings.Any(b => b.Status == BookingStatus.Confirmed && b.CheckInDate.Year == year))
                .CountAsync();
        }
        public async Task<decimal> GetAverageRatingAsync()
        {
            return await context.Listings.AnyAsync(l => l.AverageRating.HasValue)
                ? await context.Listings.AverageAsync(l => l.AverageRating ?? 0)
                : 0;
        }
        public async Task<TrendDTO> CalculateBookingTrendAsync(int? year, string period)
        {
            var currentPeriodQuery = context.Bookings.Where(b => b.Status == BookingStatus.Confirmed);

            if (year.HasValue)
            {
                currentPeriodQuery = currentPeriodQuery.Where(b => b.CheckInDate.Year == year.Value);
            }

            var previousPeriodQuery = ApplyPeriodFilter(currentPeriodQuery, period, -1);
            return await CalculateTrendAsync(currentPeriodQuery, previousPeriodQuery);
        }
        public async Task<TrendDTO> CalculateRevenueTrendAsync(int? year, string period)
        {
            var currentPeriodQuery = context.Bookings.Where(b => b.Status == BookingStatus.Confirmed);

            if (year.HasValue)
            {
                currentPeriodQuery = currentPeriodQuery.Where(b => b.CheckInDate.Year == year.Value);
            }

            var previousPeriodQuery = ApplyPeriodFilter(currentPeriodQuery, period, -1);

            var currentRevenue = await currentPeriodQuery.AnyAsync()
                ? await currentPeriodQuery.SumAsync(b => b.TotalPrice)
                : 0;

            var previousRevenue = await previousPeriodQuery.AnyAsync()
                ? await previousPeriodQuery.SumAsync(b => b.TotalPrice)
                : 0;

            var trendValue = currentRevenue - previousRevenue;
            var trendDirection = trendValue > 0 ? "up" : trendValue < 0 ? "down" : "stable";

            return new TrendDTO
            {
                Value = Math.Abs(trendValue),
                Direction = trendDirection
            };
        }
        public async Task<TrendDTO> CalculateUserTrendAsync(int year)
        {
            // Query for current period bookings based on confirmed status and the year
            var currentUsersQuery = context.Bookings
                .Where(b => b.Status == BookingStatus.Confirmed && b.CheckInDate.Year == year)
                .Select(b => b.GuestId)
                .Distinct();

            // Query for previous period bookings based on confirmed status and the previous year
            var previousUsersQuery = context.Bookings
                .Where(b => b.Status == BookingStatus.Confirmed && b.CheckInDate.Year == (year - 1))
                .Select(b => b.GuestId)
                .Distinct();

            // Use .AnyAsync() to check if the query contains any elements before executing count
            var currentUserCount = await currentUsersQuery.AnyAsync();
            var previousUserCount = await previousUsersQuery.AnyAsync();

            // If there are no users in the current or previous period, handle accordingly
            if (!currentUserCount && !previousUserCount)
            {
                return new TrendDTO
                {
                    Value = 0,
                    Direction = "stable"
                };
            }

            // If no current users, assume 0 trend for current period
            if (!currentUserCount)
            {
                return new TrendDTO
                {
                    Value = 0,
                    Direction = "down" // We assume a decrease from the previous year
                };
            }

            // If no previous users, assume 0 trend for previous period
            if (!previousUserCount)
            {
                return new TrendDTO
                {
                    Value = 0,
                    Direction = "up" // We assume an increase from the previous year
                };
            }

            // Proceed with the count if both queries have results
            var currentCount = await currentUsersQuery.CountAsync();
            var previousCount = await previousUsersQuery.CountAsync();

            // Calculate trend
            var trendValue = currentCount - previousCount;
            var trendDirection = trendValue > 0 ? "up" : trendValue < 0 ? "down" : "stable";

            return new TrendDTO
            {
                Value = Math.Abs(trendValue),
                Direction = trendDirection
            };
        }
        public async Task<TrendDTO> CalculateRatingTrendAsync(int year)
        {
            // Get current year rating (default to 0 if no data)
            var currentRatingQuery = context.Listings
                .Where(l => l.Bookings.Any(b => b.CheckInDate.Year == year));

            var currentRating = await currentRatingQuery.AnyAsync()
                ? await currentRatingQuery.AverageAsync(l => l.AverageRating ?? 0)
                : 0;

            // Get previous year rating (default to 0 if no data)
            var previousRatingQuery = context.Listings
                .Where(l => l.Bookings.Any(b => b.CheckInDate.Year == (year - 1)));

            var previousRating = await previousRatingQuery.AnyAsync()
                ? await previousRatingQuery.AverageAsync(l => l.AverageRating ?? 0)
                : 0;

            return new TrendDTO
            {
                Value = Math.Abs(currentRating - previousRating),
                Direction = currentRating > previousRating ? "up" : currentRating < previousRating ? "down" : "stable"
            };
        }
        public async Task<SummaryMetricsDTO> GetSummaryMetricsAsync(string period, int year)
        {
            var totalBookings = await GetTotalBookingsAsync(year);
            var totalRevenue = await GetTotalRevenueAsync(year);
            var activeUsers = await GetActiveUsersAsync(year);
            var avgRating = await GetAverageRatingAsync();
            var bookingTrend = await CalculateBookingTrendAsync(year, period);
            var revenueTrend = await CalculateRevenueTrendAsync(year, period);
            var userTrend = await CalculateUserTrendAsync(year);
            var ratingTrend = await CalculateRatingTrendAsync(year);
            return new SummaryMetricsDTO
            {
                TotalBookings = totalBookings,
                TotalRevenue = totalRevenue,
                ActiveUsers = activeUsers,
                AvgRating = avgRating,
                BookingTrend = bookingTrend,
                RevenueTrend = revenueTrend,
                UserTrend = userTrend,
                RatingTrend = ratingTrend
            };
        }
        #region Helper Methods
        private static IQueryable<Booking> ApplyPeriodFilter(IQueryable<Booking> query, string period, int yearOffset)
        {
            return period.ToLower() switch
            {
                "monthly" => query.Where(b => b.CheckInDate.Year == DateTime.Now.AddYears(yearOffset).Year &&
                                                                 b.CheckInDate.Month == DateTime.Now.AddMonths(yearOffset).Month),
                "yearly" => query.Where(b => b.CheckInDate.Year == DateTime.Now.AddYears(yearOffset).Year),
                "weekly" => query.Where(b => b.CheckInDate >= DateTime.Now.AddDays(-7 * yearOffset) && b.CheckInDate < DateTime.Now.AddDays(7 * (yearOffset + 1))),
                "daily" => query.Where(b => b.CheckInDate >= DateTime.Now.AddDays(yearOffset) && b.CheckInDate < DateTime.Now.AddDays(yearOffset + 1)),

                _ => throw new ArgumentException("Invalid period."),
            };
        }

        private static async Task<TrendDTO> CalculateTrendAsync(IQueryable<Booking> currentPeriodQuery, IQueryable<Booking> previousPeriodQuery)
        {
            var currentPeriodCount = await currentPeriodQuery.AnyAsync()
                ? await currentPeriodQuery.CountAsync()
                : 0;

            var previousPeriodCount = await previousPeriodQuery.AnyAsync()
                ? await previousPeriodQuery.CountAsync()
                : 0;

            var trendValue = currentPeriodCount - previousPeriodCount;
            var trendDirection = trendValue > 0 ? "up" : trendValue < 0 ? "down" : "stable";

            return new TrendDTO
            {
                Value = Math.Abs(trendValue),
                Direction = trendDirection
            };
        }
        #endregion
        #endregion
    }
}
