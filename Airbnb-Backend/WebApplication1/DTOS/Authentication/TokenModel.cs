namespace WebApplication1.DTOS.Authentication
{
    public class TokenModel
    {
        public Guid Id { get; set; }
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }

    }
}
