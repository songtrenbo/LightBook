using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Models
{
    public class RefreshTokenModel
    {
        public string UserName { get; set; }
        public string Name { get; set; }
        //public string Role { get; set; }
        public string RefreshToken { get; set; }
    }
}
