using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    public class Catalog
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public List<CatalogBook> CatalogBooks { get; set; }
    }
}
