using AutoMapper;
using Azure.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class PhotosRepository : IPhotoHandler
    {
        #region Dependency Injection
        private readonly IWebHostEnvironment _environment;
        private readonly AirbnbDBContext _context;
        public PhotosRepository(IWebHostEnvironment env, AirbnbDBContext context)
        {
            _environment = env;
            _context = context;

        }
        #endregion

        #region Helper Methods
        private static bool IsValidImageFile(IFormFile file)
        {
            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif" };
            var fileExtension = Path.GetExtension(file.FileName).ToLowerInvariant();

            if (string.IsNullOrEmpty(fileExtension) || !allowedExtensions.Contains(fileExtension))
                return false;

            return true;
        }
        private void DeletePhotoFileFromDisk(string photoUrl)
        {
            var filePath = Path.Combine(_environment.WebRootPath, photoUrl);
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        private async Task ReorderDisplayOrdersAsync(Guid listingId)
        {
            var photos = await _context.ListingPhotos
                .Where(p => p.ListingId == listingId)
                .OrderBy(p => p.DisplayOrder)
                .ToListAsync();

            for (int i = 0; i < photos.Count; i++)
            {
                photos[i].DisplayOrder = i + 1;
            }

            await _context.SaveChangesAsync();
        }
        private async Task AssignNewPrimaryPhotoAsync(Guid listingId)
        {
            var photos = await _context.ListingPhotos
                .Where(p => p.ListingId == listingId)
                .OrderBy(p => p.DisplayOrder)
                .ToListAsync();

            if (photos.Count == 0) return;

            foreach (var p in photos)
                p.IsPrimary = false;

            photos[0].IsPrimary = true;

            await _context.SaveChangesAsync();
        }

        #endregion

        #region Upload Methods
        public async Task<string> UploadPhotoAsync(IFormFile file)
        {
            if (file == null || file.Length == 0)
                throw new ArgumentException("Invalid file.");
            if (!IsValidImageFile(file))
                throw new ArgumentException("Invalid file type. Only image files are allowed.");
            if (file.Length > 5 * 1024 * 1024)
                throw new ArgumentException("File size exceeds the limit (5MB)");

            string uploadsFolder = Path.Combine(_environment.WebRootPath, "uploads");
            if (!Directory.Exists(uploadsFolder))
                Directory.CreateDirectory(uploadsFolder);
            string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
            string filePath = Path.Combine(uploadsFolder, uniqueFileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(fileStream);
            }
            return Path.Combine("uploads", uniqueFileName).Replace("\\", "/");
        }
        public async Task<IEnumerable<string>> UploadMultiplePhotosAsync(IEnumerable<IFormFile> files)
        {
            var uploadedPhotos = new List<string>();
            foreach (var file in files)
            {
                var url = await UploadPhotoAsync(file);
                uploadedPhotos.Add(url);
            }
            return uploadedPhotos;
        }
        #endregion

        #region Delete Methods
        public async Task DeletePhotoAsync(Guid photoId)
        {
            var photo = await _context.ListingPhotos.FindAsync(photoId);
            if (photo == null)
                throw new Exception("Photo not found.");

            var listingId = photo.ListingId;
            bool wasPrimary = photo.IsPrimary == true;

            DeletePhotoFileFromDisk(photo.Url);

            _context.ListingPhotos.Remove(photo);
            await _context.SaveChangesAsync();

            await ReorderDisplayOrdersAsync(listingId);

            if (wasPrimary)
                await AssignNewPrimaryPhotoAsync(listingId);
        }
        #endregion
    }
}
