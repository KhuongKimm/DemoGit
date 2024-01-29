using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using QuanLiCafe.Areas.Admin.Models;
using QuanLiCafe.Common;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                int result = dao.Login(model.UserName, model.PassWord);
                if (result == 1)
                {
                    var user = dao.GetbyUser(model.UserName);
                    var user_Sesion = new UserLogin();
                    user_Sesion.UserName = model.UserName;
                    user_Sesion.Name = user.Name;
                    user_Sesion.User_Id = user.id;
                    user_Sesion.idRoel = user.idRole;
                    Session.Add("User_Session", user_Sesion);
                    if(user.idRole != 1)
                    {
                        return Redirect("/Admin/Home/HomeMember");
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                   
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không đúng !");
                }
                else
                    if (result == -1)
                {
                    ModelState.AddModelError("", "Sai mật khẩu !");
                }
                else if (result == 2)
                {
                    ModelState.AddModelError("", "Tài khoản bị khóa !");
                }
            }
            return View("index");

        }
    }
}