using WebApplication1.Models;

namespace WebApplication1.DTOS.WishList
{
    public class WishlistDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public bool IsPublic { get; set; }
        public DateTime CreatedAt { get; set; }
        public int ItemCount { get; set; }
        public virtual ICollection<WishlistItemDto> WishlistItems { get; set; } 

    }
}
