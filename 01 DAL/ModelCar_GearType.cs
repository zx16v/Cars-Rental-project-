using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shim_Cars
{
    public partial class CarsModel
    {
     
        public string GetGearType
        {
            get  { return Gear ? "Automatic" : "Manuel"; }
          
        }
       
    }
}
