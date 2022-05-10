using lightbook_backend_API.Model;
using lightbook_backend_API.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Services
{
    public class UserService: IUserService
    {
        private readonly LightBookDBContext _lightBookDBContext;
        public UserService(LightBookDBContext lightBookDBContext)
        {
            _lightBookDBContext = lightBookDBContext;
        }
        public async Task<bool> CheckUser([FromForm] LoginModel model)
        {
            var hasher = new PasswordHasher<User>();

            var user = await _lightBookDBContext.Users.FirstOrDefaultAsync(s => s.Username == model.UserName);
            if (user == null)
            {
                return false;
            }
            var result = hasher.VerifyHashedPassword(user, user.Password, model.Password);
            if (result != PasswordVerificationResult.Success)
            {
                return false;
            }
            model.UserId = user.ID;
            model.Name = user.Name;
            return true;
        }

        public async Task<List<User>> GetUsers()
        {
            return await _lightBookDBContext.Users.ToListAsync();
        }

        public async Task<User> Register([FromForm] RegisterModel model)
        {
            var hasher = new PasswordHasher<User>();
            User user = new User
            {
                Username = model.UserName,
                PhoneNumber = model.PhoneNumber,
                Name = model.Name,
                Password = hasher.HashPassword(null, model.Password),
                Avatar = "https://banner2.cleanpng.com/20180402/ojw/kisspng-united-states-avatar-organization-information-user-avatar-5ac20804a62b58.8673620215226654766806.jpg"
            };
            var result = await _lightBookDBContext.Users.AddAsync(user);
            await _lightBookDBContext.SaveChangesAsync();
            return result.Entity;
        }
    }
}
