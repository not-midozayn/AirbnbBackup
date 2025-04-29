using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOS.Listing;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Repositories;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PropertyTypesController : ControllerBase
    {
        #region Dependency Injection
        private readonly IRepository<PropertyType> _irepo;
        public PropertyTypesController(IRepository<PropertyType> irepo)
        {
            _irepo = irepo;
        }
        #endregion

        [HttpGet]
        public async Task<ActionResult<IEnumerable<PropertyType>>> GetAl([FromQuery] Dictionary<string, string> queryParams)
        {
            var propertyTypes = await _irepo.GetAllAsync(queryParams);
            return Ok(propertyTypes);
        }

    }
}
