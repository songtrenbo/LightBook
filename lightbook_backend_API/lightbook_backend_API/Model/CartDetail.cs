using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_backend_API.Model
{
    [Table("CartDetails")]
    public class CartDetail
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [Required]
        public int TotalPrice { get; set; }
        [Required]
        [ForeignKey("Cart")]
        public int CartID { get; set; }
        public Cart Cart { get; set; }
        [Required]
        [ForeignKey("Book")]
        public int BookID { get; set; }
        public Book Book { get; set; }
        
    }
}
