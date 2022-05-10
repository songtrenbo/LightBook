using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class Author
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public List<AuthorBook> AuthorBooks { get; set; }
    }
}
