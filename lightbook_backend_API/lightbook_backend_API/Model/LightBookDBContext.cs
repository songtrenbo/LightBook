using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class LightBookDBContext: DbContext
    {
        public LightBookDBContext(DbContextOptions<LightBookDBContext> options) : base(options)
        {

        }
        public DbSet<Author> Authors { get; set; }
        public DbSet<AuthorBook> AuthorBooks { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<BookUser> BookUsers { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<CartDetail> CartDetails { get; set; }
        public DbSet<Catalog> Catalogs { get; set; }
        public DbSet<CatalogBook> CatalogBooks { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Favorite> Favorites { get; set; }
        public DbSet<User> Users { get; set; }

    }
}
