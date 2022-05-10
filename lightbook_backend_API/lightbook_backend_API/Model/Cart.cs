using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class Cart
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int TotalPrice { get; set; }

        public List<CartDetail> CartDetails { get; set; }
        public User User { get; set; }
    }
}
