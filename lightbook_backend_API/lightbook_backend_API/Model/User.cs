using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class User
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Avatar { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }

        public List<BookUser> BookUsers { get; set; }
        public List<Cart> Carts { get; set; }
        public List<Comment> Comments { get; set; }
        public List<Favorite> Favorites { get; set; }
    }
}
