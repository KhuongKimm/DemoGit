using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using Models.ViewModel;

namespace Models.Dao
{
    public class BillinfoDao
    {
        QuanLyQuanCafeDbContext db = null;
        public BillinfoDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public bool Insert(BillInfo billinfo)
        {
            db.BillInfoes.Add(billinfo);
            db.SaveChanges();
            return true;
        }
       
        public List<BillInfo> AllList()
        {
            return db.BillInfoes.ToList();
        }
        public bool Delete(int id)
        {
            try
            {
                var billif = db.BillInfoes.Find(id);
                db.BillInfoes.Remove(billif);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
           
        }
        public BillInfo GetById(int idbill)
        {
            return db.BillInfoes.Find(idbill);
        }
        public bool Edit(BillInfo entity)
        {
            try
            {
                var bill = db.BillInfoes.Find(entity.BillInfo_id);
                entity.count = bill.count+1;
                entity.Price = (bill.Price*entity.count);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<Exports> ListExport(int idbill)
        {

            var query = (from billinfo in db.BillInfoes
                         join bill in db.Bills on billinfo.idBill equals bill.Bill_id
                         join Acc in db.Accounts on billinfo.idAccount equals Acc.id
                         join Food in db.Foods on billinfo.idFood equals Food.Food_id
                         join TF in db.TableFoods on billinfo.idTable equals TF.TableFood_id 
                         where billinfo.idBill == idbill
                         select new { bill, billinfo, Food, Acc,TF }).AsEnumerable()
                         .Select(x => new Exports
                         {
                             Name = x.Acc.Name,
                             Bill_id = x.bill.Bill_id,
                             count = x.billinfo.count,
                             Food_name = x.Food.Food_name,
                             Price = x.billinfo.Price,
                             Ngaygio = x.bill.DateCheckIn.ToString("dd/M/yyyy"),
                             GioVao = string.Format("{0}:{1}",x.bill.Timein.Value.Hours,x.bill.Timein.Value.Minutes),
                             Giora = string.Format("{0}:{1}", x.bill.Timeout.Value.Hours, x.bill.Timeout.Value.Minutes),
                             ban=  x.TF.TableFood_name,
                             Total = (x.billinfo.Price * x.billinfo.count),
        }).ToList();
            var Tongtien = query.Sum(x => x.Total);
            return query;
        }

    }
}
