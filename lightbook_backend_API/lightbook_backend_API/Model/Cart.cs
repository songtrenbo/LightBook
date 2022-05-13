using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    [Table("Carts")]
    public class Cart
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [Required]
        public int TotalPrice { get; set; }
        [Required]
        [ForeignKey("User")]
        public int UserID { get; set; }
        public User User { get; set; }
        public List<CartDetail> CartDetails { get; set; }

    }
}
