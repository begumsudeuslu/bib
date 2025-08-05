using System;
using System.Collections.Generic;

namespace bibApplication.Models;

public partial class ProjectMember
{
    public int ProjectId { get; set; }

    public int UserId { get; set; }

    public string RoleInProject { get; set; } = null!;

    public DateTime JoinedAt { get; set; }

    public virtual Project Project { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
