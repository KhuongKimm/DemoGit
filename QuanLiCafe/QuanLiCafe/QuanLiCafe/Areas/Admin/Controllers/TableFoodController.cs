using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class TableFoodController : BaseController
    {
        // GET: Admin/TableFood
        public ActionResult Index(string seaching,int page = 1, int pageSize = 5, long? selectedId = null)
        {
            var dao = new TableFoodDao();
            var model = dao.ListByTableid(seaching,page, pageSize);
            ViewBag.seaching = seaching;
            var daoArea = new AreaDao();
            ViewBag.idArea = new SelectList(daoArea.ListAll(), "Area_id", "AreaName", selectedId);
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var dao = new TableFoodDao();
            var result = dao.ViewDetail(id);
            SetViewBag();
            return View(result);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {

            new TableFoodDao().Delete(id);
            SetAlert("Xóa bàn ăn thành công", "success");
            return RedirectToAction("index");
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new TableFoodDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        [HttpPost]
        public ActionResult Create(TableFood TF)
        {
                if(TF.idArea == 0 || TF.status==false)
            {
                SetAlert("Thêm bàn ăn thành công", "warning");
                return View("index");
            }
                else
            {
                var dao = new TableFoodDao();
                var tf = dao.insert(TF);

                if (tf > 0)
                {
                    SetAlert("Thêm bàn ăn thành công", "success");
                    return RedirectToAction("index", "TableFood");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm mới không thành công");
                }

            }

            return View("index");
        }
        public void SetViewBag(long? selectedId = null)
        {
            var dao = new AreaDao();
            ViewBag.idArea = new SelectList(dao.ListAll(), "Area_id", "AreaName", selectedId);
        }
        [HttpPost]
        public ActionResult Edit(TableFood tf)
        {
            if (ModelState.IsValid)
            {
                var dao = new TableFoodDao();
                var result = dao.Edit(tf);
                if (result == true)
                {
                    SetAlert("Cập nhật bàn ăn thành công", "success");
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