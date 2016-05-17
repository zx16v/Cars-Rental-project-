using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shim_Cars
{
    public class CarRentalLogic:BaseLogic
    {
       /// <summary>
       /// Self desctibing name 
       /// </summary>
       /// <returns></returns>
        public List<CarsRental> GetAllCars()
        {
             return DB.CarsRentals.ToList();
        }

        /// <summary>
        /// This method search for car and retrive form the DB by the SP one availble car for 
        /// esch model and it's car number.
        /// </summary>
        /// <param name="StartDate"></param>
        /// <param name="EndDate"></param>
        /// <param name="CarMake"></param>
        /// <param name="CarModel"></param>
        /// <param name="GearType"></param>
        /// <returns></returns>
        public List<GetUnicAvailableCars_Result> GetUnicAvailableCar(System.DateTime StartDate, System.DateTime EndDate, int? CarMake, int? CarModel, bool? GearType)
        {
            return DB.GetUnicAvailableCars(StartDate, EndDate, CarMake, CarModel, GearType).ToList();
        }

        /// <summary>
        /// Gets cars without cars numbers, it's  faster but not used for current project
        /// </summary>
        /// <param name="StartDate"></param>
        /// <param name="EndDate"></param>
        /// <param name="CarMake"></param>
        /// <param name="CarModel"></param>
        /// <param name="GearType"></param>
        /// <returns></returns>
        public List<GetAvailableCarsByModels_Result> GetAvailableCarsByModels(System.DateTime StartDate, System.DateTime EndDate, int? CarMake, int? CarModel, bool? GearType)
        {
            return DB.GetAvailableCarsByModels(StartDate, EndDate, CarMake, CarModel, GearType).ToList();
        }


        public List<GetAvailableCars_Result> GetAvailableCars(System.DateTime StartDate, System.DateTime EndDate, int? CarMake, int? CarModel, bool? GearType)
        {
            return DB.GetAvailableCars(StartDate, EndDate, CarMake, CarModel, GearType).ToList();
        }

        public CarsRental GetOneCarRentalByNum(int carNumber)
        {
            return DB.CarsRentals.FirstOrDefault(e => e.CarNumber == carNumber);
        }

        public CarsRental GetOneCarRentalByCode(int CodeCarRental)
        {
            return DB.CarsRentals.FirstOrDefault(e => e.CodeCarRental == CodeCarRental);
        }

        public List<GetAvailableCars_Result> GetCarAvailableCars(DateTime StartDate, DateTime EndDate, int? CarMakeId, int? CarModelCode, bool? GearType)
        {
            return DB.GetAvailableCars(StartDate, EndDate, CarMakeId, CarModelCode, GearType).ToList();
        }


        public int AddCarRental(DateTime desiredStartDate, DateTime desiredEndDate, int CarNumber ,int UserIdCode )
        {
            int msg=DB.RentOrder (desiredStartDate, desiredEndDate, CarNumber, UserIdCode);
            DB.SaveChanges();
            return msg;
        }
        
      
       
        public void UpdateCarsRental(CarsRental emp)
        {
            DB.CarsRentals.Attach(emp); // כאילו שהבאנו אותו ממסד הנתונים EntityFramework צרוף האובייקט לסכימה של
            DB.Entry(emp).State = System.Data.EntityState.Modified;
            DB.SaveChanges();
        }

        public void DeleteCarsRental(CarsRental emp)
        {
            DB.CarsRentals.Remove(emp);
            DB.SaveChanges();
        }



    }
}
