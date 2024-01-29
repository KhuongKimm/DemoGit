using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class DVTController : BaseController
    {
        // GET: Admin/DVT
        public ActionResult Index(string seaching, int page = 1, int pageSize=6)
        {
            var dao = new DVTDao();
            var model = dao.ListAll(seaching, page, pageSize);
            ViewBag.rowStrat = ((page - 1) * pageSize);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(DVT dvt)
        {
            if (ModelState.IsValid)
            {
                var dao = new DVTDao();
                var result = dao.insert(dvt);
                if (result == true)
                {
                    SetAlert("thêm mới thành công", "success");
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm mới không thành công");
                }
            }
            return View("index");
        }
        [HttpGet]
        public JsonResult Edit(int id)
        {
            var dao = new DVTDao();
            var model = dao.Viewdetail(id);
            return Json(new
            {
                data = model,
                id
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Update(DVT dvt)
        {
            if (ModelState.IsValid)
            {
                var dao = new DVTDao();
                var result = dao.Edit(dvt);
                if (result == true)
                {
                    SetAlert("Cập nhật thành công", "success");
                    return RedirectToAction("index");
                }
                else
                {
                    SetAlert("Cập nhật không thành công", "error");
                }
            }
            return View("index");
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            new DVTDao().Delete(id);
            SetAlert("Cập nhật thành công", "success");
            return RedirectToAction("index");
        }

    }
}