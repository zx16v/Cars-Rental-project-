using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shim_Cars.Models;

using System.Web.Security;
// defined as  Account controller and it worked with the change of the name .
namespace Shim_Cars
{
    public class AccountsController : Controller
    {
        private UserLogic logic = new UserLogic();
        //
        // GET: /Accounts/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            if (!ModelState.IsValid)
                return View();

            logic.Register(model.Username, model.Password, model.FirstName, model.Lastname);

            // Log-in כך שהוא לא יצטרך לבצע Logged-In הגדרה שהמשתמש 
            FormsAuthentication.SetAuthCookie(model.Username, false);

            return RedirectToAction("Index", "Car");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            if (!ModelState.IsValid)
                return View();
        
           if (logic.IsUserExist(model.Username, model.Password))
            {
                // Login-פונקציה שמנתבת את המשתמש לדף ממנו הוא הגיע לדף ה
                FormsAuthentication.RedirectFromLoginPage(model.Username, model.RememberMe);
                                
            }

            ViewBag.Error = "Incorrect Username or Password";

            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Car");
        }

    }
}





           
       