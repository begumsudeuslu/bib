namespace bibApplication.Models.Dtos
{
    public class UserCreateDto
    {
        public string Name { get; set; }
        public string SurName { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public string Position { get; set; }
        public int InstitutionId { get; set; }
    }
}
