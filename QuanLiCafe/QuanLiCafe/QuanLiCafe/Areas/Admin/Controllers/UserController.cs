using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.EF;

namespace QuanLiCafe.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index(string seaching, int? idRole, int page = 1, int pageSize = 5,long? selectedI = null)
        {
            var dao = new UserDao();
            var model = dao.listAllpage(seaching, page, pageSize, idRole);
          
            ViewBag.idRole = new SelectList(dao.listAc(), "Role_id", "RoleName", selectedI);
            ViewBag.seaching = seaching;
            return View(model);

        }
        public void SetViewBagrole(long? selectedId = null)
        {
            var dao = new UserDao();
            ViewBag.idRole = new SelectList(dao.listAc(), "Role_id", "RoleName", selectedId);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var user = new UserDao();
            var rusult = user.ViewDetail(id);
            return View(rusult);
        }
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            new UserDao().Delete(id);
            SetAlert("Thêm User thành công", "success");
            return RedirectToAction("index");
        }
        public void SetViewBag(long? selectedId = null)
        {
            var dao = new RoleDao();
            ViewBag.idRole = new SelectList(dao.listAll(), "Role_id", "RoleName", selectedId);
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new UserDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }

        [HttpPost]
        public ActionResult Create(Account user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                long id = dao.Insert(user);
                if (id > 0)
                {
                    SetAlert("Thêm User thành công", "success");
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm User không thành công");
                }

            }
            return View("Index");
        }
        [HttpPost]
        public ActionResult Edit(Account user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                
                var result = dao.Edit(user);
                if (result == true  )
                {
                    if(user.idRole != 1)
                    {
                        SetAlert("Sửa User thành công", "success");
                        return Redirect("/Admin/Home/HomeMember");
                      
                    }
                    else
                    {
                        SetAlert("Sửa User thành công", "success");
                        return RedirectToAction("index");
                    }
                    
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