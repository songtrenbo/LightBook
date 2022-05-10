using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace lightbook_backend_API.Models
{
    public class RegisterModel
    {
        [Required]
        [Display(Name = "Enter User Name")]
        [StringLength(25, ErrorMessage = "User name length must be between {2} and {1}.", MinimumLength = 8)]
        public string UserName { get; set; }

        [Required]
        [Display(Name = "Enter Name")]
        public string Name { get; set; }


        [Display(Name = "Enter PhoneNumber")]
        public string PhoneNumber { get; set; }

        [Required]
        [Display(Name = "Enter Password")]
        [StringLength(17, ErrorMessage = "Password length must be between {2} and {1}.", MinimumLength = 8)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [NotMapped]
        [Compare("Password")]
        [Display(Name = "Re-Enter Password")]
        [Required(ErrorMessage = "Password does not match")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}
