using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class Comment
    {
        public int ID { get; set; }
        public string Content { get; set; }
        public int UserID { get; set; }
        public int BookID { get; set; }

        public Book Book { get; set; }
        public User User { get; set; }
    }
}
