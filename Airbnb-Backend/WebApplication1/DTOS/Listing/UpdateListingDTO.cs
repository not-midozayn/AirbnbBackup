namespace WebApplication1.DTOS.Listing
{
    public class UpdateListingDTO
    {
        public int MinNights { get; set; }
        public int MaxNights { get; set; }
        public int CancellationPolicyId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int PropertyTypeId { get; set; }
        public int RoomTypeId { get; set; }
        public int Capacity { get; set; }
        public int Bedrooms { get; set; }
        public int Bathrooms { get; set; }
        public decimal PricePerNight { get; set; }
        public decimal SecurityDeposit { get; set; }
        public decimal ServiceFee { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string PostalCode { get; set; }
        public bool InstantBooking { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public int CurrencyId { get; set; }
        public List<Guid> AmenityIds { get; set; } = [];
    }
}