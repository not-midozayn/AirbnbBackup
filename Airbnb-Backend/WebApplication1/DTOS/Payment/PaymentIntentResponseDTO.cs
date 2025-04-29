namespace WebApplication1.DTOS.Payment
{
    public class PaymentIntentResponseDTO
    {
        public string ClientSecret { get; set; }
        public string Status { get; set; }
        public string PaymentIntentId { get; set; }
    }
}