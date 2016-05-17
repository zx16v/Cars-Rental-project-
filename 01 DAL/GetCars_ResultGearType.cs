using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Change from bool value to string for display a the view 
namespace Shim_Cars
{
    using System;
    
    public partial class GetCars_Result
    
    {
         public string GetGearType() { return Gear ? "Automatic" : "Manuel"; }
    }
}
