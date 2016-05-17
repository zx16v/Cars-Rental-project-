
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shim_Cars
{
    public class CarController : Controller
    {
        // GET: Car
        public ActionResult Index()
        {
            using (CarsLogic logic = new CarsLogic())
            {
                List<Shim_Cars.GetCars_Result> x = logic.GetAllCars();
                return View(logic.GetAllCars());
            }
        }

        // GET: Car/Details/5
        public ActionResult Details(int carNum)
        {
            using (CarsLogic logic = new CarsLogic())
                return View(logic.GetOneCar(carNum));
        }

        // GET: Car/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Car/Create
        [HttpPost]
        public ActionResult Create(Car car)
        {
            try
            {
                // TODO: Add insert logic here
                if (!ModelState.IsValid)
                    return View();
                using (CarsLogic logic = new CarsLogic())
                    logic.AddCar(car);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Car/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Car/Edit/5
        [HttpPost]
        public ActionResult Edit(Car car)
        {
            try
            {
                // TODO: Add update logic here
                if (!ModelState.IsValid)
                    return View();
                using (CarsLogic logic = new CarsLogic())
                    logic.UpdateCar(car);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Car/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Car/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Car car)
        {
            try
            {
                // TODO: Add delete logic here
                if (!ModelState.IsValid)
                    return View();
                using (CarsLogic logic = new CarsLogic())
                    logic.DeleteCar(car);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}