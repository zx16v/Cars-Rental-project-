using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shim_Cars.Models;
using CarRental.Models;
namespace Shim_Cars
{
    public class SearchController : Controller
    {
        public JsonResult CarModelsSelectListJson(string Origin, string Target, string Value)
        {
            using (CarsModelLogic logic = new CarsModelLogic())
            {
                int MakerID = Convert.ToInt32(Value);
                IEnumerable<GetCarsModelByMaker_Result> CM = logic.GetCarModelsByMakerID(MakerID);
                List<SelectListItem> CarModels = new List<SelectListItem>();
                CarModels.Add(new SelectListItem { Text = "Select Car Model", Value = "0" });
                foreach (GetCarsModelByMaker_Result item in CM)
                CarModels.Add(new SelectListItem { Text = item.ModelName, Value =item.ModelCode.ToString() });
                return Json(CarModels);
            }

        }

        public JsonResult CarModelsSelectListJson1(string Origin, string Target, string Value)
        {
            using (CarsModelLogic logic = new CarsModelLogic())
            {
                int MakerID = Convert.ToInt32(Value);
                IEnumerable<GetCarsModelByMaker_Result> CM = logic.GetCarModelsByMakerID(MakerID);
                List<SelectListItem> CarModels = new List<SelectListItem>();
                foreach (GetCarsModelByMaker_Result item in CM)
                CarModels.Add(new SelectListItem { Text = item.ModelName, Value = item.ModelCode.ToString() });
                return Json(CarModels);
            }

        }


        public ActionResult SaveInSession(System.DateTime BeginDate, System.DateTime EndDate)
        {
          
            Session["Username"] = User.Identity.Name; 
            Session.Add("start Time", BeginDate);
            Session.Add("End Time", EndDate);
            return RedirectToAction("ReadFromSession","Rent");
        }


        public JsonResult SearchForUnicRent(System.DateTime BeginDate, System.DateTime EndDate, int? CarMake, int? CarModel, bool? GearType)
        {
            if (CarMake == 0)
                CarMake = null;
            if (CarModel == 0)
                CarModel = null;
           using (CarRentalLogic logic = new CarRentalLogic())
            {
                IEnumerable<GetUnicAvailableCars_Result> Avail4Rent = logic.GetUnicAvailableCar(BeginDate, EndDate, CarMake, CarModel, GearType);
                return Json(Avail4Rent, JsonRequestBehavior.AllowGet);
            }
        }



        public JsonResult SearchForRent(System.DateTime BeginDate, System.DateTime EndDate, int? CarMake, int? CarModel, bool? GearType)
        {
            if (CarMake == 0)
                CarMake = null;
            if (CarModel == 0)
                CarModel = null;
            using (CarRentalLogic logic = new CarRentalLogic())
            {
                IEnumerable<GetAvailableCarsByModels_Result> Avail4Rent = logic.GetAvailableCarsByModels(BeginDate, EndDate, CarMake, CarModel, GearType);
                return Json(Avail4Rent, JsonRequestBehavior.AllowGet);
            }
        }

        //public ActionResult GetSendOrderData(OrderViewModel OrderData)
        //{


        //    Session["Order"] = OrderData;
        //    return RedirectToAction("ReadOrderFromSearch");
        //}




      //  [Authorize] 
        public ActionResult CarsIndex()
        {
            using (ManufacturerLogic logic = new ManufacturerLogic())
            {
                IEnumerable<Manufacturer> kkk = logic.GetAllManufacturers();

                List<SelectListItem> MakerList = new List<SelectListItem>();
                MakerList.Add(new SelectListItem { Text = "Select Car Make", Value = "0" });
                foreach (Manufacturer item in kkk)
                {
                  MakerList.Add(new SelectListItem { Text = item.ManufacturerName, Value = item.ManufacturerCode.ToString() });
                }
                
                List<SelectListItem> GearTypes = new List<SelectListItem>();
                GearTypes.Add(new SelectListItem { Text = "All Gear types", Value = "null" });
                GearTypes.Add(new SelectListItem { Text = "Automatic", Value = "1" });
                GearTypes.Add(new SelectListItem { Text = "Manual", Value = "0" });
                SearchViewModel ViewModel;
                ViewModel = new SearchViewModel()
                {
                    CarMakeList = MakerList,
                    CarModelList = new List<SelectListItem>(),
                    TransmissionTypeList= GearTypes,
                    BeginDate = DateTime.Now,
                    EndDate = DateTime.Now
                };
                return View(ViewModel);

            }



        }
    }
}
    