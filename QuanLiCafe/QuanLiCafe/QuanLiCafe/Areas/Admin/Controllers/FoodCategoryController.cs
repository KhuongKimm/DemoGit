using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class FoodCategoryController : BaseController
    {
        // GET: Admin/FoodCategory
        [HttpGet]
        public ActionResult Index(string seaching, int page = 1, int pageSize = 5)
        {
            var dao = new FoodCategoryDao();
            var model = dao.ListAll(seaching, page, pageSize);
            ViewBag.seaching = seaching;
            ViewBag.rowStart = (page - 1) * pageSize;
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var dao = new FoodCategoryDao();
            var result = dao.ViewDetail(id);
            return View(result);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            new FoodCategoryDao().Delete(id);
            SetAlert("Xóa danh mục thức ăn thành công", "success");
            return RedirectToAction("index");
        }

        [HttpPost]
        public ActionResult Create(FoodCategory foodc)
        {
            if (ModelState.IsValid)
            {
                var dao = new FoodCategoryDao();
                var result = dao.Insert(foodc);
                if (result > 0)
                {
                    SetAlert("Tạo danh mục thành công", "success");
                    return RedirectToAction("index", "FoodCategory");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thực đơn không thành công");
                }
            }
            return View("index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new FoodCategoryDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        [HttpPost]
        public ActionResult Edit(FoodCategory foodc)
        {
            if (ModelState.IsValid)
            {
                var dao = new FoodCategoryDao();
                var result = dao.Edit(foodc);
                if (result == true)
                {
                    SetAlert("Cập nhật danh mục thành công", "success");
                    return RedirectToAction("index");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("index");
        }
    }
}