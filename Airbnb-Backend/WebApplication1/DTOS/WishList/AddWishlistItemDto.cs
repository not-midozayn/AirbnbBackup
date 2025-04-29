using System.ComponentModel.DataAnnotations;

namespace WebApplication1.DTOS.WishList
{
    public class AddWishlistItemDto
    {
        [Required]
        public Guid ListingId { get; set; }
    }
}
