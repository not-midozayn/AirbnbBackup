using AutoMapper;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.DTOS.Authentication;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Mappings
{
    public class AuthenticationProfile : Profile
    {
        public AuthenticationProfile()
        {
            CreateMap<ApplicationUser, ChangePasswordDto>();      
            CreateMap<ChangePasswordDto, ApplicationUser>();

            CreateMap<ApplicationUser, ForgetPasswordDto>();   
            CreateMap<ForgetPasswordDto, ApplicationUser>();

            CreateMap<ApplicationUser, LoginDto>();
            CreateMap<LoginDto, ApplicationUser>();

            CreateMap<ApplicationUser, RegisterDto>();
            CreateMap<RegisterDto, ApplicationUser>();

            CreateMap<ApplicationUser, ResetPasswordDto>();
            CreateMap<ResetPasswordDto, ApplicationUser>();

        }
    }
}
