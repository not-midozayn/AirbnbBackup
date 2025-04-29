namespace WebApplication1.DTOS.Payment
{
    public class PaymentResponseDTO
    {
        public Guid Id { get; set; }
        public decimal Amount { get; set; }
        public string TransactionId { get; set; }
        public string Status { get; set; }
        public DateTime? PaymentDate { get; set; }
        public string ReceiptUrl { get; set; }
        public string Currency { get; set; }
        public string PaymentMethod { get; set; }
    }
}
