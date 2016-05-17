using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shim_Cars
{
     public class CarsModelLogic : BaseLogic
    {

            
       
         public List<GetCarsModelByMaker_Result> GetCarModelsByMakerID(int MakerID)
         {
             return DB.GetCarsModelByMaker(MakerID).ToList();
         }
         
         public List<CarsModel> GetAllCarsModels()
        {
            return DB.CarsModels.ToList();
        }

        public CarsModel GetOneCarsModel(int ModelCode)
        {
            return DB.CarsModels.FirstOrDefault(e => e.ModelCode == ModelCode);
        }

        public void AddCarsModel(CarsModel CarModel)
        {
            DB.CarsModels.Add(CarModel);
            DB.SaveChanges();
        }

        public void DeleteCars(CarsModel CarModel)
        {
            DB.CarsModels.Remove(CarModel);
            DB.SaveChanges();
        }

        public void UpdateCarsModels(CarsModel CarModel)
        {
            DB.CarsModels.Attach(CarModel); // כאילו שהבאנו אותו ממסד הנתונים EntityFramework צרוף האובייקט לסכימה של
            DB.Entry(CarModel).State = System.Data.EntityState.Modified;
            DB.SaveChanges();
        }
    }
}
  
        

      

       

       

       
   


