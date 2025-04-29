using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOS.Listing;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class ListingsRepository : GenericRepository<Listing>, IListing
    {
        #region Dependency Injection
        private readonly AirbnbDBContext context;
        private readonly IMapper mapper;
        private readonly IAvailabilityCalendar availabilityRepository;
        private readonly List<string> includeProperties =
        [
            "ListingPhotos",
            "ListingAmenities",
            "ListingAmenities.Amenity",
            "Reviews",
            "Reviews.Reviewer",
            "Host",
            "CancellationPolicy",
        ];
        public ListingsRepository(AirbnbDBContext _context, IMapper _mapper, IHttpContextAccessor httpContextAccessor, IAvailabilityCalendar _availabilityRepository) : base(_context, _mapper, httpContextAccessor)
        {
            context = _context;
            mapper = _mapper;
            availabilityRepository = _availabilityRepository;
        }
        #endregion

        #region Get Methods
        public async Task<Listing> GetListingWithDetailsbyId(Guid id)
        {
            return await GetByIDAsync(id, includeProperties);
        }
        public async Task<IEnumerable<Listing>> GetListingsWithDetails(Dictionary<string, string> queryParams)
        {
            queryParams.TryGetValue("startDate", out var startDateStr);
            queryParams.TryGetValue("endDate", out var endDateStr);
            queryParams.TryGetValue("Location", out var locationStr);

            DateTime? startDate = null;
            DateTime? endDate = null;

            if (DateTime.TryParse(startDateStr, out var parsedStart))
                startDate = parsedStart;

            if (DateTime.TryParse(endDateStr, out var parsedEnd))
                endDate = parsedEnd;

            if (startDate.HasValue && !endDate.HasValue)
                endDate = startDate.Value.AddDays(1);

            // Remove availability parameters from filtering
            queryParams.Remove("startDate");
            queryParams.Remove("endDate");
            queryParams.Remove("Location");

            var listings = await GetAllAsync(queryParams, includeProperties);

            if (startDate.HasValue && endDate.HasValue)
            {
                var availableIds = await availabilityRepository.GetAvailableListingIds(startDate.Value, endDate.Value);
                listings = listings.Where(l => availableIds.Contains(l.Id));
            }
            if (!string.IsNullOrEmpty(locationStr))
            {
                var locationNormalized = locationStr.Trim().ToLower();  // Normalize the location query string

                listings = listings.Where(l =>
                    (!string.IsNullOrEmpty(l.City) && l.City.ToLower().Contains(locationNormalized)) ||
                    (!string.IsNullOrEmpty(l.Country) && l.Country.ToLower().Contains(locationNormalized)) ||
                    (!string.IsNullOrEmpty(l.Title) && l.Title.ToLower().Contains(locationNormalized)) ||
                    (!string.IsNullOrEmpty(l.AddressLine1) && l.AddressLine1.ToLower().Contains(locationNormalized))
                ).ToList();
            }

            return listings;
        }

        #endregion

        #region Add Amenities to Listing
        public async Task<List<ListingAmenity>> AddAmenitiesToListing(Guid listingId, List<Guid> amenityIds)
        {
            var listing = await context.Listings
                                       .Include(l => l.ListingAmenities)
                                       .FirstOrDefaultAsync(l => l.Id == listingId);
            if (listing == null)
            {
                return null;
            }
            var amenities = await context.Amenities
                                         .Where(a => amenityIds.Contains(a.Id))
                                         .ToListAsync();
            if (amenities.Count != amenityIds.Count)
            {
                return null;
            }
            var newlyaddedAmenity = new List<ListingAmenity>();
            foreach (var amenity in amenities)
            {
                if (!listing.ListingAmenities.Any(al => al.AmenityId == amenity.Id))
                {
                    var newListingAmenity = new ListingAmenity
                    {
                        ListingId = listingId,
                        AmenityId = amenity.Id
                    };
                    listing.ListingAmenities.Add(newListingAmenity);
                    newlyaddedAmenity.Add(newListingAmenity);

                }

            }
            await context.SaveChangesAsync();
            return newlyaddedAmenity;
        }
        #endregion

        #region Remove Amenities from Listing
        public async Task<bool> RemoveAmenityFromListing(Guid listingId, Guid amenityId)
        {
            var listingAmenity = await context.ListingAmenities
                                               .FirstOrDefaultAsync(la => la.ListingId == listingId && la.AmenityId == amenityId);

            if (listingAmenity == null)
            {
                return false;
            }

            context.ListingAmenities.Remove(listingAmenity);
            await context.SaveChangesAsync();
            return true;
        }
        #endregion

        #region Create Empty Listing
        public async Task<Listing> CreateEmptyListing()
        {
            var currentUser = GetCurrentUserId();
            var User = await context.Users
                .Include(u => u.Currency)
                .FirstOrDefaultAsync(u => u.Id == currentUser);
            var listing = new Listing
            {
                HostId = currentUser,
                PropertyTypeId = 1,
                RoomTypeId = 1,
                AddressLine1 = string.Empty,
                City = string.Empty,
                State = string.Empty,
                Country = string.Empty,
                PostalCode = string.Empty,
                CurrencyId = User.CurrencyId,
                Title = string.Empty,
                Description = string.Empty,
            };
            await CreateAsync(listing);
            return listing;
        }
        #endregion

        #region Update Listing
        [HttpPut("{id}")]
        public async Task<Listing> UpdateListing(Guid id, UpdateListingDTO dto)
        {
            try
            {
                var updatedListing = await UpdateAsync<Listing, UpdateListingDTO>(id, dto);

                if (updatedListing == null)
                    return null;

                var fullListing = await GetByIDAsync(id);
                if (fullListing.IsActive)
                {
                    fullListing.UpdatedAt = DateTime.UtcNow;
                    await context.SaveChangesAsync();
                }

                if (dto.AmenityIds != null && dto.AmenityIds.Count > 0)
                {
                    var addedAmenities = await AddAmenitiesToListing(id, dto.AmenityIds);
                    if (addedAmenities == null)
                        return null; 
                }
                return fullListing;
            }
            catch (Exception ex)
            {
                throw new Exception("Error updating the listing", ex);
            }
        }
        #endregion

        #region Update verification Status
        public async Task<bool> UpdateVerificationStatusAsync(Guid listingId, int statusId)
        {
            var listing = await GetByIDAsync(listingId);
            if (listing == null) return false;

            listing.VerificationStatusId = statusId;
            context.Listings.Update(listing);
            await context.SaveChangesAsync();
            return true;
        }
        #endregion

        #region Search Suggestions
        public async Task<List<SuggestionsDTO>> GetSuggestionsAsync(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return [];
            }
            var queryLower = query.ToLower().Trim();

            var suggestions = new List<SuggestionsDTO>();

            // Search by Title
            var listingTitleMatches = await context.Listings
                .Where(l => !string.IsNullOrEmpty(l.Title) && l.Title.ToLower().StartsWith(queryLower))
                .Select(l => new SuggestionsDTO { Value = l.Title, Type = "Title" })
                .ToListAsync();

            // Search by City
            var cityMatches = await context.Listings
                .Where(l => !string.IsNullOrEmpty(l.City) && l.City.ToLower().StartsWith(queryLower))
                .Select(l => new SuggestionsDTO { Value = l.City, Type = "City" })
                .Distinct()
                .ToListAsync();

            // Search by Country
            var countryMatches = await context.Listings
                .Where(l => !string.IsNullOrEmpty(l.Country) && l.Country.ToLower().StartsWith(queryLower))
                .Select(l => new SuggestionsDTO { Value = l.Country, Type = "Country" })
                .Distinct()
                .ToListAsync();

            // Search by AddressLine
            var addressLineMatches = await context.Listings
                .Where(l => !string.IsNullOrEmpty(l.AddressLine1) && l.AddressLine1.ToLower().StartsWith(queryLower))
                .Select(l => new SuggestionsDTO { Value = l.AddressLine1, Type = "AddressLine1" })
                .Distinct()
                .ToListAsync();

            // Add all matches to suggestions
            suggestions.AddRange(listingTitleMatches);
            suggestions.AddRange(cityMatches);
            suggestions.AddRange(countryMatches);
            suggestions.AddRange(addressLineMatches);

            // Filter, remove duplicates, and limit to 10 results
            suggestions = suggestions
                .Where(s => !string.IsNullOrEmpty(s.Value))  // Exclude empty values
                .Distinct()  // Remove duplicates
                .Take(10)    // Limit to 10 results
                .ToList();

            return suggestions;
        }
        #endregion

    }
}

