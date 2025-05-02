using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOS.WishList;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class WishListRepository : IWishListRepository
    {
        private readonly AirbnbDBContext context;

        public WishListRepository(AirbnbDBContext _context)
        {
            context = _context;
        }

        //public async Task<WishlistDto> GetUserWishlistsAsync(Guid userId)
        //{
        //    var wishlist = await context.Wishlists
        //        .FirstOrDefaultAsync(w => w.UserId == userId);
        //    return new WishlistDto
        //    {
        //        Id = wishlist.Id,
        //        Name = wishlist.Name,
        //        IsPublic = wishlist.IsPublic ?? false,
        //        CreatedAt = wishlist.CreatedAt ?? DateTime.UtcNow,
        //        WishlistItems = wishlist.WishlistItems
        //    };
        //}

        public async Task<WishlistDto> GetUserWishlistsAsync(Guid userId)
        {
            var wishlist = await context.Wishlists
                .Include(w => w.WishlistItems)
                .FirstOrDefaultAsync(w => w.UserId == userId);

            if (wishlist == null)
            {
                var newWishlist = new Wishlist
                {
                    Id = Guid.NewGuid(),
                    UserId = userId,
                    Name = "Wishlist",
                    IsPublic = true,
                    CreatedAt = DateTime.UtcNow
                };

                context.Wishlists.Add(newWishlist);
                await context.SaveChangesAsync();

                return new WishlistDto
                {
                    Id = newWishlist.Id,
                    Name = newWishlist.Name,
                    IsPublic = newWishlist.IsPublic ?? false,
                    CreatedAt = newWishlist.CreatedAt ?? DateTime.UtcNow,
                    WishlistItems = new List<WishlistItemDto>()
                };
            }

            return new WishlistDto
            {
                Id = wishlist.Id,
                Name = wishlist.Name,
                IsPublic = wishlist.IsPublic ?? false,
                CreatedAt = wishlist.CreatedAt ?? DateTime.UtcNow,
                WishlistItems = wishlist.WishlistItems.Select(wi => new WishlistItemDto
                {
                    Id = wi.Id,
                    ListingId = wi.ListingId,
                    ListingTitle = wi.Listing?.Title ?? "Unknown",
                    ListingPhotos = wi.Listing?.ListingPhotos ?? new List<ListingPhoto>(),
                    ListingPricePerNight = wi.Listing?.PricePerNight ?? 0,
                    AddedAt = wi.AddedAt ?? DateTime.UtcNow
                }).ToList()

            };
        }

        //public async Task<WishlistDetailDto> GetWishlistByIdAsync(Guid wishlistId, Guid userId)
        //{   
        //    var wishlist = await context.Wishlists
        //        .Include(w => w.WishlistItems)
        //            .ThenInclude(wi => wi.Listing)
        //        .FirstOrDefaultAsync(w => w.Id == wishlistId);

        //    if (wishlist == null)
        //    {
        //        throw new KeyNotFoundException("Wishlist not found");
        //    }

        //    // Check if user can view this wishlist
        //    if (wishlist.UserId != userId && !(wishlist.IsPublic ?? false))
        //    {
        //        throw new UnauthorizedAccessException("You cannot view this wishlist");
        //    }

        //    return new WishlistDetailDto
        //    {
        //        Id = wishlist.Id,
        //        Name = wishlist.Name,
        //        IsPublic = wishlist.IsPublic ?? false,
        //        CreatedAt = wishlist.CreatedAt ?? DateTime.UtcNow,
        //        Items = wishlist.WishlistItems.Select(wi => new WishlistItemDto
        //        {
        //            Id = wi.Id,
        //            ListingId = wi.ListingId,
        //            ListingTitle = wi.Listing.Title,
        //            ListingPhotos = wi.Listing.ListingPhotos,
        //            ListingPricePerNight = wi.Listing.PricePerNight,
        //            AddedAt = wi.AddedAt ?? DateTime.UtcNow
        //        }).ToList()
        //    };
        //}

        //public async Task<WishlistDto> CreateWishlistAsync(Guid userId/*, string name, bool isPublic*/)
        //{
        //    var NewWishlist = new Wishlist
        //    {
        //        Id = Guid.NewGuid(),
        //        UserId = userId,
        //        Name = "Wishlist",
        //        IsPublic = true,
        //        CreatedAt = DateTime.UtcNow
        //    };

        //    context.Wishlists.Add(NewWishlist);
        //    await context.SaveChangesAsync();
        //    return new WishlistDto
        //    {
        //        Id = NewWishlist.Id,
        //        Name = NewWishlist.Name,
        //        IsPublic = NewWishlist.IsPublic ?? false,
        //        CreatedAt = NewWishlist.CreatedAt ?? DateTime.UtcNow,
        //    };
        //}

        //public async Task<WishlistDto> UpdateWishlistAsync(Guid wishlistId, Guid userId, string name, bool isPublic)
        //{
        //    var wishlist = await context.Wishlists
        //        .Include(w => w.WishlistItems)
        //        .FirstOrDefaultAsync(w => w.Id == wishlistId);

        //    if (wishlist == null)
        //    {
        //        throw new KeyNotFoundException("Wishlist not found");
        //    }

        //    if (wishlist.UserId != userId)
        //    {
        //        throw new UnauthorizedAccessException("You cannot update this wishlist");
        //    }

        //    wishlist.Name = name;
        //    wishlist.IsPublic = isPublic;

        //    await context.SaveChangesAsync();

        //    return new WishlistDto
        //    {
        //        Id = wishlist.Id,
        //        Name = wishlist.Name,
        //        IsPublic = wishlist.IsPublic ?? false,
        //        CreatedAt = wishlist.CreatedAt ?? DateTime.UtcNow,
        //        ItemCount = wishlist.WishlistItems.Count
        //    };
        //}

        public async Task DeleteWishlistAsync(/*Guid wishlistId,*/ Guid userId)
        {
            var wishlist = await context.Wishlists
                .FirstOrDefaultAsync(w => w.UserId == userId);

            if (wishlist == null)
            {
                throw new KeyNotFoundException("Wishlist not found");
            }

            //if (wishlist.UserId != userId)
            //{
            //    throw new UnauthorizedAccessException("You cannot delete this wishlist");
            //}

            context.Wishlists.Remove(wishlist);
            await context.SaveChangesAsync();
        }

        public async Task<WishlistItemDto> AddItemToWishlistAsync(Guid userId, Guid listingId)
        {
            var wishlist = await GetUserWishlistsAsync(userId); 
            var listing = await context.Listings.FirstOrDefaultAsync(l => l.Id == listingId);
            if (listing == null)
            {
                throw new KeyNotFoundException("Listing not found");
            }
            var existingItem = await context.WishlistItems.FirstOrDefaultAsync(wi => wi.ListingId == listingId && wishlist.Id == wi.WishlistId);
            if (existingItem != null)
            {
                throw new InvalidOperationException("This item is already in your wishlist");
            }

            var newWishlistItem = new WishlistItem
            {
                Id = Guid.NewGuid(),
                WishlistId = wishlist.Id, 
                ListingId = listingId,
                AddedAt = DateTime.UtcNow
            };

            context.WishlistItems.Add(newWishlistItem);
            await context.SaveChangesAsync();

            return new WishlistItemDto
            {
                Id = newWishlistItem.Id,
                ListingId = listing.Id,
                ListingTitle = listing.Title,
                ListingPhotos = listing.ListingPhotos,
                ListingPricePerNight = listing.PricePerNight,
                AddedAt = newWishlistItem.AddedAt ?? DateTime.UtcNow
            };
        }

        public async Task RemoveItemFromWishlistAsync(/*Guid wishlistId,*/ Guid listingId, Guid userId)
        {
            var listing = await context.Listings
               .FirstOrDefaultAsync(l => l.Id == listingId);
            if (listing == null)
            {
                throw new KeyNotFoundException("Listing not found");
            }
            var wishlist = await context.Wishlists
                .FirstOrDefaultAsync(w => w.UserId == userId);
            if (wishlist == null)
            {
                throw new KeyNotFoundException("Wishlist not found");
            }

            var deletedItem = await context.WishlistItems
                .FirstOrDefaultAsync(wi => wi.ListingId == listingId);

            if (deletedItem == null)
            {
                throw new InvalidOperationException("This item doesn't exist in your wishlist");
            }

            context.WishlistItems.Remove(deletedItem);
            await context.SaveChangesAsync();
        }
    }

}
