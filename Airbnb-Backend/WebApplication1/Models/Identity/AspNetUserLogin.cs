using System;
using System.Collections.Generic;

namespace WebApplication1.Models.Identity;

public partial class AspNetUserLogin
{
    public string LoginProvider { get; set; }

    public string ProviderKey { get; set; }

    public string ProviderDisplayName { get; set; }

    public Guid UserId { get; set; }
}
