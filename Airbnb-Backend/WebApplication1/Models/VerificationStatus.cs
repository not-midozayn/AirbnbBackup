#nullable disable
using System;
using System.Collections.Generic;

namespace WebApplication1.Models;

public partial class VerificationStatus
{
    public int Id { get; set; }

    public string Value { get; set; }

    public virtual ICollection<Listing> Listings { get; set; } = new List<Listing>();
    public virtual ICollection<ApplicationUser> Users { get; set; } = new List<ApplicationUser>();
}