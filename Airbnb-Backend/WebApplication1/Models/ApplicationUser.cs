using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using WebApplication1.Models.ChatBot;

namespace WebApplication1.Models
{
    public class ApplicationUser : IdentityUser<Guid>
    {
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
        public virtual ICollection<Booking> Bookings { get; set; }
        public virtual Currency Currency { get; set; }
        public virtual ICollection<Listing> Listings { get; set; }
        [NotMapped]
        public virtual ICollection<Message> MessageRecipients { get; set; } = new List<Message>();
        [NotMapped]
        public virtual ICollection<Message> MessageSenders { get; set; } = new List<Message>();

        public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
        [NotMapped]
        public virtual ICollection<Review> ReviewHosts { get; set; } = new List<Review>();
        [NotMapped]
        public virtual ICollection<Review> ReviewReviewers { get; set; }
        public virtual ICollection<Conversation> Conversations { get; set; } = new List<Conversation>();
        public virtual VerificationStatus VerificationStatus { get; set; }
        public virtual Wishlist Wishlist { get; set; }
    }
}
