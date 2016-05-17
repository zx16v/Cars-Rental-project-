using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Shim_Cars.Models
{
    public class SearchViewModel
    {
         //[DataType(DataType.Date)]
         [Required(ErrorMessage = "Missing Begin RentDate")]
         [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
     
        public System.DateTime BeginDate {   get ;set; }
       
        [Required(ErrorMessage = "Missing End RentDate")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime EndDate { get; set; }
  
        [StringLength(50, ErrorMessage = "Value Too Long!")]
        public string CarModel { get ; set;}
        public string CarMake { get; set; }
        public string TransmissionType { get; set; }
        public List<SelectListItem> CarMakeList { get; set; }
        public List<SelectListItem> CarModelList { get; set; }
        public List<SelectListItem> TransmissionTypeList { get; set; }


        
      
 
        }

    }
