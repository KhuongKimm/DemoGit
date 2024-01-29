using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.EF;
using Models.Dao;

namespace QuanLiCafe.Controllers
{
    public class BillInfoController : Controller
    {
        // GET: BillInfo
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(BillInfo billinfo)
        {
            if (ModelState.IsValid)
            {
                var billinfodao = new BillinfoDao();
                var result = billinfodao.Insert(billinfo);
                if (result == true)
                {
                    return RedirectToAction("index");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm mới không thành công");
                }
            }
            return View("index");
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            new BillinfoDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}