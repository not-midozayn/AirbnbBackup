using WebApplication1.Models.Enums;

namespace WebApplication1.DTOS.Payment
{
    public class PaymentSessionRequestDTO
    {
        public PaymentType PaymentType { get; set; }
        public int PaymentMethodId { get; set; }
    }
}
