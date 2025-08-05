using System;
using System.Collections.Generic;

namespace bibApplication.Models;

public partial class Announcement
{
    public int AnnId { get; set; }

    public string? Title { get; set; }

    public string? Content { get; set; }

    public DateTime CreatedAt { get; set; }

    public int CreatedBy { get; set; }

    public virtual User CreatedByNavigation { get; set; } = null!;
}
