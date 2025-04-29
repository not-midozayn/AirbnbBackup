using WebApplication1.DTOS.WishList;

namespace WebApplication1.Interfaces
{
    public interface IWishListRepository
    {
        Task<WishlistDto> GetUserWishlistsAsync(Guid userId);
        //Task<WishlistDetailDto> GetWishlistByIdAsync(Guid wishlistId, Guid userId);
        //Task<WishlistDto> CreateWishlistAsync(Guid userId/*, string name, bool isPublic*/);
        //Task<WishlistDto> UpdateWishlistAsync(Guid wishlistId, Guid userId, string name, bool isPublic);
        Task DeleteWishlistAsync(/*Guid wishlistId,*/ Guid userId);
        Task<WishlistItemDto> AddItemToWishlistAsync(/*Guid wishlistId,*/ Guid userId, Guid listingId);
        Task RemoveItemFromWishlistAsync(/*Guid wishlistId,*/ Guid itemId, Guid userId);
    }
}
