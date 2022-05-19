using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;

namespace lightbook_backend_API.Model
{
    [Table("Comments")]
    public class Comment
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int ID { get; set; }
        public string Content { get; set; }
        [Required]
        [ForeignKey("User")]
        public int UserID { get; set; }
        public User User { get; set; }
        [Required]
        [ForeignKey("Book")]
        public int BookID { get; set; }
        public Book Book { get; set; }
        [DefaultValue(0)]
        public Nullable<double> RatePoint { get; set; }
        public DateTime DateComment { get; set; }
    }
}
