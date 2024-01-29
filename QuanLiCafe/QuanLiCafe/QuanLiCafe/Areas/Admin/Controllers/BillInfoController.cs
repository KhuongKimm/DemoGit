using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class BillInfoController : Controller
    {
        // GET: Admin/BillInfo
        public ActionResult Index()
        {
            return View();
        }
       
    }
}