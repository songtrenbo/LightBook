using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Models
{
    public class LoginModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public int UserId { get; set; }
        //public string Role { get; set; }
    }
}
