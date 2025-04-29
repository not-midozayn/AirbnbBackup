using Stripe;
using Stripe.Checkout;
using WebApplication1.DTOS.Payment;

namespace WebApplication1.Interfaces
{
    public interface IStripe
    {
        Task<PaymentIntentResponseDTO> CreatePaymentIntentAsync(Guid bookingId,PaymentIntentRequestDTO request);
        Task CancelPaymentIntentAsync(string paymentIntentId);
        Task<(PaymentIntent intent, Charge charge)> ConfirmPaymentStripeAsync(Guid bookingId,ConfirmPaymentDTO dto);
        Task RefundAsync(string transactionId, long amountInCents);
        Task<string> CreateStripeCheckoutSession(Guid bookingId, PaymentSessionRequestDTO request);
        Task<Session> GetSession(string sessionId);
        Task<PaymentIntent> GetPaymentIntent(string paymentIntentId);
        Task<Charge> GetCharge(string chargeId);

        #region Webhook
        //Task HandleCheckoutSessionCompleted(string sessionId);
        //Task HandleCheckoutSessionFailed(string sessionId);
        //Task HandleCheckoutSessionSucceeded(string sessionId);
        //Task HandlePaymentFailed(string paymentIntentId);
        //Task HandlePaymentSucceeded(string paymentIntentId);
        //Task HandlePaymentRefunded(string paymentIntentId);
        #endregion

    }
}