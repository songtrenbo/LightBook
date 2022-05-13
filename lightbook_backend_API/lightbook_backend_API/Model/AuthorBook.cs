using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    [Table("AuthorBooks")]
    public class AuthorBook
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [Required]
        [ForeignKey("Author")]
        public int AuthorID { get; set; }
        [Required]
        [ForeignKey("Book")]
        public int BookID { get; set; }

        public Author Author { get; set; }
        public Book Book { get; set; }
    }
}
