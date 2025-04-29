using System;
using System.Collections.Generic;

namespace WebApplication1.Models.Identity;

public partial class AspNetUserToken
{
    public Guid UserId { get; set; }

    public string LoginProvider { get; set; }

    public string Name { get; set; }

    public string Value { get; set; }
}
