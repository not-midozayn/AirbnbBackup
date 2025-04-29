namespace WebApplication1.DTOS.Statistics
{
    public class UserRoleDitributionDTO
    {
        public List<string> Roles { get; set; } = new();
        public List<int> Counts { get; set; } = new();

    }
}
