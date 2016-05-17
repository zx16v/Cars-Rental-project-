using System.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shim_Cars.Models;
using Shim_Cars;
namespace Shim_Cars
{
    public class UsersController : Controller
    {
        private CarsRentalEntities db = new CarsRentalEntities();

        // GET: Users
        public ActionResult Index()
        {
            using (UserLogic logic = new UserLogic())
                return View(logic.GetAllUsers());
        }

        // GET: Users/Details/5
        public ActionResult Details(int id)
        {

            using (UserLogic logic = new UserLogic())
            {
                User user = logic.GetOneUser(id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "UserIDCode,FirstName,LastName,UserID,UserName,Password,Email,BirthDate")] User user)
        //{

        //        if (ModelState.IsValid)
        //    {
        //            using (UserLogic logic = new UserLogic())
        //            {
        //                logic.AddUser(user);
        //                return RedirectToAction("Index");
        //            }
        //    }

        //    return View(user);
        //}

        // GET: Users/Edit/5
        public ActionResult Edit(int id)
        {
            using (UserLogic logic = new UserLogic())
            {
                User user = logic.GetOneUser(id);
                if (user == null) { return HttpNotFound(); }
                return View(user);
            }
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "UserIDCode,FirstName,LastName,UserID,UserName,Passward,Email,BirthDate")] User user)
        //{
        //   if (ModelState.IsValid)
        //    {
        //        using (UserLogic logic = new UserLogic())
        //        {
        //            logic.UpdateUser(user);
        //            return RedirectToAction("Index");
        //        }
        //    }
        //    return View(user);
        //}

        // GET: Users/Delete/5
        public ActionResult Delete(int id)
        {
            using (UserLogic logic = new UserLogic())
            {
                User user = logic.GetOneUser(id);
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
        }

        // POST: Users/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    using (UserLogic logic = new UserLogic())
        //    {
        //        User user = logic.GetOneUser(id);
        //        logic.DeleteUser(user);
        //        return RedirectToAction("Index");
        //    }
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

    }

}