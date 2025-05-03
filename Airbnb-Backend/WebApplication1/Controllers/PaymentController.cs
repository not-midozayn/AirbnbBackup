using Humanizer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Stripe;
using Stripe.Checkout;
using WebApplication1.Configurations;
using WebApplication1.DTOS.Amenity;
using WebApplication1.DTOS.Authentication;
using WebApplication1.DTOS.Payment;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Models.Enums;
using WebApplication1.Repositories.Payment;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        #region Dependency Injection
        private readonly IStripe _stripeRepository;
        private readonly IPayment _paymentRepository;
        private readonly string _webhookSecret;

        public PaymentController(IStripe stripeRepository, IPayment paymentRepository, IOptions<StripeSettings> stripeSettings)
        {
            _stripeRepository = stripeRepository;
            _paymentRepository = paymentRepository;
            _webhookSecret = stripeSettings.Value.WebhookSecret;
        }
        #endregion

        #region Create Payment Intent
        [HttpPost("booking/{bookingId}/create-intent")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<IActionResult> CreatePaymentIntent(Guid bookingId, [FromBody] PaymentIntentRequestDTO request)
        {
            try
            {
                var intent = await _stripeRepository.CreatePaymentIntentAsync(bookingId, request);
                return Ok(intent);
            }
            catch (StripeException ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }
        #endregion

        #region Confirm Payment / Create
        [HttpPost("booking/{bookingId}/confirm")]
        public async Task<ActionResult<PaymentResponseDTO>> ConfirmPayment(Guid bookingId, [FromBody] ConfirmPaymentDTO dto)
        {
            try
            {
                var (intent, charge) = await _stripeRepository.ConfirmPaymentStripeAsync(bookingId, dto);
                var combinedData = (intent, charge, dto);
                var savedPayment = await _paymentRepository.CreatePaymentAsync(combinedData);
                if (Enum.TryParse<PaymentStatus>(savedPayment.Status, true, out var status) && status == PaymentStatus.Completed)
                {
                    await _paymentRepository.HandlePostPaymentSuccess(bookingId);
                }
                return Ok(savedPayment);
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }
        #endregion

        #region Cancel Payment Intent
        [HttpPost("cancel-intent/{paymentIntentId}")]
        [Authorize(Roles = $"{UserRoles.Guest}")]
        public async Task<IActionResult> CancelPaymentIntent(string paymentIntentId)
        {
            try
            {
                await _stripeRepository.CancelPaymentIntentAsync(paymentIntentId);
                return Ok(new { message = "Payment intent cancelled successfully." });
            }
            catch (StripeException ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }
        #endregion

        #region Get Methods
        [HttpGet]
        [Authorize(Roles = $"{UserRoles.Admin}")]
        public async Task<IActionResult> GetAllPayments([FromQuery] Dictionary<string, string> queryParams)
        {
            var payments = await _paymentRepository.GetAllAsync(queryParams);
            return Ok(payments);
        }
        [HttpGet("me")]
        [Authorize(Roles = $"{UserRoles.Guest},{UserRoles.Admin}")]
        public async Task<IActionResult> GetUserPayments()
        {
            var userId = _paymentRepository.GetCurrentUserId();
            var payments = await _paymentRepository.GetAllAsync(new Dictionary<string, string> { { "UserId", userId.ToString() } });
            return Ok(payments);
        }
        [HttpGet("{id}")]
        [Authorize(Roles = $"{UserRoles.Admin}")]
        public async Task<IActionResult> GetUserPaymentById(Guid id)
        {
            var payment = await _paymentRepository.GetByIDAsync(id);
            if (payment == null)
                return NotFound();
            return Ok(payment);
        }
        [HttpGet("{bookingId}/receipt")]
        [Authorize]
        public async Task<IActionResult> GetReceiptUrl(Guid bookingId)
        {
            try
            {
                var url = await _paymentRepository.GetReceiptUrlAsync(bookingId);
                return Ok(new { ReceiptUrl = url });
            }
            catch (Exception ex)
            {
                return BadRequest(new { ex.Message });
            }
        }
        #endregion

        #region Sessions

        [HttpPost("checkout-session/{bookingId}")]
        [Authorize(Roles = $"{UserRoles.Guest},{UserRoles.Admin}")]
        public async Task<IActionResult> CreateCheckoutSession(Guid bookingId, [FromBody] PaymentSessionRequestDTO dto)
        {
            try
            {
                var checkoutUrl = await _stripeRepository.CreateStripeCheckoutSession(bookingId, dto);
                return Ok(new { Url = checkoutUrl });
            }
            catch (Exception ex)
            {
                return BadRequest(new { Error = ex.Message });
            }
        }
        #endregion

        #region Webhook

        [HttpPost("webhook")]
        public async Task<IActionResult> Webhook()
        {
            var json = await new StreamReader(HttpContext.Request.Body).ReadToEndAsync();
            Event stripeEvent;
            try
            {
                var signatureHeader = Request.Headers["Stripe-Signature"];
                stripeEvent = EventUtility.ConstructEvent(json, signatureHeader, _webhookSecret);
            }
            catch (StripeException e)
            {
                return BadRequest($"⚠️ Webhook error: {e.Message}");
            }
            switch (stripeEvent.Type)
            {
                case "payment_intent.payment_failed":
                    if (stripeEvent.Data.Object is PaymentIntent failedIntent)
                    {
                        var charge = await _stripeRepository.GetCharge(failedIntent.LatestChargeId);
                        var combinedData = (failedIntent, charge, new ConfirmPaymentDTO { PaymentIntentId = failedIntent.Id });
                        await _paymentRepository.CreatePaymentAsync(combinedData);
                    }
                    break;
                case "checkout.session.completed":
                    if (stripeEvent.Data.Object is Session session)
                    {
                        await _paymentRepository.HandleCheckoutSessionCompleted(session.Id);
                    }
                    break;
            }
            return Ok();
        }
        #endregion
    }
}