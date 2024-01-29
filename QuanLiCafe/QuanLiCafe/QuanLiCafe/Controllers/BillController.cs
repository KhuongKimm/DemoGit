using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;
using QuanLiCafe.Areas.Admin.Controllers;

namespace QuanLiCafe.Controllers
{
    public class BillController : BaseController
    {
        // GET: Bill
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Bill bill)
        {
            if(ModelState.IsValid)
            {
                var dao = new BillDao();
                var result = dao.Insert(bill);
                if(result == true)
                {
                    SetAlert("Tạo Bill thành công", "success");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm hóa đơn không thành công");
                }
            }
            return View("index");
        }
    }
}