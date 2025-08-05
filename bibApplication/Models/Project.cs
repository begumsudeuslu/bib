using System;
using System.Collections.Generic;

namespace bibApplication.Models;

public partial class Project
{
    public int ProjectId { get; set; }

    public string ProjectTitle { get; set; } = null!;

    public string? Description { get; set; }

    public string Status { get; set; } = null!;

    public DateOnly StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public int ResponsibleUserId { get; set; }

    public DateTime CreatedTime { get; set; }

    public virtual ICollection<ProjectFile> ProjectFiles { get; set; } = new List<ProjectFile>();

    public virtual ICollection<ProjectMember> ProjectMembers { get; set; } = new List<ProjectMember>();

    public virtual User ResponsibleUser { get; set; } = null!;
}
