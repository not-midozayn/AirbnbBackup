using WebApplication1.Models;

namespace WebApplication1.DTOS.ApplicationUser
{
    public class GetApplicationUserDto
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProfilePictureUrl { get; set; }
        public string Bio { get; set; }
        public bool? IsHost { get; set; }
        public bool? IsVerified { get; set; }        
    }
}
