using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class CartDetail
    {
        public int ID { get; set; }
        public int CartID { get; set; }
        public int BookID { get; set; }
        public int TotalPrice { get; set; }

        public Book Book { get; set; }
        public Cart Cart { get; set; }
    }
}
