using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Shim_Cars.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Missing Username")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Missing Password")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "Remember Me")]
        public bool RememberMe { get; set; }
    }
}