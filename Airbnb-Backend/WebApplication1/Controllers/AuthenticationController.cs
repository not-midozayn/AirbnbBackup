using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Text;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using NETCore.MailKit.Core;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.DTOS.Authentication;
using WebApplication1.Models;
using Microsoft.AspNetCore.Identity.UI.Services;
using WebApplication1.Repositories;
using System.Text.Json;
using Microsoft.AspNetCore.WebUtilities;
using System;
using System.Globalization;

namespace YourNamespace.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly IConfiguration configuration;
        private readonly RoleManager<IdentityRole<Guid>> roleManager;
        private readonly IMapper mapper;
        private readonly IEmailService emailService;
        private readonly IEmailSender emailsender;

        public AuthenticationController(
            UserManager<ApplicationUser> _userManager,
            SignInManager<ApplicationUser> _signInManager,
            IConfiguration _configuration,
            RoleManager<IdentityRole<Guid>> _roleManager,
            IMapper _mapper,
            IEmailService _emailservice,
            IEmailSender _emailsender)
        {
            userManager = _userManager;
            signInManager = _signInManager;
            configuration = _configuration;
            roleManager = _roleManager;
            mapper = _mapper;
            emailService = _emailservice;
            emailsender = _emailsender;

        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDto registerDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var userExists = await userManager.FindByEmailAsync(registerDto.Email);
            if (userExists != null)
                return Conflict(new { Status = "Error", Message = "User already exists!" });

            registerDto = new RegisterDto()
            {
                FirstName = registerDto.FirstName,
                LastName = registerDto.LastName,
                Email = registerDto.Email,
                Password = registerDto.Password,
                DateOfBirth = registerDto.DateOfBirth,
            };

            var user = mapper.Map<RegisterDto, ApplicationUser>(registerDto);
            user.VerificationStatusId = 3;
            user.IsVerified = true;
            user.UserName = registerDto.Email;
            user.SecurityStamp = Guid.NewGuid().ToString();
            user.Id = Guid.NewGuid();
            user.EmailConfirmed = true;
            user.ProfilePictureUrl = "uploads/profile Picture.jpg";
            user.CurrencyId = 1;
            user.CreatedAt = DateTime.UtcNow;

            var result = await userManager.CreateAsync(user, registerDto.Password);
            if (!result.Succeeded)
                return BadRequest(new { Status = "Error", Message = "User creation failed!", Errors = result.Errors });

            // Add user to role (if you're using roles)
            if (!await roleManager.RoleExistsAsync(UserRoles.Guest))
                await roleManager.CreateAsync(new IdentityRole<Guid>(UserRoles.Guest));

            await userManager.AddToRoleAsync(user, UserRoles.Guest);

            return Ok(new { Status = "Success", Message = "User created successfully!" });
        }

        //{
        //  "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        //  "firstName": "mohamed",
        //  "lastName": "aboseif",
        //  "email": "aboseif@email.com",
        //  "userName": "aboseif1234A",
        //  "password": "aboseif1234A@",
        //  "confirmPassword": "aboseif1234A@",
        //  "dateOfBirth": "2025-04-14T10:41:31.864Z",
        //  "securityStamp": "string"
        //}
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDto loginDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var user = await userManager.FindByEmailAsync(loginDto.Email);
            if (user == null)
                return Unauthorized(new { Status = "Error", Message = "Invalid credentials" });

            var result = await signInManager.CheckPasswordSignInAsync(user, loginDto.Password, false);
            if (!result.Succeeded)
                return Unauthorized(new { Status = "Error", Message = "Invalid credentials" });

            var tokenModel = await CreateAccessAndRefreshToken(user);

            return Ok(new
            {
                AccessToken = tokenModel.AccessToken,
                RefreshToken = tokenModel.RefreshToken,
            });
        }

        [HttpPost("refresh-token")]
        public async Task<IActionResult> RefreshToken([FromBody] TokenModel tokenModel)
        {
            if (tokenModel is null)
                return BadRequest("Invalid client request");

            string Request_accessToken = tokenModel.AccessToken;
            string Request_refreshToken = tokenModel.RefreshToken;

            var principal = GetPrincipalFromExpiredToken(Request_accessToken);
            if (principal == null)
                return BadRequest("Invalid access token");

            string username = principal.Identity.Name;
            var user = await userManager.FindByNameAsync(username);


            // Store refresh token using Identity's token system
            var RefreshToken = await userManager.GetAuthenticationTokenAsync(
                user,
                "AirbnbClone",
                "RefreshToken"
            );

            // Store expiry time as a separate token
            var RefreshTokenExpiryTime = await userManager.GetAuthenticationTokenAsync(
                user,
                "AirbnbClone",
                "RefreshTokenExpiry"
            );

            //if (user == null || RefreshToken != Request_refreshToken || DateTime.Parse(RefreshTokenExpiryTime) <= DateTime.Now)
            //    return BadRequest("Invalid/Expired Refresh Token");

            if (user == null ||
            !string.Equals(RefreshToken, Request_refreshToken, StringComparison.Ordinal) ||
            string.IsNullOrEmpty(RefreshTokenExpiryTime) ||
            !DateTime.TryParse(RefreshTokenExpiryTime, CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal, out var expiryTime) ||
            expiryTime <= DateTime.UtcNow)
            {
                return Unauthorized();
            }
            var newAccessToken = CreateToken(principal.Claims.ToList());
            var newRefreshTokenCode = GenerateRefreshToken32bitCode();

            var NewRefreshToken = await userManager.SetAuthenticationTokenAsync(
                user,
                "AirbnbClone",
                "RefreshToken",
                newRefreshTokenCode
            );

            // Replace the incorrect usage of DateTime.UtcNow with the correct string representation
            var NewRefreshTokenExpiry = await userManager.SetAuthenticationTokenAsync(
                user,
                "AirbnbClone",
                "RefreshTokenExpiry",
                DateTime.UtcNow.ToString("o")
            );
            await userManager.UpdateAsync(user);

            return Ok(new
            {
                AccessToken = new JwtSecurityTokenHandler().WriteToken(newAccessToken),
                RefreshToken = newRefreshTokenCode
            });
        }

        [Authorize]
        [HttpPost("revoke/{username}")]
        public async Task<IActionResult> Revoke(string username)
        {
            var user = await userManager.FindByNameAsync(username);
            if (user == null) return BadRequest("Invalid user name");

            try
            {
                await userManager.RemoveAuthenticationTokenAsync(
                    user,
                    "AirbnbClone",
                    "RefreshToken");
                await userManager.RemoveAuthenticationTokenAsync(
                    user,
                    "AirbnbClone",
                    "RefreshTokenExpiry");
                await userManager.UpdateAsync(user);
                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest("Failed to revoke refresh token");
            }
        }

        [Authorize]
        [HttpPost("revoke-all")]
        public async Task<IActionResult> RevokeAll()
        {
            var users = userManager.Users.ToList();
            foreach (var user in users)
            {
                await userManager.RemoveAuthenticationTokenAsync(
                    user,
                    "AirbnbClone",
                    "RefreshToken");
                await userManager.RemoveAuthenticationTokenAsync(
                    user,
                    "AirbnbClone",
                    "RefreshTokenExpiry");
                await userManager.UpdateAsync(user);
            }

            return NoContent();
        }

        //[Authorize]
        //[HttpGet("current-user")]
        //public async Task<IActionResult> GetCurrentUser()
        //{
        //    var user = await userService.GetCurrentUserAsync();

        //    if (user == null)
        //        return NotFound();

        //    var roles = await userManager.GetRolesAsync(user);

        //    return Ok(new
        //    {
        //        Id = user.Id,
        //        Username = user.UserName,
        //        Email = user.Email,
        //        FirstName = user.FirstName,
        //        LastName = user.LastName,
        //        Roles = roles
        //    });
        //}

        [HttpPost("forget-password")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgetPasswordDto forgetPasswordDto)
        {
            // Always return a consistent response time
            var user = await userManager.FindByEmailAsync(forgetPasswordDto.Email);
            if (user == null)
            {
                await Task.Delay(500);
                return Ok(new { Status = "Error", Message = "Invalid request" });
            }

            var resetToken = await userManager.GeneratePasswordResetTokenAsync(user);
            var encodedResetToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(resetToken));
            //forgetPasswordDto.ForgetPasswordTokenExpires = DateTime.UtcNow.AddHours(24);
            await userManager.UpdateAsync(user);

            string resetLink = $"http://localhost:YOUR_PORT/reset-password?email={user.Email}&token={WebUtility.UrlEncode(resetToken)}";

            Console.WriteLine($"Password Reset Link for {user.Email}: {resetLink}");

            await emailsender.SendEmailAsync(
                forgetPasswordDto.Email,
                "Password Reset",
                $"Click <a href='{resetLink}'>here</a> to reset your password.");

            return Ok();
        }

        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordDto resetPasswordDto)
        {
            // For password reset
            var user = await userManager.FindByEmailAsync(resetPasswordDto.Email);
            if (user == null)
            {
                await Task.Delay(500);
                return Ok(new { Status = "Error", Message = "Invalid request" });
            }

            var resetToken = await userManager.GeneratePasswordResetTokenAsync(user);
            var encodedResetToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(resetToken));
            resetPasswordDto.ResetPasswordTokenExpires = DateTime.UtcNow.AddHours(24);
            var resetUrl = $"{configuration["AppUrl"]}/reset-password?email={WebUtility.UrlEncode(user.Email)}&token={encodedResetToken}";

            var emailBody = $@"
<h2>Welcome to YourApp!</h2>
<p>Please confirm your email by <a href='{resetUrl}'>clicking here</a>.</p>
<p>If you didn't create an account, you can ignore this email.</p>
";

            string resetLink = $"http://localhost:YOUR_PORT/reset-password?email={user.Email}&token={WebUtility.UrlEncode(resetToken)}";
            await emailsender.SendEmailAsync(
                resetPasswordDto.Email,
                "Password Reset",
                $"Click <a href='{resetUrl}'>here</a> to reset your password.");

            var result = await userManager.ResetPasswordAsync(user, resetPasswordDto.ResetPasswordToken, resetPasswordDto.Password);
            await userManager.UpdateAsync(user);
            if (!result.Succeeded)
                return BadRequest(new { Status = "Error", Message = "Password reset failed", Errors = result.Errors });

            return Ok(new { Status = "Success", Message = "Password reset successful!" });
        }

        [Authorize]
        [HttpPost("change-password")]
        public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordDto changePasswordDto)
        {
            var username = User.Identity.Name;
            var user = await userManager.FindByNameAsync(username);

            if (user == null)
                return NotFound(new { Status = "Error", Message = "User not found" });

            var result = await userManager.ChangePasswordAsync(user, changePasswordDto.CurrentPassword, changePasswordDto.NewPassword);
            if (!result.Succeeded)
                return BadRequest(new { Status = "Error", Message = "Password change failed", Errors = result.Errors });

            return Ok(new { Status = "Success", Message = "Password changed successfully!" });
        }

        [Authorize]
        [HttpPost("BecomeAHost")]
        public async Task<IActionResult> BecomeAHost()
        {

            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userId == null)
                return Ok("User not found");

            var user = await userManager.FindByIdAsync(userId);
            if (user == null)
                return BadRequest("User not found");

            if (!await roleManager.RoleExistsAsync(UserRoles.Host))
                await roleManager.CreateAsync(new IdentityRole<Guid>(UserRoles.Host));

            await userManager.AddToRoleAsync(user, UserRoles.Host);
            await userManager.UpdateAsync(user);

            var userRoles = await userManager.GetRolesAsync(user);
            Console.WriteLine($"User roles from becomeAHost: {string.Join(", ", userRoles)}");

            var tokenModel = await CreateAccessAndRefreshToken(user);
            return Ok(new
            {
                AccessToken = tokenModel.AccessToken,
                RefreshToken = tokenModel.RefreshToken,
            });
        }

        private JwtSecurityToken CreateToken(List<Claim> authClaims)
        {
            var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Secret"]));
            _ = int.TryParse(configuration["JWT:TokenExpiryInMinutes"], out int TokenExpiryInMinutes);

            var token = new JwtSecurityToken(
                issuer: configuration["JWT:ValidIssuer"],
                audience: configuration["JWT:ValidAudience"],
                expires: DateTime.Now.AddMinutes(TokenExpiryInMinutes),
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
            );

            return token;
        }

        private static string GenerateRefreshToken32bitCode()
        {
            return Guid.NewGuid().ToString();
        }

        private ClaimsPrincipal GetPrincipalFromExpiredToken(string token)
        {
            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateAudience = false,
                ValidateIssuer = false,
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Secret"])),
                ValidateLifetime = false
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out SecurityToken securityToken);

            if (securityToken is not JwtSecurityToken jwtSecurityToken ||
                !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
                throw new SecurityTokenException("Invalid token");

            return principal;
        }
        private async Task<TokenModel> CreateAccessAndRefreshToken(ApplicationUser user)
        {
            var userRoles = await userManager.GetRolesAsync(user);

            // Create base claims
            var authClaims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim("FirstName", user.FirstName),
                new Claim("LastName", user.LastName),
                new Claim("roles", JsonSerializer.Serialize(userRoles.ToArray())),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            };
            foreach (var role in userRoles)
            {
                authClaims.Add(new Claim(ClaimTypes.Role, role));
            }

            var token = CreateToken(authClaims);
            var refreshToken32bitCode = GenerateRefreshToken32bitCode();

            _ = int.TryParse(configuration["JWT:RefreshTokenValidityInDays"], out int refreshTokenValidityInDays);
            var refreshTokenExpiryTime = DateTime.UtcNow.AddDays(refreshTokenValidityInDays);

            // Store refresh token using Identity's token system
            await userManager.SetAuthenticationTokenAsync(
                user,
                "AirbnbClone",
                "RefreshToken",
                refreshToken32bitCode
            );

            // Store expiry time as a separate token
            await userManager.SetAuthenticationTokenAsync(
                user,
                "AirbnbClone",
                "RefreshTokenExpiry",
                refreshTokenExpiryTime.ToString("o")
            );
            return new TokenModel
            {
                Id = Guid.NewGuid(),
                AccessToken = new JwtSecurityTokenHandler().WriteToken(token),
                RefreshToken = refreshToken32bitCode,
            };
        }

    }
}