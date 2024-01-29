using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class KhuyenMaiController : BaseController
    {
        // GET: Admin/KhuyenMai
        public ActionResult Index(string seaching, int page=1, int pageSize=4)
        {
            var dao = new KhuyenMaiDao();
            var model = dao.ListAll(seaching, page, pageSize);
            ViewBag.seaching = seaching;
            ViewBag.rowStrart = ((page - 1) * pageSize);
            return View(model);
        }
        [HttpPost]
        public ActionResult Create(KhuyenMai km)
        {
            if (ModelState.IsValid)
            {
                var dao = new KhuyenMaiDao();
                var result = dao.insert(km);
                if(result==true)
                {
                    SetAlert("Thêm mới thành công", "success");
                    return RedirectToAction("index");
                }
                else
                {
                    SetAlert("Thêm mới không thành công","error");
                }
            }
            return View("index");
        }
        [HttpGet]
        public JsonResult Edit(int id)
        {
            var dao = new KhuyenMaiDao();
            var model = dao.ViewDetail(id);
            return Json(new
            {
                data = model,
                id
            },JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public ActionResult Update(KhuyenMai km)
        {
            if(ModelState.IsValid)
            {
                var dao = new KhuyenMaiDao();
                var result = dao.Edit(km);
                if(result==true)
                {
                    SetAlert("Cập nhật thành công", "success");
                    return RedirectToAction("index");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Index");
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            new KhuyenMaiDao().Delete(id);
            return RedirectToAction("index");
        }
    }
}