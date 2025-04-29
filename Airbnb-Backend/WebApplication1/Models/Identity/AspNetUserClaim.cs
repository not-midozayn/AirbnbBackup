using System;
using System.Collections.Generic;

namespace WebApplication1.Models.Identity;

public partial class AspNetUserClaim
{
    public int Id { get; set; }

    public Guid UserId { get; set; }

    public string ClaimType { get; set; }

    public string ClaimValue { get; set; }
}
