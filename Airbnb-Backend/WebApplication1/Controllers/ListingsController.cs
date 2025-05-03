using AutoMapper;
using Humanizer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Controllers;
using WebApplication1.DTOS.Amenity;
using WebApplication1.DTOS.Authentication;
using WebApplication1.DTOS.Listing;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Repositories;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ListingsController : ControllerBase
    {
        #region Dependency Injection
        private readonly IMapper _mapper;
        private readonly IListing _listingsRepository;
        public ListingsController(IMapper mapper, IListing listingsRepository)
        {
            _mapper = mapper;
            _listingsRepository = listingsRepository;
        }
        #endregion

        #region Get Methods
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetListingDTO>>> GetAllListings([FromQuery] Dictionary<string, string> queryParams)
        {
            var listings = await _listingsRepository.GetListingsWithDetails(queryParams);
            var listingDTOs = _mapper.Map<List<GetListingDTO>>(listings);
            return Ok(listingDTOs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<GetListingDTO>> GetListingById(Guid id)
        {
            try
            {
                var listing = await _listingsRepository.GetListingWithDetailsbyId(id);
                if (listing == null)
                {
                    return NotFound("Listing not found.");
                }

                var listingDTOs = _mapper.Map<GetListingDTO>(listing);
                return Ok(listingDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        [HttpGet("host/{hostId}")]
        [Authorize(Roles = $"{UserRoles.Admin},{UserRoles.Host}")]
        public async Task<ActionResult<IEnumerable<GetListingDTO>>> GetListingsByHost(Guid hostId)
        {
            try
            {
                var listings = await _listingsRepository.GetListingsWithDetails(new Dictionary<string, string> { { "HostId", hostId.ToString() } });

                if (listings == null || !listings.Any())
                {
                    //return NotFound("No listings found for the specified host.");
                    return Ok();
                }

                var listingDTOs = _mapper.Map<List<GetListingDTO>>(listings);

                return Ok(listingDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion

        #region Create Methods
        [HttpPost("empty")]
        [Authorize(Roles = $"{UserRoles.Host}")]
        public async Task<IActionResult> CreateEmptyListing()
        {
            try
            {
                var listing = await _listingsRepository.CreateEmptyListing();
                var listingDTO = _mapper.Map<GetListingDTO>(listing);
                return CreatedAtAction(nameof(CreateEmptyListing), new { id = listingDTO.Id }, listingDTO);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPost("{id}/amenities")]
        [Authorize(Roles = $"{UserRoles.Host}")]
        public async Task<ActionResult<List<ListingAmenity>>> AddAmenitiesToListing(Guid id, [FromBody] List<Guid> amenityIds)
        {
            try
            {
                var updatedListingAmenities = await _listingsRepository.AddAmenitiesToListing(id, amenityIds);
                if (updatedListingAmenities == null || updatedListingAmenities.Count == 0)
                {
                    return NotFound("Listing not found or amenities not found.");
                }
                return Ok(updatedListingAmenities);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion

        #region Update Methods
        [HttpPut("{id}")]
        [Authorize(Roles = $"{UserRoles.Host}")]
        public async Task<ActionResult<Listing>> UpdateListing(Guid id, [FromBody] UpdateListingDTO dto)
        {
            try
            {
                var updatedListing = await _listingsRepository.UpdateListing(id, dto);

                if (updatedListing == null)
                {
                    return NotFound("Listing not found or amenities could not be added.");
                }

                return Ok(updatedListing);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        [HttpPut("{listingId}/update-verification")]
        [Authorize(Roles = $"{UserRoles.Admin}, {UserRoles.Host}")]
        public async Task<IActionResult> UpdateVerificationStatus(Guid listingId,[FromBody] UpdateVerificationStatusDTO dto)
        {
            var result = await _listingsRepository.UpdateVerificationStatusAsync(listingId, dto.VerificationStatusId);
            if (!result)
                return NotFound("Listing not found.");

            return Ok("Verification status updated successfully.");
        }

        #endregion

        #region Delete Method
        [HttpDelete("{id}")]
        [Authorize(Roles = $"{UserRoles.Admin},{UserRoles.Host}")]
        public async Task<ActionResult> DeleteListing(Guid id)
        {
            try
            {
                await _listingsRepository.DeleteAsync<Listing>(id);
                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        [HttpDelete("multiple")]
        [Authorize(Roles = $"{UserRoles.Admin},{UserRoles.Host}")]
        public async Task<IActionResult> DeleteMultipleListings([FromBody] Guid[] ids)
        {
            if (ids == null || ids.Length == 0)
                return BadRequest("No IDs provided");

            await _listingsRepository.DeleteMultipleAsync<Listing>(ids);
            return NoContent();
        }

        [HttpDelete("{listingId}/amenities/{amenityId}")]
        [Authorize(Roles = $"{UserRoles.Host}")]
        public async Task<ActionResult> DeleteAmenityFromListing(Guid listingId, Guid amenityId)
        {
            try
            {
                var result = await _listingsRepository.RemoveAmenityFromListing(listingId, amenityId);

                if (!result)
                {
                    return NotFound("Listing or Amenity not found.");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        #endregion

        #region Publish Method

        [HttpPut("{id}/delete")]
        [Authorize(Roles = $"{UserRoles.Host}")]
        public async Task<IActionResult> SetListingAsActive(Guid id)
        {
            try
            {
                var listing = await _listingsRepository.GetByIDAsync(id);
                if (listing == null)
                {
                    return NotFound("Listing not found.");
                }

                listing.IsActive = true;
                await _listingsRepository.UpdateAsync(listing);

                return Ok("Listing set as active.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion

        #region Search 
        [HttpGet("suggestions")]
        public async Task<IActionResult> GetSuggestions([FromQuery] string query)
        {
            try
            {
                var suggestions = await _listingsRepository.GetSuggestionsAsync(query);
                return Ok(suggestions);
            }
            catch (Exception ex)
            {
                return BadRequest($"Error occurred: {ex.Message}");
            }
        }
        #endregion
    }
}