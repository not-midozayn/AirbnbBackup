using AutoMapper;
using WebApplication1.DTOS.Booking;
using WebApplication1.Models;
using WebApplication1.Models.Enums;

namespace WebApplication1.Mappings
{
    public class BookingProfile:Profile
    {
        public BookingProfile()
        {
            CreateMap<CreateBookingDTO, Booking>()
                .ForMember(dest => dest.BookingDate, opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForMember(dest=> dest.Status, opt => opt.MapFrom(src => BookingStatus.Pending))
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Booking, GetBookingDTO>()
               .ForMember(dest => dest.Status, opt => opt.MapFrom(src => src.Status.ToString()))
               .ForMember(dest => dest.Listing, opt => opt.MapFrom(src => src.Listing)) 
               .ForPath(dest => dest.Listing.PreviewImageUrl,  
                   opt => opt.MapFrom(src => src.Listing.ListingPhotos
                       .Where(p => p.IsPrimary == true)
                       .Select(p => p.Url)
                       .FirstOrDefault()))
               .ForMember(dest => dest.Guest, opt => opt.MapFrom(opt => opt.Guest))
               .ForPath(dest => dest.Listing.CancellationPolicy,
                   opt => opt.MapFrom(src => src.Listing.CancellationPolicy))
               .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
        }
    }
}

