using Shim_Cars;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shim_Cars
{
    public abstract class BaseLogic : IDisposable
    {
        protected readonly CarsRentalEntities DB = new CarsRentalEntities();

        public void Dispose()
        {
            DB.Dispose();
        }


    }
}
