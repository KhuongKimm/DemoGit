using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;
using Models.ViewModel;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class QLBepBarController : BaseController
    {
        // GET: Admin/QLBepBar
        public ActionResult Index(string searching, int page=1, int pageSize=10)
        {
            var dao = new qlBEPBA();
            var model = dao.ListALl(searching, page, pageSize);
            ViewBag.searching = searching;
            return View(model);
        }
        [HttpPost]
        public JsonResult tramon(int idbill)
        {
            var dao = new qlBEPBA();
            var data = dao.Changess(idbill);
            return Json(new
            {
                data,
                idbill
            });
        }
    }
}