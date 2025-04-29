using WebApplication1.Models;

namespace WebApplication1.DTOS.Amenity
{
    public class GetAmenityDTO
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public Guid CategoryId { get; set; }

        public string Icon { get; set; }

        public DateTime? CreatedAt { get; set; }
    }
}