using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Model
{
    [Table("Books")]
    public class Book
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        [MaxLength(100)]
        [Required]
        public string Name { get; set; }
        [Required]
        public int Price { get; set; }
        [Required]
        public string Review { get; set; }
        [DefaultValue(0)]
        public Nullable<double> RatePoint { get; set; }
        [Required]
        [MaxLength(500)]
        public string Picture { get; set; }
        public string Chapter {get;set;}
        [Required]
        [ForeignKey("Category")]
        public int CategoryID { get; set; }
        public Category Category { get; set; }
        public List<AuthorBook> AuthorBooks { get; set; }
        public List<BookUser> BookUsers { get; set; }
        public List<CartDetail> CartDetails { get; set; }
        public List<CatalogBook> CatalogBooks { get; set; }
        public List<Comment> Comments { get; set; }
        public List<Favorite> Favorites { get; set; }
    }
}
