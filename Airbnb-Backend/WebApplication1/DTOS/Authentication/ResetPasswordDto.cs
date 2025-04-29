namespace WebApplication1.DTOS.Authentication
{
    public class ResetPasswordDto
    {
        public string Email { get; set; }
        public string ResetPasswordToken { get; set; }
        public DateTime? ResetPasswordTokenExpires { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
    }
}
