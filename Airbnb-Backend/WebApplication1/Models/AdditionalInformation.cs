namespace WebApplication1.Models
{
    public partial class AdditionalInformation
    {
        public Guid Id { get; set; }
        public Guid ListingId { get; set; }
        public string Data { get; set; }
        public string Description { get; set; }
        public virtual Listing Listing { get; set; }
    }
}