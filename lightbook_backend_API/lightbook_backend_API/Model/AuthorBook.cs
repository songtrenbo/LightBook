using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class AuthorBook
    {
        public int ID { get; set; }
        public int AuthorID { get; set; }
        public int BookID { get; set; }

        public Author Author { get; set; }
        public Book Book { get; set; }
    }
}
