using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class VerificationRepository : IVerificationRepository
    {
        private readonly IWebHostEnvironment _environment; // For file path operations
        private readonly AirbnbDBContext _context; // Database context

        // Constructor with dependency injection
        public VerificationRepository(IWebHostEnvironment environment, AirbnbDBContext context)
        {
            _environment = environment;
            _context = context;
        }

        // Get verification status by ID
        public VerificationStatus GetVerificationStatus(int statusId)
        {
            // Use Find for efficient primary key lookup
            return _context.VerificationStatuses.Find(statusId);
        }

        // Get ID for "In Progress" status
        public int GetInProgressStatusId()
        {
            // Find status by name using LINQ
            var status = _context.VerificationStatuses
                .FirstOrDefault(vs => vs.Value == "In Progress");

            // Return status ID if found, otherwise default to 2
            // Default value provides fallback if database lookup fails
            return status?.Id ?? 2; // Null conditional operator with null coalescing
        }

        // Submit verification documents
        public bool SubmitVerificationDocuments(Guid userId, List<IFormFile> documents, string documentType, string additionalInfo)
        {
            //// Create directory for verification documents
            //// Organizing by userId creates a clean folder structure
            //var uploadsFolder = Path.Combine(_environment.WebRootPath, "uploads", "verification", userId.ToString());
            //Directory.CreateDirectory(uploadsFolder);

            //// Process each uploaded document
            //foreach (var document in documents)
            //{
            //    // Create unique filename with document type and timestamp
            //    var fileName = $"{documentType}_{DateTime.UtcNow.Ticks}_{Path.GetFileName(document.FileName)}";
            //    var filePath = Path.Combine(uploadsFolder, fileName);

            //    // Save file
            //    using (var fileStream = new FileStream(filePath, FileMode.Create))
            //    {
            //        document.CopyTo(fileStream);
            //    }

            //    // Create and save document metadata to database
            //    var verificationDocument = new VerificationDocument
            //    {
            //        UserId = userId,
            //        DocumentType = documentType,
            //        FilePath = $"/uploads/verification/{userId}/{fileName}", // Store relative path
            //        UploadedAt = DateTime.UtcNow, // Current time in UTC
            //        AdditionalInfo = additionalInfo
            //    };

            //    // Add to database context
            //    _context.VerificationDocuments.Add(verificationDocument);
            //}

            //// Save all changes to database
            //_context.SaveChanges();
            return true; // Return success
        }
    }
}
