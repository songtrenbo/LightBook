using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace lightbook_backend_API.Model
{
    [Table("Users")]
    public class User
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [MaxLength(100)]
        [Required]
        public string Name { get; set; }
        [Required]
        [MaxLength(1000)]
        public string Avatar { get; set; }
        [Required]
        [MaxLength(100)]
        public string Username { get; set; }
        [Required]
        [MaxLength(100)]
        public string Password { get; set; }
        [Required]
        [MaxLength(10)]
        [MinLength(10)]
        public string PhoneNumber { get; set; }
        [Required]
        [ForeignKey("Role")]
        public int RoleID { get; set; }
        public Role Role { get; set; }

        public List<BookUser> BookUsers { get; set; }
        public List<Cart> Carts { get; set; }
        public List<Comment> Comments { get; set; }
        public List<Favorite> Favorites { get; set; }

    }
}
