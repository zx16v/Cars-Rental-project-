using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shim_Cars
{
    public class CarsLogic: BaseLogic
    {
        public List<GetCars_Result> GetAllCars()
        {
           
         return DB.GetCars().ToList();
       }

        public Car GetOneCar(int CarNumber)
        {
            return DB.Cars.FirstOrDefault(e => e.CarNumber == CarNumber);
        }

        public void AddCar(Car car)
        {
            DB.Cars.Add(car);
            DB.SaveChanges();
        }

        public void UpdateCar(Car car)
        {
            DB.Cars.Attach(car); // כאילו שהבאנו אותו ממסד הנתונים EntityFramework צרוף האובייקט לסכימה של
            DB.Entry(car).State = System.Data.EntityState.Modified;
            DB.SaveChanges();
        }

        public void DeleteCar(Car car)
        {
            DB.Cars.Remove(car);
            DB.SaveChanges();
        }
    }
}
