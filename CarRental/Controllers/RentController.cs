using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shim_Cars.Models;

namespace Shim_Cars
{
    public class RentController : Controller
    {
        private static OrderViewModel orderVmodel;

  
        [Authorize]
        public ActionResult ReadFromSession()
        {
            if (Session["Username"] != null)
            {
                string start = Convert.ToString(Session["start Time"]);
                string end =   Convert.ToString(Session["End Time"]);
                return RedirectToAction("OrderIndex", "Rent");
            }
            return RedirectToAction("OrderIndex", "Rent");
        }
        /// <summary>
        /// Get the Details send by the Search by clicking a row in the results table  and post it to the VIEW 
        /// </summary>
        /// <param name="PicUpDate"></param>
        /// <param name="ReturnDate"></param>
        /// <param name="ManufacturerName"></param>
        /// <param name="ModelName"></param>
        /// <param name="Year"></param>
        /// <param name="GearType"></param>
        /// <param name="DailyRentalCost"></param>
        /// <param name="DailyLateReturnCost"></param>
        /// <param name="CarNumber"></param>
        /// <returns></returns>
        [Authorize]
        public ActionResult Order(string PicUpDate, string ReturnDate, string ManufacturerName, string ModelName, string Year,
            string GearType, string DailyRentalCost, string DailyLateReturnCost, String CarNumber)
        {
             OrderViewModel Ordermodel = new OrderViewModel();
             Ordermodel.PicUpDate           = Convert.ToDateTime(PicUpDate);
             Ordermodel.ReturnDate          = Convert.ToDateTime(ReturnDate);
             Ordermodel.Year                = Convert.ToInt32(Year);
             Ordermodel.GearType            = GearType;
             Ordermodel.DailyRentalCost     = Convert.ToInt32(DailyRentalCost);
             Ordermodel.DailyLateReturnCost = Convert.ToInt32(DailyLateReturnCost);
             Ordermodel.ManufacturerName    = ManufacturerName;
             Ordermodel.ModelName           = ModelName;
             Ordermodel.CarNumber           = Convert.ToInt32(CarNumber);
             Ordermodel.UserName = User.Identity.Name;
             Session["Order"] = Ordermodel;

             orderVmodel =  Ordermodel;
             return View(Ordermodel);
        }


        //[Authorize]
        //public ActionResult OrderIndex(OrderViewModel OrderData)  
        //{
        //    OrderViewModel order = new OrderViewModel();
        //    order.ManufacturerName = OrderData.ManufacturerName;
        //    order.ModelName = OrderData.ModelName;
        //    order.GearType= OrderData.GearType;
        //    order.DailyLateReturnCost= OrderData.DailyLateReturnCost;
        //    order.DailyRentalCost= OrderData.DailyRentalCost;
        //    order.PicUpDate= OrderData.PicUpDate;
        //    order.ReturnDate= OrderData.ReturnDate;
        //    order.Year = OrderData.Year;
        //    order.UserName= User.Identity.Name;
        //    orderVmodel = order;
        //    Session["Order"] = order;
        //   // ViewBag.UserName = user;
        //    return View(order);  
        //}


        [Authorize]
        [HttpPost]
        public ActionResult MakeOrderP()
        {
            //call the SP to add the the order detail in the Car Rental table in the DB 
            // and catch the execption of 3 colmun constarint in the DB in case of resubmitting 
            UserLogic logic = new UserLogic();
            CarRentalLogic logicR = new CarRentalLogic();
            string userName = User.Identity.Name;
            int userIdCode = logic.GetUserIDCode(userName);
            var Order = Session["Order"] as OrderViewModel;
            try
            {
                int msg = logicR.AddCarRental(orderVmodel.PicUpDate, orderVmodel.ReturnDate, orderVmodel.CarNumber, userIdCode);
            }
            catch ( Exception    odbcEx)
            {
              string msg=  odbcEx.Message;
              ViewData["message"] = "You Resubmit your Order !" ;
              ViewBag.Message = "You Resubmit your Order !";
              return View("Order", Order);
        
            }
            return View("Order", Order);
          
        }



        //[Authorize]
        //public JsonResult MakeOrder(int CarNumber)
        //{
           
        //   UserLogic      logic        = new UserLogic();
        //   CarRentalLogic logicR       = new CarRentalLogic();
        //   string         userName     = User.Identity.Name;
        //   int            userIdCode   = logic.GetUserIDCode(userName);
        //   int            msg          = logicR.AddCarRental(orderVmodel.PicUpDate, orderVmodel.ReturnDate, orderVmodel.CarNumber, userIdCode);
        //   return Json(msg, JsonRequestBehavior.AllowGet);
        //}
      
    
    }
}
