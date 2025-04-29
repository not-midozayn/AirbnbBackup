using WebApplication1.Models;

namespace WebApplication1.DTOS.ApplicationUser
{
    public class PostApplicationUserDto
    {
        public Guid Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public DateTime? CreatedAt { get; set; }

        public bool? IsVerified { get; set; }
        
    }
}
