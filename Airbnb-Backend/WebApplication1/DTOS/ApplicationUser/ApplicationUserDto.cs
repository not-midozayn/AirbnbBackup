using WebApplication1.Models;

namespace WebApplication1.DTOS.ApplicationUser
{
    public class ApplicationUserDto
    {
        public Guid Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string ProfilePictureUrl { get; set; }

        public DateTime? CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public string Bio { get; set; }

        public bool? IsHost { get; set; }

        public bool? IsVerified { get; set; }

        public int VerificationStatusId { get; set; }

        public bool? IsAdmin { get; set; }

        public DateTime? LastLogin { get; set; }

        public string PreferredLanguage { get; set; }

        public int? CurrencyId { get; set; }

        public virtual ICollection<Models.Booking> Bookings { get; set; } = new List<Models.Booking>();

        public virtual Currency Currency { get; set; }

        public virtual ICollection<Models.Listing> Listings { get; set; } = new List<Models.Listing>();

        public virtual ICollection<Message> MessageRecipients { get; set; } = new List<Message>();

        public virtual ICollection<Message> MessageSenders { get; set; } = new List<Message>();

        public virtual ICollection<Models.Payment> Payments { get; set; } = new List<Models.Payment>();

        public virtual ICollection<Models.Review> ReviewHosts { get; set; } = new List<Models.Review>();

        public virtual ICollection<Models.Review> ReviewReviewers { get; set; } = new List<Models.Review>();

        public virtual VerificationStatus VerificationStatus { get; set; }

        public virtual ICollection<Wishlist> Wishlists { get; set; } = new List<Wishlist>();
    }
}