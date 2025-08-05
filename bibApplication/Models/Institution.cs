using System;
using System.Collections.Generic;

namespace bibApplication.Models;

public partial class Institution
{
    public int InstitutionId { get; set; }

    public string InstitutionName { get; set; } = null!;

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
