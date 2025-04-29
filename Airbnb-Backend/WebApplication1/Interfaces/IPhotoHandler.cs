namespace WebApplication1.Interfaces
{
    public interface IPhotoHandler
    {
        Task<string> UploadPhotoAsync(IFormFile file);
        Task<IEnumerable<string>> UploadMultiplePhotosAsync(IEnumerable<IFormFile> files);
        Task DeletePhotoAsync(Guid id);
    }
}