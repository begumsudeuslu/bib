using System;
using System.Collections.Generic;

namespace bibApplication.Models;

public partial class ProjectFile
{
    public int FileId { get; set; }

    public int ProjectId { get; set; }

    public int UploadedBy { get; set; }

    public DateTime UploadedTime { get; set; }

    public string FileUrl { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;

    public virtual User UploadedByNavigation { get; set; } = null!;
}
