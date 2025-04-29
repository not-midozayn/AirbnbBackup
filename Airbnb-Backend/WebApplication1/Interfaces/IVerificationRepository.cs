using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IVerificationRepository
    {
        // Interface for verification-related operations
        // Get verification status by ID
        VerificationStatus GetVerificationStatus(int statusId);

        // Get the ID for "In Progress" status - separate method for reusability and consistency
        int GetInProgressStatusId();

        // Submit verification documents - returns boolean for success/failure
        bool SubmitVerificationDocuments(Guid userId, List<IFormFile> documents, string documentType, string additionalInfo);
    }
}
