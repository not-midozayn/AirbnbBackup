using AutoMapper;
using WebApplication1.DTOS.Review;
using WebApplication1.Models;

namespace WebApplication1.Mappings
{
    public class ReviewProfile : Profile
    {
        public ReviewProfile()
        {
            CreateMap<CreateReviewDTO, Review>()
                .ForMember(dest => dest.CreatedAt, opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Review, GetReviewDTO>()
                .ForMember(dest => dest.Reviewer, opt => opt.MapFrom(src => src.Reviewer))
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<UpdateReviewDTO, Review>()
                .ForMember(dest => dest.UpdatedAt, opt => opt.MapFrom(src => DateTime.UtcNow))
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<HostReplyDTO, Review>()
                .ForMember(dest => dest.HostReply, opt => opt.MapFrom(src => src.HostReply))
                .ForMember(dest => dest.HostReplyDate, opt => opt.MapFrom((src, dest) => DateTime.UtcNow))
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
        }
    }
}
