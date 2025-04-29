using AutoMapper;
using WebApplication1.DTOS.AvailabilityCalendar;
using WebApplication1.Models;

namespace WebApplication1.Mappings
{
    public class AvailabilityCalendarProfile : Profile
    {
        public AvailabilityCalendarProfile()
        {
            CreateMap<AvailabilityCalendar, GetAvailabilityCalendarDTO>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<InitAvailabilityCalendarDTO, AvailabilityCalendar>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<SetAvailabilityCalendarDTO, AvailabilityCalendar>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<SetAvailabilityCalendarDTO, UpdateAvailabilityCalendarDTO>();

            CreateMap<UpdateAvailabilityCalendarDTO, AvailabilityCalendar>()
                .ForMember(dest => dest.Id, opt => opt.Ignore()) // Avoid mapping key properties
                .ForMember(dest => dest.Date, opt => opt.Ignore())
                .ForMember(dest => dest.ListingId, opt => opt.Ignore())
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        }
    }
}
