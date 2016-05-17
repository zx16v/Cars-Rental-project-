using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shim_Cars;

namespace Shim_Cars
{
    public class ManufacturersController : Controller
    {
      //  private CarsRentalEntities db = new CarsRentalEntities();

        // GET: Manufacturers
        public ActionResult Index()
        {
            using (ManufacturerLogic logic = new ManufacturerLogic())
            return View(logic.GetAllManufacturers());
        }

        // GET: Manufacturers/Details/5
        public ActionResult Details(int id)
        {
            using (ManufacturerLogic logic = new ManufacturerLogic())
            {
                Manufacturer manufacturer = logic.GetOneManufacturer(id);
                if (manufacturer == null)
                {
                    return HttpNotFound();
                }
                return View(manufacturer);
            }
        }

        // GET: Manufacturers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Manufacturers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ManufacturerCode,ManufacturerName")] Manufacturer manufacturer)
        {
            if (ModelState.IsValid)
            {
                using (ManufacturerLogic logic = new ManufacturerLogic())
                {
                    logic.AddManufacturer(manufacturer);
                   //.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            return View(manufacturer);
        }

        // GET: Manufacturers/Edit/5
        public ActionResult Edit(int id)
        {
            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            using (ManufacturerLogic logic = new ManufacturerLogic())
            {
                Manufacturer manufacturer = logic.GetOneManufacturer(id);
                if (manufacturer == null) { return HttpNotFound(); }
                return View(manufacturer);
            }
        }

        // POST: Manufacturers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ManufacturerCode,ManufacturerName")] Manufacturer manufacturer)
        {
            if (ModelState.IsValid)
            {
                using (ManufacturerLogic logic = new ManufacturerLogic())
                {
                   logic.UpdateManufacturer(manufacturer);
                   return RedirectToAction("Index");
                }
            }
            return View(manufacturer);
        }

        // GET: Manufacturers/Delete/5
        public ActionResult Delete(int id)
        {
            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            using (ManufacturerLogic logic = new ManufacturerLogic())
            {
                Manufacturer manufacturer = logic.GetOneManufacturer(id);
                if (manufacturer == null)
                {
                    return HttpNotFound();
                }
                return View(manufacturer);
            }
        }

        // POST: Manufacturers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            using (ManufacturerLogic logic = new ManufacturerLogic())
            {
                Manufacturer manufacturer = logic.GetOneManufacturer(id);
                logic.DeleteManufacturer(manufacturer);
                return RedirectToAction("Index");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                using (ManufacturerLogic logic = new ManufacturerLogic())
                {
                    logic.Dispose();
                  //  db.Dispose();
                }
                  
            }
            base.Dispose(disposing);
        }
    }
}
