using WebApplication1.Models.Enums;

namespace WebApplication1.DTOS.Payment
{
    public class CreatePaymentDTO
    {
        public string TransactionId { get; set; }
        public Guid BookingId { get; set; }
        public Guid UserId { get; set; }
        public int PaymentMethodId { get; set; } = 1;
        public decimal Amount { get; set; }
        public int CurrencyId { get; set; }
        public PaymentType PaymentType { get; set; }
        public string ReceiptUrl { get; set; }
        public PaymentStatus Status { get; set; }
        public string FailureMessage { get; set; }
        public DateTime? PaymentDate { get; set; }
        public DateTime? ProccessedAt { get; set; }
    }
}