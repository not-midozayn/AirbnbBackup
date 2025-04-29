using AutoMapper;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Mappings
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<ApplicationUser, ApplicationUserDto>();
            CreateMap<ApplicationUserDto, ApplicationUser>();

            CreateMap<ApplicationUser, GetApplicationUserDto>();    
            CreateMap<GetApplicationUserDto, ApplicationUser>();

            CreateMap<ApplicationUser, UpdateApplicationUserDto>();
            CreateMap<UpdateApplicationUserDto, ApplicationUser>();

            CreateMap<ApplicationUser, UpdateApplicationUserPreferencesDto>();
            CreateMap<UpdateApplicationUserPreferencesDto, ApplicationUser>();

            CreateMap<ApplicationUser, PostApplicationUserDto>();
            CreateMap<PostApplicationUserDto, ApplicationUser>();

        }
    }
}