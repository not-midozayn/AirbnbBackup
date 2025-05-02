using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOS.WishList;
using WebApplication1.Interfaces;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    //[Authorize]
    public class WishlistsController : ControllerBase
    {

        private readonly IWishListRepository wishlistRepo;
        private readonly IUserRepository irepo;

        public WishlistsController(IWishListRepository _wishlistRepo, IUserRepository _irepo)
        {
            wishlistRepo = _wishlistRepo;
            irepo = _irepo;
        }

        [HttpGet]
        public async Task<ActionResult<List<WishlistDto>>> GetWishlist()
        {
            if (!irepo.IsAuthenticated())
            {
                return Ok(new { message = "Not logged in" });
            }
            var userId = irepo.GetCurrentUserId();
            var wishlist = await wishlistRepo.GetUserWishlistsAsync(userId);
            return Ok(wishlist);
        }

        [HttpDelete]
        public async Task<ActionResult> DeleteWishlist()
        {
            try
            {
                if (!irepo.IsAuthenticated())
                {
                    return Ok(new { message = "Not logged in" });
                }

                var userId = irepo.GetCurrentUserId();
                await wishlistRepo.DeleteWishlistAsync(userId);
                return NoContent();
            }
            catch (KeyNotFoundException)
            {
                return NotFound();
            }
            catch (UnauthorizedAccessException)
            {
                return Forbid();
            }
        }

        [HttpPost("add")]
        public async Task<ActionResult<WishlistItemDto>> AddItemToWishlist(/*Guid wishlistId,*/ [FromBody] AddWishlistItemDto dto)
        {
            try
            {
                if (!irepo.IsAuthenticated())
                {
                    return Ok(new { message = "Not logged in" });
                }
                var userId = irepo.GetCurrentUserId();
                var wishlistDto = await wishlistRepo.GetUserWishlistsAsync(userId);
                var item = await wishlistRepo.AddItemToWishlistAsync(userId, dto.ListingId);
                return CreatedAtAction(nameof(GetWishlist), item);
            }
            catch (KeyNotFoundException ex)
            {
                return NotFound(ex.Message);
            }
            catch (UnauthorizedAccessException)
            {
                return Forbid();
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{itemId}")]
        public async Task<ActionResult> RemoveItemFromWishlist(/*Guid wishlistId,*/ Guid itemId)
        {
            try
            {
                if (!irepo.IsAuthenticated())
                {
                    return Ok(new { message = "Not logged in" });
                }
                var userId = irepo.GetCurrentUserId();
                await wishlistRepo.RemoveItemFromWishlistAsync(itemId, userId);
                return NoContent();
            }
            catch (KeyNotFoundException)
            {
                return NotFound();
            }
            catch (UnauthorizedAccessException)
            {
                return Forbid();
            }
        }
    }
}

