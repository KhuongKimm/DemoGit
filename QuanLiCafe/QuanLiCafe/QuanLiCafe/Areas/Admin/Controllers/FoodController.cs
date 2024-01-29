using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using PagedList;
using Models.EF;
using System.Web.Script.Serialization;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class FoodController : BaseController
    {
        // GET: Admin/Food

        
        public ActionResult Index(string seaching,int? idCategory,int? idDVT, int page = 1, int pageSize = 10, long? selectedId=null, long? selectedDVT = null)
        {
           
            var dao = new FoodDao();
            var model = dao.ListByFoodid(seaching, idCategory, idDVT,page, pageSize);
            SetViewBag(selectedId);
            SetViewBagDVT(selectedDVT);
            ViewBag.seaching = seaching;
            ViewBag.rowStart = ((page-1)* pageSize);
            return View(model);
        }
        public void SetViewBag(long? selectedId = null)
        {
            var dao = new FoodCategoryDao();
            ViewBag.idCategory = new SelectList(dao.listFoodCate(), "FoodCategory_id", "FoodCategory_name", selectedId);
        }
        public void SetViewBagDVT(long? selectedDVT = null)
        {
            var dao = new DVTDao();
            ViewBag.idDVT = new SelectList(dao.ListbyFood(), "DVT_id", "DVT_Name", selectedDVT);
        }
        [HttpGet]
        public JsonResult Edit(int id)
        {
            var dao = new FoodDao();
            var model = dao.Viewdetail(id);
            SetViewBag();
            return Json(new
            {
                data= model,
                id
            }, JsonRequestBehavior.AllowGet);
        
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {

            new FoodDao().Delete(id);
            SetAlert("Thêm món thành công", "success");
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Create(Food food)
        {
            
            if (ModelState.IsValid)
            {
                var dao = new FoodDao();
                var result = dao.insert(food);
                if (result == true)
                {
                    SetAlert("Tạo món thành công", "success");
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
        public ActionResult Update(Food food)
        {
            if(ModelState.IsValid)
            {
                var dao = new FoodDao();
                var result = dao.Edit(food);
                if(result==true)
                {
                    SetAlert("Tạo món thành công", "success");
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
        public JsonResult ChangeStatus(long id)
        {
            var result = new FoodDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}