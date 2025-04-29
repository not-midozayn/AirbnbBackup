using System.ComponentModel.DataAnnotations;

namespace WebApplication1.DTOS.WishList
{
    public class UpdateWishlistDto
    {
        [Required]
        [StringLength(100, MinimumLength = 1)]
        public string Name { get; set; }

        public bool IsPublic { get; set; }
    }
}
