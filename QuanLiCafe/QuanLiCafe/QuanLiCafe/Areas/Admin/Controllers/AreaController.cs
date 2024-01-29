using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

    namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class AreaController : BaseController
    {
        // GET: Admin/Area
        public ActionResult Index(string searching, int page = 1, int pageSize = 10)
        {
            var area = new AreaDao();
            var model = area.ListAll1(searching, page, pageSize);
            ViewBag.searching = searching;
            return View(model);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            new AreaDao().Delete(id);
            SetAlert("Xóa khu vực thành công", "success");
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Create(Area area)
        {
            if (ModelState.IsValid)
            {
                var dao = new AreaDao();
                var khuvuc = dao.insert(area);
                if (khuvuc == true)
                {
                    SetAlert("Thêm khu vực thành công", "success");
                    return RedirectToAction("index");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm mới không thành công");
                }
            }
            else
            {
                Response.Write("Không được để trống !");

            }

            return View("index");

        }
        [HttpPost]
        public ActionResult Edit(Area area)
        {
            if (ModelState.IsValid)
            {
                var dao = new AreaDao();
                var khuvuc = dao.Edit(area);
                if (khuvuc == true)
                {
                    SetAlert("Cập nhật khu vực thành công", "success");
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