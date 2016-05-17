using System.Web;
using System.Web.Mvc;

namespace CarRental// changed 18:00 28/8
 //namespace Shim_Cars
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}