using WebApplication1.DTOS.Statistics;
using WebApplication1.Models.Enums;

namespace WebApplication1.Interfaces
{
    public interface IStatistics
    {
        Task<UserRoleDitributionDTO> GetRoleDistributionAsync();
        Task<TopHostsDTO> GetTopHostsAsync(int topN , int? year);
        Task<BookingPerMonthDTO> GetBookingsByPeriodAsync(string period, int? year);
        Task<RevenueTrendDTO> GetRevenueByPeriodAsync(int year, string period);
        Task<ListingRatingDTO> GetListingsWithRatingsAsync(int? year = null);
        Task<int> GetTotalBookingsAsync(int? year);
        Task<decimal> GetTotalRevenueAsync(int? year);
        Task<int> GetActiveUsersAsync(int year);
        Task<decimal> GetAverageRatingAsync();
        Task<TrendDTO> CalculateRatingTrendAsync(int year);
        Task<TrendDTO> CalculateUserTrendAsync(int year);
        Task<TrendDTO> CalculateBookingTrendAsync(int? year, string period);
        Task<TrendDTO> CalculateRevenueTrendAsync(int? year, string period);
        Task<SummaryMetricsDTO> GetSummaryMetricsAsync(string period, int year);
    }
}