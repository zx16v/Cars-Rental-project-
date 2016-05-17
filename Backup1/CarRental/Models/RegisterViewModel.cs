using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Shim_Cars.Models
{
    public class RegisterViewModel
    {
        //added FirstName Lastname
        [Required(ErrorMessage = "Missing FirstName")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Missing Lastname")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        public string Lastname { get; set; }
        // end
        [Required(ErrorMessage = "Missing Username")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Missing Password")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Missing Confirm Password")]
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        [Compare("Password", ErrorMessage = "Passwords do not match!")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}