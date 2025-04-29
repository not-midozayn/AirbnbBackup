using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity; // Contains UserManager and other identity-related functionality
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.Interfaces;
using WebApplication1.Models;

//using WebApplication1.Services; // Contains interfaces for our services



namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("api/users")]
    //[Authorize(Roles = "Admin")] // Restrict to admin for most operations
    public class UserController : ControllerBase
    {
        private readonly IRepository<ApplicationUser> irepo;
        private readonly UserManager<ApplicationUser> userManager; // Identity's UserManager
        private readonly IUserRepository userService;
        private readonly IVerificationRepository verificationService;
        private readonly IMapper mapper;
        private readonly IPhotoHandler photoHandler;

        public UserController(
            IRepository<ApplicationUser> _irepo,
            UserManager<ApplicationUser> _userManager, // Injected to manage user entities
            IUserRepository _userService,
            IVerificationRepository _verificationService,
            IMapper _mapper,
            IPhotoHandler _photoHandler)
        {
            irepo = _irepo;
            userManager = _userManager;
            userService = _userService;
            verificationService = _verificationService;
            mapper = _mapper;
            photoHandler = _photoHandler;

        }


        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<ApplicationUser>>> GetUsers([FromQuery] Dictionary<string, string> queryParams)
        {
            
            var users = await irepo.GetAllAsync(queryParams);
            var usersDto = mapper.Map<List<ApplicationUserDto>>(users);
            return Ok(usersDto);
        }
        [Authorize]
        [HttpGet("me")]
        public async Task<ActionResult> GetCurrentUserProfile()
        {
            var user = await userService.GetCurrentUserAsync();

            if (user == null)
                return NotFound();

            return Ok(user);
        }

        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<ActionResult> GetUserProfile(Guid userId)
        {
            var user = await userService.GetUserAsync(userId);

            if (user == null)
                return NotFound();

            //var publicProfile = mapper.Map<ApplicationUser, GetApplicationUserDto>(user);
            return Ok(user);
        }
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<ApplicationUser>> PostApplicationUser(PostApplicationUserDto applicationUserDTO)
        {

            applicationUserDTO.Id = Guid.NewGuid();
            applicationUserDTO.CreatedAt = DateTime.UtcNow;
            applicationUserDTO.IsVerified = false;
            var User = mapper.Map<ApplicationUser>(applicationUserDTO);
            await irepo.CreateAsync(User);
            irepo.Save();
            return CreatedAtAction("GetApplicationUser", User
                , applicationUserDTO);
        }

        // DELETE: api/ApplicationUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteApplicationUser(Guid id)
        {
            var applicationUser = await userService.GetUserAsync(id);
            if (applicationUser == null)
            {
                return NotFound();
            }

            await irepo.DeleteAsync<ApplicationUser>(id);
            irepo.Save();

            return NoContent();
        }


        [HttpPut("me")]
        public async Task<ActionResult<ApplicationUser>> UpdateCurrentUserProfile([FromBody] UpdateApplicationUserDto updatedUser) // [FromBody] binds JSON in request body to the parameter
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var user = await userService.GetCurrentUserAsync();
            if (user == null)
                return NotFound();
            user.FirstName = updatedUser.FirstName;
            user.LastName = updatedUser.LastName;
            user.Bio = updatedUser.Bio;
            user.DateOfBirth = updatedUser.DateOfBirth;
            user.UpdatedAt = DateTime.UtcNow;

            var result = await irepo.UpdateAsync<ApplicationUser, UpdateApplicationUserDto>(user.Id, updatedUser);
            if (result == null)
                return BadRequest("update failed");

            return Ok(user);
        }

        // POST /api/users/me/profile-picture - Upload profile picture
        [HttpPost("me/profile-picture")]
        public async Task<ActionResult> UploadProfilePicture(IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("No file uploaded");

            if (!userService.IsValidImageFile(file))
                return BadRequest("Invalid file type. Only image files are allowed.");

            if (file.Length > 5 * 1024 * 1024)
                return BadRequest("File size exceeds the limit (5MB)");

            var user = await userService.GetCurrentUserAsync();

            if (user == null)
                return NotFound();

            try
            {
                using (var stream = file.OpenReadStream()) // Open file stream, and ensure it's disposed after use with 'using'
                {
                    string pictureUrl = userService.SaveProfilePicture(stream, file.FileName);

                    user.ProfilePictureUrl = pictureUrl;
                    user.UpdatedAt = DateTime.UtcNow;
                    var UpdateUserDto = mapper.Map<ApplicationUser, UpdateApplicationUserDto>(user);
                    var result = await irepo.UpdateAsync<ApplicationUser, UpdateApplicationUserDto>(user.Id, UpdateUserDto); // Save changes

                    if (result == null)
                        return BadRequest("Update failed");

                    return Ok(new { ProfilePictureUrl = pictureUrl });
                }
            }
            catch (Exception)
            {
                return StatusCode(500, "An error occurred while uploading the profile picture"); // Return 500 for server errors
            }
        }

        //PUT /api/users/me/preferences - Update user preferences
        [HttpPut("me/preferences")]
        public async Task<ActionResult> UpdateUserPreferences([FromBody] UpdateApplicationUserPreferencesDto preferences) // Using custom class to receive only relevant data
        {
            var user = await userService.GetCurrentUserAsync();

            if (user == null)
                return NotFound();

            user.PreferredLanguage = preferences.PreferredLanguage;

            if (preferences.CurrencyId.HasValue)
            {
                user.CurrencyId = preferences.CurrencyId;
            }

            user.UpdatedAt = DateTime.UtcNow; // Update timestamp
            var UpdateUserDto = mapper.Map<ApplicationUser, UpdateApplicationUserPreferencesDto>(user);
            var result = await irepo.UpdateAsync<ApplicationUser, UpdateApplicationUserPreferencesDto>(user.Id, UpdateUserDto); // Save changes

            if (result == null)
                return BadRequest("Update failed");

            return NoContent(); // 204 No Content on successful update
        }



        // GET /api/users/me/verification-status - Check verification status
        [HttpGet("me/verification-status")]
        public async Task<ActionResult> GetVerificationStatus()
        {
            var user = await userService.GetCurrentUserAsync();
            if (user == null)
                return NotFound();

            var status = verificationService.GetVerificationStatus(user.VerificationStatusId);

            return Ok(status);
        }

        // POST /api/users/me/verify - Submit verification documents
        [HttpPost("me/verify")]
        public async Task<ActionResult> SubmitVerificationDocuments()
        {
            var user = await userService.GetCurrentUserAsync();

            if (user == null)
                return NotFound();

            // Access files from the form directly - instead of using parameter binding 
            //as we might need to handle multiple files and form fields
            var files = Request.Form.Files; // Get files from form
            if (files == null || files.Count == 0)
                return BadRequest("No documents uploaded");

            var documentType = Request.Form["documentType"].ToString(); // Get document type from form
            var additionalInfo = Request.Form["additionalInfo"].ToString(); // Get additional info from form

            try
            {
                // Submit documents using service
                bool success = verificationService.SubmitVerificationDocuments(
                    user.Id,
                    files.ToList(), // Convert to List for service
                    documentType,
                    additionalInfo);

                if (!success)
                    return BadRequest("Failed to submit verification documents");

                // Update user verification status to "In Progress"
                user.VerificationStatusId = verificationService.GetInProgressStatusId(); // Get status ID from service
                await irepo.UpdateAsync(user); // Save changes

                return Ok(new { message = "Verification documents submitted successfully" }); // Return success message
            }
            catch (Exception)
            {
                // Log exception (would implement actual logging in production)
                return StatusCode(500, "An error occurred while submitting verification documents"); // 500 for server errors
            }
        }

    }
}