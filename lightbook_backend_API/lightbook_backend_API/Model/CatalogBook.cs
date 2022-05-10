using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class CatalogBook
    {
        public int ID { get; set; }
        public int CatalogID { get; set; }
        public int BookID { get; set; }

        public Book Book { get; set; }
        public Catalog Catalog { get; set; }
    }
}
