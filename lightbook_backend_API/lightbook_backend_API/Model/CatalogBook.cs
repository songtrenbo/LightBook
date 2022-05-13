using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_backend_API.Model
{
    [Table("CatalogBooks")]
    public class CatalogBook
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [Required]
        [ForeignKey("Catalog")]
        public int CatalogID { get; set; }
        public Catalog Catalog { get; set; }
        [Required]
        [ForeignKey("Book")]
        public int BookID { get; set; }
        public Book Book { get; set; }
    }
}
