using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class TKDTController : BaseController
    {
        // GET: Admin/TKDT
        [HttpGet]
        public ActionResult Index(string ChonTime,string date,string date1)
        {
            var dao = new TKDTDao();
            var model = dao.ListALl(ChonTime,date, date1);
            return View(model);
        }
    
       

    }
}