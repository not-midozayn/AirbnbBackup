using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOS.Amenity;
using WebApplication1.DTOS.Listing;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Repositories;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AmenitiesController : ControllerBase
    {
        #region Dependency Injection
        private readonly IRepository<Amenity> _irepo;
        private readonly IMapper _mapper;
       
        public AmenitiesController(IRepository<Amenity> irepo, IMapper mapper)
        {
            _irepo = irepo;
            _mapper = mapper;
        }
        #endregion

        #region Get Methods
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetAmenityDTO>>> GetAllAmenities([FromQuery] Dictionary<string, string> queryParams)
        {
            var amenities = await _irepo.GetAllAsync(queryParams); 
            var amenityDTOs = _mapper.Map<List<GetAmenityDTO>>(amenities);
            return Ok(amenityDTOs); 
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<GetAmenityDTO>> GetAmenityById(Guid id)
        {
            try
            {
                var amenity = await _irepo.GetByIDAsync(id);
                if (amenity == null)
                {
                    return NotFound("Amenity not found.");
                }
                var amenityDTOs = _mapper.Map<GetAmenityDTO>(amenity);
                return Ok(amenity);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        [HttpGet("category/{categoryId}")]
        public async Task<ActionResult<IEnumerable<GetAmenityDTO>>> GetAmenitiesByCategory(Guid categoryId)
        {
            try
            {
                var amenities = await _irepo.GetAllAsync(new Dictionary<string, string> { { "CategoryId", categoryId.ToString() } });
                if (amenities == null || !amenities.Any())
                {
                    return NotFound("No amenities found for this category.");
                }
                var amenityDTOs = _mapper.Map<List<GetAmenityDTO>>(amenities);
                return Ok(amenityDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }
        #endregion
    }
}
