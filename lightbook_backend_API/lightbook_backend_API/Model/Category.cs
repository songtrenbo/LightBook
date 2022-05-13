using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_backend_API.Model
{
    [Table("Categories")]
    public class Category
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [MaxLength(100)]
        [Required]
        public string Name { get; set; }

        public List<Book> Books { get; set; }
    }
}
