using WebApplication1.DTOS.Listing;
using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IListing: IRepository<Listing>
    {
        Task<Listing> GetListingWithDetailsbyId(Guid id);
        Task<IEnumerable<Listing>> GetListingsWithDetails(Dictionary<string, string> queryParams);
        Task<List<ListingAmenity>> AddAmenitiesToListing(Guid listingId, List<Guid> amenityIds);
        Task<bool> RemoveAmenityFromListing(Guid listingId, Guid amenityId);
        Task<Listing> CreateEmptyListing();
        Task<Listing> UpdateListing(Guid id, UpdateListingDTO dto);
        Task<bool> UpdateVerificationStatusAsync(Guid listingId, int statusId);
        Task<List<SuggestionsDTO>> GetSuggestionsAsync(string query);
    }
}
