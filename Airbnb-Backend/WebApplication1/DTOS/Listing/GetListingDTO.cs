using WebApplication1.DTOS.Amenity;
using WebApplication1.DTOS.ApplicationUser;
using WebApplication1.DTOS.Review;
using WebApplication1.Models;

namespace WebApplication1.DTOS.Listing
{
    public class GetListingDTO
    {
        public Guid Id { get; set; }
        public GetApplicationUserDto Host { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int PropertyTypeId { get; set; }
        public int RoomTypeId { get; set; }
        public int? Capacity { get; set; }
        public int Bedrooms { get; set; }
        public int Bathrooms { get; set; }
        public decimal PricePerNight { get; set; }
        public decimal? ServiceFee { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string PostalCode { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
        public bool? InstantBooking { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int? MinNights { get; set; }
        public int MaxNights { get; set; }
        public CancellationPolicy CancellationPolicy { get; set; }
        public decimal? AverageRating { get; set; }
        public int? ReviewCount { get; set; }
        public bool? IsActive { get; set; }
        public int? CurrencyId { get; set; }
        public int VerificationStatusId { get; set; }
        public List<string> ImageUrls { get; set; }
        public string PreviewImageUrl { get; set; }
        public List<GetAmenityDTO> Amenities { get; set; }
        public List<GetReviewDTO> Reviews { get; set; }
    }
}