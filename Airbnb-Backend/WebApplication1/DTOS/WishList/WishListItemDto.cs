using WebApplication1.Models;

namespace WebApplication1.DTOS.WishList
{
    public class WishlistItemDto
    {
        public Guid Id { get; set; }
        public Guid ListingId { get; set; }
        public string ListingTitle { get; set; }
        public virtual ICollection<ListingPhoto> ListingPhotos { get; set; } = new List<ListingPhoto>();
        public decimal ListingPricePerNight { get; set; }
        public DateTime AddedAt { get; set; }
    }
}
