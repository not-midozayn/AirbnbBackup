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
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
        }
    }
}

