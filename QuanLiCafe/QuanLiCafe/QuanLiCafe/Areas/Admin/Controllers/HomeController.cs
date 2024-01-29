using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            var dao = new HomeDao();
            var model = dao.listByHome();
            return View(model);
        }
        public ActionResult HomeMember()
        {
            return View();
        }
    }
}