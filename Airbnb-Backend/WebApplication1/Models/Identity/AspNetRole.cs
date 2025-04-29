using System;
using System.Collections.Generic;

namespace WebApplication1.Models.Identity;

public partial class AspNetRole
{
    public Guid Id { get; set; }

    public string Name { get; set; }

    public string NormalizedName { get; set; }

    public string ConcurrencyStamp { get; set; }

    public virtual ICollection<AspNetRoleClaim> AspNetRoleClaims { get; set; } = new List<AspNetRoleClaim>();

    public virtual ICollection<AspNetUserRole> AspNetUser
    { get; set; } = new List<AspNetUserRole>();
}
