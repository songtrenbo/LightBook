using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class Book
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Pỉce { get; set; }
        public string Review { get; set; }
        public Nullable<int> Pages { get; set; }
        public string Picture { get; set; }
        public int CategoryID { get; set; }

        public List<AuthorBook> AuthorBooks { get; set; }
        public Category Category { get; set; }
        public List<BookUser> BookUsers { get; set; }
        public List<CartDetail> CartDetails { get; set; }
        public List<CatalogBook> CatalogBooks { get; set; }
        public List<Comment> Comments { get; set; }
        public List<Favorite> Favorites { get; set; }
    }
}
