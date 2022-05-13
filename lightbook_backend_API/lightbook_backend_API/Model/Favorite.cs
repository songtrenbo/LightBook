using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_backend_API.Model
{
    [Table("Favorites")]
    public class Favorite
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [Required]
        [ForeignKey("User")]
        public int UserID { get; set; }
        public User User { get; set; }
        [Required]
        [ForeignKey("Book")]
        public int BookID { get; set; }
        public Book Book { get; set; }
    }
}
