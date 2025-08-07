namespace bibApplication.Models.Dtos
{
    public class UserReadDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string SurName { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public string Position { get; set; }
        public DateTime CreatedAt { get; set; }
        public int InstitutionId { get; set; }
    }
}

