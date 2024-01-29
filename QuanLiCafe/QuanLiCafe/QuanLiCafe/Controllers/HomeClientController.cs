using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Dao;
using Models.ViewModel;
using Models.EF;
using QuanLiCafe.Areas.Admin.Controllers;
using System.Web.Script.Serialization;
using Microsoft.Reporting.WebForms;

namespace QuanLiCafe.Controllers
{
    public class HomeClientController : BaseController
    {
        // GET: HomeClient
        QuanLyQuanCafeDbContext context = null;
        public HomeClientController()
        {
             context = new QuanLyQuanCafeDbContext();
        }
       
        public ActionResult Index()
        {
            var dao = new AreaClient();
            var model = dao.listbyarea();
            return View(model);
        }

        public JsonResult Test(BillInfo obj)
        {
            obj.idAccount = 1;
            return Json(new
            {
                Name = "test",
                ID = 100
            });
        }

        public ActionResult TestView(BillInfo obj)
        {
            obj.idAccount = 1;
            return PartialView("TestView");
        }
        [HttpPost]
        public JsonResult CreateBill(Bill bill)
        {
            if (ModelState.IsValid)
            {

                var dao = new BillDao();
                var result = dao.Insert(bill);
                if (result == true)
                {
                    Response.Write("Tạo bill thành công");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm hóa đơn không thành công");
                }
            }
            return Json(null);
        }
        [HttpPost]
        public JsonResult CreateBillinfo(BillInfo billin, int id_table, int idAc)
        {
            if (billin.idBill > 0 == false)
            {
                //them
                var obj = new Bill
                {
                    Bill_id = 0,
                    DateCheckIn = DateTime.Now,
                    DateCheckOut = DateTime.Now,
                    Timein=DateTime.Now.TimeOfDay,
                    Timeout= DateTime.Now.TimeOfDay,
                    idTable = id_table,
                    idAccount= idAc,
                    status = false
                };
                new BillDao().Insert(obj);
                billin.idBill = obj.Bill_id;

                //lay ra ban
                //ban bill_id cho no
                //thuc hien update
                var dao = new TableFoodDao();
                var ban = dao.GetByID(id_table);
                ban.idBill = billin.idBill;
                dao.Edit(ban);
            }

            if (billin.idBill > 0)
            {

                var dao = new BillinfoDao();
                var x = context.BillInfoes.Where(q => q.idBill == billin.idBill).ToList();
                var billinfo = x.FirstOrDefault(k => k.idFood == billin.idFood);
                if (x.Count() == 0)
                {
                    dao.Insert(billin);
                }
                else
                {
                    if (billinfo == null)
                    {
                        dao.Insert(billin);
                    }
                    else
                    {
                        billinfo.count += 1;
                        //billinfo.Price = (billinfo.Price * billinfo.count);
                        context.SaveChanges();
                    }
                }
            }
            return Json(new
            {
                id_table,
                billin.idBill,
                billin.BillInfo_id
            });
        }

        [HttpPost]
        public ActionResult GetBill(int id_bill, long? selectedDVT = null)
        {
            var data = new BillDao().GetByID(id_bill);
            SetViewBagDVT(selectedDVT);
            return View(data);
        }
        public void SetViewBagDVT(long? selectedDVT = null)
        {
            var dao = new DVTDao();
            ViewBag.idDVT = new SelectList(dao.ListbyFood(), "DVT_id", "DVT_Name", selectedDVT);
        }
        public JsonResult ThanhToan()
        {
            var asd = Request.Form;
            int id_bill = int.Parse(asd["id_bill"]);
            var data = new BillDao().GetByID(id_bill);
            data.status = true;
            data.DateCheckOut = DateTime.Now;
            data.Timeout = DateTime.Now.TimeOfDay;
            new BillDao().Edit(data);
            var dao = new TableFoodDao();
            var ban = dao.GetByID(data.idTable);
            ban.idBill = 0;
            dao.Edit(ban);
            return Json(true);
        }
        [HttpPost]
        public JsonResult Delete(string model)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            BillInfo bill = serializer.Deserialize<BillInfo>(model);
            var dao = new BillinfoDao();
            dao.Delete(bill.BillInfo_id);
            return Json(new
            {
                status = true
            });

        }
        [HttpPost]
        public JsonResult Editbill(string model)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            BillInfo bill = serializer.Deserialize<BillInfo>(model);
            var context = new QuanLyQuanCafeDbContext();
            //save db
            var entity = context.BillInfoes.Find(bill.BillInfo_id);
            entity.count = bill.count;
            context.SaveChanges();
            return Json(new
            {
                status = true
            });
        }
        public ActionResult Reports(string ReportType, int idbill)
        {
            LocalReport localReport = new LocalReport();
            localReport.ReportPath = Server.MapPath("~/Reports/BillReport.rdlc");
            ReportDataSource reportDataSource = new ReportDataSource();
            reportDataSource.Name = "DataSetBillInfo";
            reportDataSource.Value = new BillinfoDao().ListExport(idbill).ToList();
            localReport.DataSources.Add(reportDataSource);
            string reportType = ReportType;
            string mimeType;
            string encoding;
            string fileNameExtension;
            if(reportType =="Word")
            {
                fileNameExtension = "docx";
            }
            string[] streams;
            Warning[] warnings;
            byte[] renderByte;
            renderByte = localReport.Render(reportType, "", out mimeType, out encoding, out fileNameExtension, out streams, out warnings);
            Response.AddHeader("content-disposition", "attachment;filename=Hoadon." + fileNameExtension);
            return File(renderByte, fileNameExtension);
          
        }
        [HttpPost]
        public JsonResult DeleteBill(int idbill,int idtable)
        {
            var data = new BillDao();
            data.Deleletb(idtable);
            var billinfo = context.BillInfoes.FirstOrDefault(x => x.idBill == idbill);
            context.BillInfoes.Remove(billinfo);
            context.SaveChanges();
            data.Delelebill(idbill);
            

            return Json(new
            {
                data,
                idtable,
                idbill
            });
        }


    }
}