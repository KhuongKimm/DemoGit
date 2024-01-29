using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class CTHDController : BaseController
    {
        // GET: Admin/CTHD
        public ActionResult Index(string seaching, string date, int page=1, int pageSize=8)
        {

            var dao = new CTHDDao();
            var model = dao.listbyAll(seaching, date,page, pageSize);
            ViewBag.seaching = seaching;
            ViewBag.rowStart = ((page-1)*pageSize);
            return View(model);
        }
        [HttpPost]
  
        public ActionResult GetBillinfo(int id)
        {
            try
            {
                var dao = new CTHDDao();
                var data = dao.GetByID(id);
                return View(data);
            }
            catch (NullReferenceException ex)
            {

                return null;
            }
          
        }
    }
}