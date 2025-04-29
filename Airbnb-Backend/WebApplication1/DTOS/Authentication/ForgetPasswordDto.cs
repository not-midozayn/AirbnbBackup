namespace WebApplication1.DTOS.Authentication
{
    public class ForgetPasswordDto
    {
        public string Email { get; set; }
        public string ForgotPasswordToken { get; set; }
        public DateTime? ForgetPasswordTokenExpires { get; set; }
    }
}
