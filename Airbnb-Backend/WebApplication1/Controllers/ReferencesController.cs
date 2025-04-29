using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReferencesController : ControllerBase
    {
        #region Dependency Injection
        private readonly IRepository<CancellationPolicy> _CancellationIRepo;
        private readonly IRepository<Currency> _currencyIRepo;
        private readonly IRepository<PaymentMethod> _paymentMethodIRepo;

        public ReferencesController(IRepository<CancellationPolicy> irepo, IRepository<Currency> currencyIRepo,IRepository<PaymentMethod> paymentMethodIRepo)
        {
            _CancellationIRepo = irepo;
            _currencyIRepo = currencyIRepo;
            _paymentMethodIRepo = paymentMethodIRepo;
        }
        #endregion

        [HttpGet("cancellation-policy")]
        [Authorize(Roles = "Admin,Host")]
        public async Task<ActionResult<IEnumerable<CancellationPolicy>>> GetCancellationPolicy([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                var cancellationPolicies = await _CancellationIRepo.GetAllAsync(queryParams);
                return Ok(cancellationPolicies);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        [HttpGet("currency")]

        public async Task<ActionResult<IEnumerable<Currency>>> GetCurrency([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                var currencies = await _currencyIRepo.GetAllAsync(queryParams);
                return Ok(currencies);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        [HttpGet("payment-method")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<PaymentMethod>>> GetPaymentMethod([FromQuery] Dictionary<string, string> queryParams)
        {
            try
            {
                var paymentMethods = await _paymentMethodIRepo.GetAllAsync(queryParams);
                return Ok(paymentMethods);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

    }
}
