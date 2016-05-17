using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Shim_Cars.Models
{
    public class OrderViewModel
    {
        private const int CurrentYear=2016;
        [Required(ErrorMessage = "Missing Begin RentDate")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime PicUpDate { get; set; }

        [Required(ErrorMessage = "Missing End RentDate")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime ReturnDate  { get; set; }

        [Range(2000, CurrentYear ,ErrorMessage = "Please enter valid Year")]
        public int Year                { get; set; }

        [Range(50, 1500, ErrorMessage = "Please enter valid price")]     
        public int DailyRentalCost     { get; set; }
        public int DailyLateReturnCost { get; set; }

        [StringLength(50, ErrorMessage = "Value Too Long!")]
        public string ModelName         { get; set; }
        public string ManufacturerName  { get; set; }
        public string GearType          { get; set; }
        public string UserName { get; set; }
        [Required(ErrorMessage = "Missing Car Number")]
         public int CarNumber { get; set; }


        
                
                             
                      
                   
                    
    }
}