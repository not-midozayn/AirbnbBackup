using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOS.Listing;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomTypesController : ControllerBase
    {
        #region Dependency Injection
        private readonly IRepository<RoomType> _irepo;
        public RoomTypesController(IRepository<RoomType> irepo)
        {
            _irepo = irepo;
        }
        #endregion

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomType>>> GetAl([FromQuery] Dictionary<string, string> queryParams)
        {
            var roomTypes = await _irepo.GetAllAsync(queryParams);
            return Ok(roomTypes);
        }
    }
}


