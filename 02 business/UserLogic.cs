using System.Linq;
using System.Data;
using System.Web.Security;
using System.Web;
using System;
using System.Collections.Generic;
using System.Web.Mvc;




    //    public class UserLogic:BaseLogic
    //    {
    //        public List<User> GetAllUsers()
    //        {
    //            return DB.Users.ToList();
    //        }

    //        public User GetOneUser(int userCode)
    //        {
    //            return DB.Users.FirstOrDefault(e => e.UserIDCode == userCode);
    //        }

    //        public void AddUser(User user)
    //        {
    //            DB.Users.Add(user);
    //            DB.SaveChanges();
    //        }

    //        public void UpdateUser(User user)
    //        {
    //            DB.Users.Attach(user); // כאילו שהבאנו אותו ממסד הנתונים EntityFramework צרוף האובייקט לסכימה של
    //            DB.Entry(user).State = EntityState.Modified;
    //            DB.SaveChanges();
    //        }

    //        public void DeleteUser(User user)
    //        {
    //            DB.Users.Remove( user);
    //            DB.SaveChanges();
    //        }
    //    }
    //}

#pragma warning disable 618

    namespace Shim_Cars
    {

        /// <summary>
        /// Users logic - contains logic for the users table.
        /// </summary>
        public class UserLogic : BaseLogic
        {
            /// <summary>
            /// Register new user.
            /// </summary>
            /// <param name="username">The user's username.</param>
            /// <param name="password">The user's password.</param>
            public void Register(string username, string password, string firstname, string lastname)
            {
                // Need to add reference to: System.Web (Framework 4.0)
                string encryptPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "sha1");
                User user = new User { UserName = username, Password = encryptPassword, FirstName = firstname, LastName = lastname, UserID = 677 };
                DB.Roles.FirstOrDefault(r => r.RoleID == 6).Users.Add(user); // Set this user the "User" Role (RoleID = 6).
                DB.Users.Add(user);
                DB.SaveChanges();
            }

            /// <summary>
            /// Check if username already taken.
            /// </summary>
            /// <param name="username">The username to check.</param>
            /// <returns>Returns true if username already taken.</returns>
            public bool IsUsernameTaken(string username)
            {
                return DB.Users.Any(u => u.UserName == username);
            }
            public User GetOneUser(int userCode)
            {
                return DB.Users.FirstOrDefault(e => e.UserIDCode == userCode);
            }
            /// <summary>
            /// Check if user exists.
            /// </summary>
            /// <param name="username">The user's username.</param>
            /// <param name="password">The user's password.</param>
            /// <returns>Returns true if user exist.</returns>
            public bool IsUserExist(string username, string password)
            {
                string encryptPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "sha1");
                if (DB.Users.Any(u => u.UserName == username && u.Password == encryptPassword))
                {


                    return true;
                }
                return false;
            }

            /// <summary>
            /// Get all users.
            /// </summary>
            /// <returns>Returns all usernames.</returns>
            public string[] GetAllUsers()
            {

                return DB.Users.Select(u => u.UserName).ToArray();
            }

        public int GetUserIDCode(string userName)
        {
            var usr= DB.Users.Where(u => u.UserName == userName).Select(u => u.UserIDCode);

             int  us=  usr.ToList()[0];
             return us;
        }

        }
    }
