using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shim_Cars;

//namespace CarRental.Controllers
namespace Shim_Cars
{
    public class CarsModelsController : Controller
    {
        private CarsRentalEntities db = new CarsRentalEntities();

        //
        // GET: /CarsModels/

//[Authorize(Roles = "Admin, Manager")] 
        public ActionResult Index()
        {
            var carsmodels = db.CarsModels.Include(c => c.Manufacturer);
            return View(carsmodels.ToList());
        }

        //
        // GET: /CarsModels/Details/5
          [Authorize(Roles = "Admin, Manager")] 
        public ActionResult Details(int id = 0)
        {
            CarsModel carsmodel = db.CarsModels.Find(id);
            if (carsmodel == null)
            {
                return HttpNotFound();
            }
            return View(carsmodel);
        }

        //
        // GET: /CarsModels/Create
          [Authorize(Roles = "Admin, Manager")] 
        public ActionResult Create()
        {
            ViewBag.ManufacturerCode = new SelectList(db.Manufacturers, "ManufacturerCode", "ManufacturerName");
            return View();
        }

        //
        // POST: /CarsModels/Create
          [Authorize(Roles = "Admin, Manager")] 
        [HttpPost]
        public ActionResult Create(CarsModel carsmodel)
        {
            if (ModelState.IsValid)
            {
                db.CarsModels.Add(carsmodel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManufacturerCode = new SelectList(db.Manufacturers, "ManufacturerCode", "ManufacturerName", carsmodel.ManufacturerCode);
            return View(carsmodel);
        }

        //
        // GET: /CarsModels/Edit/5
          [Authorize(Roles = "Admin, Manager")] 
        public ActionResult Edit(int id = 0)
        {
            CarsModel carsmodel = db.CarsModels.Find(id);
            if (carsmodel == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManufacturerCode = new SelectList(db.Manufacturers, "ManufacturerCode", "ManufacturerName", carsmodel.ManufacturerCode);
            return View(carsmodel);
        }

        //
        // POST: /CarsModels/Edit/5

        [HttpPost]
        [Authorize(Roles = "Admin, Manager")] 
        public ActionResult Edit(CarsModel carsmodel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(carsmodel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManufacturerCode = new SelectList(db.Manufacturers, "ManufacturerCode", "ManufacturerName", carsmodel.ManufacturerCode);
            return View(carsmodel);
        }

        //
        // GET: /CarsModels/Delete/5
          [Authorize(Roles = "Admin, Manager")] 
        public ActionResult Delete(int id = 0)
        {
            CarsModel carsmodel = db.CarsModels.Find(id);
            if (carsmodel == null)
            {
                return HttpNotFound();
            }
            return View(carsmodel);
        }

        //
        // POST: /CarsModels/Delete/5
          [Authorize(Roles = "Admin, Manager")] 
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            CarsModel carsmodel = db.CarsModels.Find(id);
            db.CarsModels.Remove(carsmodel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}