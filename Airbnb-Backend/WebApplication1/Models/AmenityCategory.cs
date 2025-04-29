using WebApplication1.Models;

namespace WebApplication1.Models
{
    public class AmenityCategory
    {
        public Guid Id { get; set; }
        public string Name { get; set; } 
        public virtual ICollection<Amenity> Amenities { get; set; } = new List<Amenity>();
    }
}
