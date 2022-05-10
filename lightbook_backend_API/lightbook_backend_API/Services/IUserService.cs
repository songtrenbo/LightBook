using lightbook_backend_API.Model;
using lightbook_backend_API.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Services
{
    public interface IUserService
    {
        Task<List<User>> GetUsers();
        Task<bool> CheckUser([FromForm] LoginModel model);
        Task<User> Register([FromForm] RegisterModel model);
    }
}
