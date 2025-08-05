using System;
using System.Collections.Generic;

namespace bibApplication.Models;

public partial class Notification
{
    public int UserId { get; set; }

    public int NotId { get; set; }

    public string? Title { get; set; }

    public string? Content { get; set; }

    public DateTime CreatedAt { get; set; }

    public int CreatedBy { get; set; }

    public bool? IsRead { get; set; }

    public virtual User CreatedByNavigation { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
