using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOS.Statistics;
using WebApplication1.Interfaces;
using WebApplication1.Repositories;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StatisticsController : ControllerBase
    {
        #region Dependency Injection
        private readonly IStatistics _statisticsRepository;

        public StatisticsController(IStatistics statisticsRepository)
        {
            _statisticsRepository = statisticsRepository;
        }
        #endregion

        #region Booking Statistics
        [HttpGet("bookings")]
        public async Task<IActionResult> GetBookingsByPeriod([FromQuery] string period, [FromQuery] int year)
        {
            if (string.IsNullOrWhiteSpace(period))
                return BadRequest("Period is required. Options: daily, weekly, monthly, yearly.");

            try
            {
                var data = await _statisticsRepository.GetBookingsByPeriodAsync(period, year);
                return Ok(data);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        #endregion

        #region Revenue Statistics
        [HttpGet("revenue")]
        public async Task<IActionResult> GetRevenueByPeriod([FromQuery] string period, [FromQuery] int year)
        {
            try
            {
                var revenueData = await _statisticsRepository.GetRevenueByPeriodAsync(year,period);
                return Ok(revenueData);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message); 
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message); 
            }
        }
        #endregion

        #region Top Hosts
        [HttpGet("top-hosts")]
        public async Task<IActionResult> GetTopHosts([FromQuery] int year)
        {
            try
            {
                var data = await _statisticsRepository.GetTopHostsAsync(5,year);
                return Ok(data);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region User Role Distribution
        [HttpGet("role-distribution")]
        public async Task<IActionResult> GetRoleDistribution()
        {
            var data = await _statisticsRepository.GetRoleDistributionAsync();
            return Ok(data);
        }
        #endregion

        #region Top Listing by Rating
        [HttpGet("top-listings")]
        public async Task<IActionResult> GetTopListings([FromQuery] int year)
        {
            try
            {
                var data = await _statisticsRepository.GetListingsWithRatingsAsync(year);
                return Ok(data);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Summary Metrics
        [HttpGet("summary-metrics")]
        public async Task<ActionResult<SummaryMetricsDTO>> GetSummaryMetricsAsync([FromQuery]string period, [FromQuery]int year)
        {
            try
            {
                var summaryMetrics = await _statisticsRepository.GetSummaryMetricsAsync(period, year);
                return Ok(summaryMetrics);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        #endregion
    }
}
