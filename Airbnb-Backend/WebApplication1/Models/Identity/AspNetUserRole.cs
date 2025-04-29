using System;
using System.Collections.Generic;

namespace WebApplication1.Models.Identity;

public partial class AspNetUserRole
{
    public Guid UserId { get; set; }

    public Guid RoleId { get; set; }

    public virtual AspNetRole Role { get; set; }
}
