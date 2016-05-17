using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;

namespace Shim_Cars
{
     public class ManufacturerLogic:BaseLogic
    {
        public List<Manufacturer> GetAllManufacturers()
        {
            return DB.Manufacturers.ToList();
        }

        public Manufacturer GetOneManufacturer(int ManufacturerCode)
        { 
            return DB.Manufacturers.FirstOrDefault(e => e.ManufacturerCode == ManufacturerCode);
        }

        public void AddManufacturer(Manufacturer manufacturer)
        {
            DB.Manufacturers.Add(manufacturer);
            DB.SaveChanges();
        }

        public void UpdateManufacturer(Manufacturer manufacturer)
        {
            DB.Manufacturers.Attach(manufacturer); // כאילו שהבאנו אותו ממסד הנתונים EntityFramework צרוף האובייקט לסכימה של
            DB.Entry(manufacturer).State = System.Data.EntityState.Modified;
            DB.SaveChanges();
        }

      

        public void DeleteManufacturer(Manufacturer manufacturer)
        {
            DB.Manufacturers.Remove(manufacturer);
            DB.SaveChanges();
        }
    }
}
