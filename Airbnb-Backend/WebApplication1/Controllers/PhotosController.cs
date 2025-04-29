using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Repositories;
using WebApplication1.DTOS.Listing;
using System.Reflection;

namespace WebApplication1.Controllers
{
    [Route("api/listings/{listingId}/photos")]
    [ApiController]
    //[Authorize]
    public class PhotosController : ControllerBase
    {
        #region Dependency Injection
        private readonly IRepository<ListingPhoto> _irepo;
        private readonly IMapper _mapper;
        private readonly PhotosRepository _photosRepository;
        private readonly AirbnbDBContext _context;
        public PhotosController(IRepository<ListingPhoto> irepo, IMapper mapper, PhotosRepository photosRepository, AirbnbDBContext context)
        {
            _irepo = irepo;
            _mapper = mapper;
            _photosRepository = photosRepository;
            _context = context;
        }
        #endregion

        #region Uplaod Photos 
        [HttpPost]
        public async Task<IActionResult> UploadPhotosToListing(Guid listingId, [FromForm] List<UploadListingPhotoDTO> photos)
        {
            if (photos == null || photos.Count == 0)
                return BadRequest("No photos uploaded.");

            var listing = await _context.Listings.Include(l => l.ListingPhotos).FirstOrDefaultAsync(l => l.Id == listingId);
            if (listing == null)
                return NotFound("Listing not found.");

            int startingOrder = listing.ListingPhotos.Count != 0
                ? listing.ListingPhotos.Max(p => p.DisplayOrder ?? 0) + 1
                : 1;

            var newPhotos = new List<ListingPhoto>();

            for (int i = 0; i < photos.Count; i++)
            {
                var photoDto = photos[i];
                var photoUrl = await _photosRepository.UploadPhotoAsync(photoDto.File);

                newPhotos.Add(new ListingPhoto
                {
                    ListingId = listingId,
                    Url = photoUrl,
                    Caption = photoDto.Caption,
                    UploadedAt = DateTime.UtcNow,
                    DisplayOrder = startingOrder + i,
                    IsPrimary = listing.ListingPhotos.Count == 0 && i == 0
                });
            }

            _context.ListingPhotos.AddRange(newPhotos);
            await _context.SaveChangesAsync();

            return Ok(newPhotos);
        }
        #endregion

        #region UpdatePhotoes HttpPut
        [HttpPut("replace")]
        public async Task<IActionResult> UpdateListingPhotoes(Guid listingId, [FromForm] List<UploadListingPhotoDTO> photos)
        {
            if (photos == null || !photos.Any())
                return BadRequest("Photos are required.");

            var listing = await _context.Listings
                .Include(l => l.ListingPhotos)
                .FirstOrDefaultAsync(l => l.Id == listingId);

            if (listing == null)
                return NotFound("Listing not found.");

            // Store old URLs for potential cleanup
            var oldPhotoUrls = listing.ListingPhotos.Select(p => p.Url).ToList();

            // Remove all existing photos
            _context.ListingPhotos.RemoveRange(listing.ListingPhotos);
            listing.ListingPhotos.Clear();

            // Add all the new photos
            var addedPhotos = new List<ListingPhoto>();
            for (int i = 0; i < photos.Count; i++)
            {
                if (photos[i]?.File != null)
                {
                    var photoUrl = await _photosRepository.UploadPhotoAsync(photos[i].File);

                    var newPhoto = new ListingPhoto
                    {
                        ListingId = listingId,
                        Url = photoUrl,
                        Caption = photos[i].Caption,
                        UploadedAt = DateTime.UtcNow,
                        DisplayOrder = i + 1, // Simple sequential order
                        IsPrimary = i == 0    // First photo is primary
                    };

                    listing.ListingPhotos.Add(newPhoto);
                    addedPhotos.Add(newPhoto);
                }
            }

            await _context.SaveChangesAsync();

            // Optional: Remove old photo files that are no longer used
            // Uncomment if you want to delete the actual files from storage
            /*
            foreach (var oldUrl in oldPhotoUrls)
            {
                await _photosRepository.DeletePhotoAsync(oldUrl);
            }
            */

            return Ok(new
            {
                Message = $"Replaced all photos. Added {addedPhotos.Count} new photos.",
                Photos = addedPhotos
            });
        }
        #endregion

        #region Update Photo Details

        [HttpPut("{photoId}")]
        public async Task<IActionResult> UpdatePhotoDetails(Guid listingId, Guid photoId, [FromBody] string newCaption)
        {
            var photo = await _context.ListingPhotos
                .FirstOrDefaultAsync(p => p.Id == photoId && p.ListingId == listingId);

            if (photo == null)
                return NotFound("Photo not found.");

            photo.Caption = newCaption;
            await _context.SaveChangesAsync();

            return Ok(photo);
        }
        #endregion

        #region Set Primary Photo
        [HttpPut("{photoId}/set-primary")]
        public async Task<IActionResult> SetPrimaryPhoto(Guid listingId, Guid photoId)
        {
            var listing = await _context.Listings.Include(l => l.ListingPhotos)
                                                  .FirstOrDefaultAsync(l => l.Id == listingId);
            if (listing == null)
            {
                return NotFound("Listing not found.");
            }
            var photoToSetAsPrimary = listing.ListingPhotos.FirstOrDefault(p => p.Id == photoId);
            if (photoToSetAsPrimary == null)
            {
                return NotFound("Photo not found.");
            }
            SetPrimaryPhotoHelper(listing.ListingPhotos, photoId);

            _context.ListingPhotos.UpdateRange(listing.ListingPhotos);
            Console.WriteLine($"Setting photo {photoId} as primary for listing {listingId}");
            Console.WriteLine($"Primary photo ID: {photoToSetAsPrimary.Id}");
            Console.WriteLine($"{listing.ListingPhotos}");

            await _context.SaveChangesAsync();

            return Ok(new { Message = "Primary photo updated successfully." });
        }
        #endregion

        #region Helper Methods
        private void SetPrimaryPhotoHelper(ICollection<ListingPhoto> photos, Guid primaryPhotoId)
        {
            var primaryPhoto = photos.FirstOrDefault(p => p.Id == primaryPhotoId);
            var currentPrimaryPhoto = photos.FirstOrDefault(p => p.IsPrimary == true);

            if (currentPrimaryPhoto != null)
            {
                currentPrimaryPhoto.IsPrimary = false;
                _context.ListingPhotos.Update(currentPrimaryPhoto);
            }

            if (primaryPhoto != null)
            {
                if (currentPrimaryPhoto != null)
                {
                    int tempDisplayOrder = primaryPhoto.DisplayOrder ?? 1;
                    primaryPhoto.DisplayOrder = currentPrimaryPhoto.DisplayOrder;
                    currentPrimaryPhoto.DisplayOrder = tempDisplayOrder;
                }

                primaryPhoto.IsPrimary = true;
            }
        }
        #endregion

        #region Delete Photo

        [HttpDelete("{photoId}")]
        public async Task<IActionResult> DeletePhoto(Guid listingId, Guid photoId)
        {
            try
            {
                await _photosRepository.DeletePhotoAsync(photoId);
                return NoContent();
            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);
            }
        }
        #endregion
    }
}
