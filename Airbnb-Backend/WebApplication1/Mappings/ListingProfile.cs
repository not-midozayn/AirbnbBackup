using AutoMapper;
using WebApplication1.DTOS.Amenity;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.DTOS.Listing;
using WebApplication1.DTOS.Review;
using WebApplication1.Models;

namespace WebApplication1.Mappings
{
    public class ListingProfile : Profile
    {
        public ListingProfile()
        {
            CreateMap<UpdateListingDTO, Listing>()
                .ForMember(dest => dest.UpdatedAt, opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Listing, GetListingDTO>()
                .ForMember(dest => dest.ImageUrls,
                    opt => opt.MapFrom(src => src.ListingPhotos.Select(p => p.Url).ToList()))
                .ForMember(dest => dest.PreviewImageUrl,
                           opt => opt.MapFrom(src => src.ListingPhotos
                                                    .Where(p => p.IsPrimary == true)
                                                    .Select(p => p.Url)
                                                    .FirstOrDefault()))
                .ForMember(dest => dest.Amenities,
                           opt => opt.MapFrom(src => src.ListingAmenities.Select(la => new GetAmenityDTO
                           {
                               Id = la.Amenity.Id,
                               Name = la.Amenity.Name,
                               Icon = la.Amenity.Icon,
                               CategoryId = la.Amenity.CategoryId
                           }).ToList()))
                             .ForMember(dest => dest.Reviews,
                             opt => opt.MapFrom(src => src.Reviews))

                .ForMember(dest => dest.Host,
                            opt => opt.MapFrom(src => src.Host))

                .ForMember(dest => dest.CancellationPolicy,
                            opt => opt.MapFrom(src => src.CancellationPolicy))


                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Amenity, GetAmenityDTO>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));


        }
    }

}