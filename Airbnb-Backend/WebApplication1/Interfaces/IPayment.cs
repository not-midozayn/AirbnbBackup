using Stripe;
using WebApplication1.DTOS.Payment;
using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IPayment : IRepository<Payment>
    {
        Task<PaymentResponseDTO> CreatePaymentAsync((PaymentIntent intent, Charge charge, ConfirmPaymentDTO dto) source);
        Task HandlePostPaymentSuccess(Guid bookingId);
        Task MarkPaymentAsRefundedAsync(Payment payment);
        Task RefundBookingPaymentAsync(Booking booking);
        Task<PaymentResponseDTO> HandleCheckoutSessionCompleted(string sessionId);
        Task<decimal> GetRefundAmountAsync(Guid bookingId);
        Task<string> GetReceiptUrlAsync(Guid bookingId);
    }
}
