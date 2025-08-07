using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using bibApplication.Models;
using bibApplication.Models.Dtos;

namespace bibApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsersController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<UserReadDto>>> GetAllUsers()
        {
            var users = await _context.Users
                .Select(u => new UserReadDto
                {
                    Id = u.Id,
                    Name = u.Name,
                    SurName = u.SurName,
                    Role = u.Role,
                    Email = u.Email,
                    Position = u.Position,
                    CreatedAt = u.CreatedAt,
                    InstitutionId = u.InstitutionId
                })
                .ToListAsync();

            return Ok(users);
        }

        // GET: api/users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserReadDto>> GetUserById(int id)
        {
            var user = await _context.Users
                .Where(u => u.Id == id)
                .Select(u => new UserReadDto
                {
                    Id = u.Id,
                    Name = u.Name,
                    SurName = u.SurName,
                    Role = u.Role,
                    Email = u.Email,
                    Position = u.Position,
                    CreatedAt = u.CreatedAt,
                    InstitutionId = u.InstitutionId
                })
                .FirstOrDefaultAsync();

            if (user == null)
                return NotFound();

            return Ok(user);
        }

        // POST: api/users
        [HttpPost]
        public async Task<ActionResult<UserReadDto>> CreateUser(UserCreateDto dto)
        {
            var user = new User
            {
                Name = dto.Name,
                SurName = dto.SurName,
                Role = dto.Role,
                Email = dto.Email,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(dto.PasswordHash),
                Position = dto.Position,
                CreatedAt = DateTime.Now,
                InstitutionId = dto.InstitutionId
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            var readDto = new UserReadDto
            {
                Id = user.Id,
                Name = user.Name,
                SurName = user.SurName,
                Role = user.Role,
                Email = user.Email,
                Position = user.Position,
                CreatedAt = user.CreatedAt,
                InstitutionId = user.InstitutionId
            };

            return CreatedAtAction(nameof(GetUserById), new { id = user.Id }, readDto);
        }

        // PUT: api/users/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateUser(int id, UserUpdateDto dto)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound();

            user.Name = dto.Name;
            user.SurName = dto.SurName;
            user.Role = dto.Role;
            user.Email = dto.Email;
            user.PasswordHash = dto.PasswordHash;
            user.Position = dto.Position;
            user.CreatedAt = DateTime.Now;
            user.InstitutionId = dto.InstitutionId;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        // PATCH: api/users/5
        [HttpPatch("{id}")]
        public async Task<IActionResult> PatchUser(int id, UserUpdateDto dto)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound();

            if (!string.IsNullOrEmpty(dto.Name))
                user.Name = dto.Name;
            if (!string.IsNullOrEmpty(dto.SurName))
                user.SurName = dto.SurName;
            if (!string.IsNullOrEmpty(dto.Role))
                user.Role = dto.Role;
            if (!string.IsNullOrEmpty(dto.Email))
                user.Email = dto.Email;
            if (!string.IsNullOrEmpty(dto.PasswordHash))
                user.PasswordHash = dto.PasswordHash;
            if (!string.IsNullOrEmpty(dto.Position))
                user.Position = dto.Position;
            if (dto.CreatedAt != default)
                user.CreatedAt = DateTime.Now;
            if (dto.InstitutionId != 0)
                user.InstitutionId = dto.InstitutionId;

            await _context.SaveChangesAsync();
            return Ok(new
            {
                message = "User updated successfully"
            });
        }

        // DELETE: api/users/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
                return NotFound();

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDto dto)
        {
            // 1. Email ile kullanıcıyı bul
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.Email == dto.Email);

            if (user == null)
                return Unauthorized(new { message = "Invalid email or password" });

            // 2. Gelen düz şifre ile DB'deki hash'i karşılaştır
            bool isPasswordValid = BCrypt.Net.BCrypt.Verify(dto.PasswordHash, user.PasswordHash);

            if (!isPasswordValid)
                return Unauthorized(new { message = "Invalid email or password" });

            // 3. Başarılı giriş → kullanıcı bilgilerini döndür
            return Ok(new
            {
                Id = user.Id,
                Name = user.Name,
                SurName = user.SurName,
                Role = user.Role,
                Email = user.Email,
                Position = user.Position,
                CreatedAt = user.CreatedAt,
                InstitutionId = user.InstitutionId
            });

        }

    }
}
