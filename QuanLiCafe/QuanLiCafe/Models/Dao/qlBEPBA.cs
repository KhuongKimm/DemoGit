using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using Models.ViewModel;
using PagedList;

namespace Models.Dao
{
    public class qlBEPBA
    {
        QuanLyQuanCafeDbContext db = null;
        public qlBEPBA()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public List<Bill> listbill()
        {
            return db.Bills.ToList();
        }
        public List<BillInfo> listbillìno()
        {
            return db.BillInfoes.ToList();
        }
        public bool Changess(int id)
        {
            var entity = db.BillInfoes.Find(id);
            entity.status = true;
            db.SaveChanges();
            return true;
        }
        public IEnumerable<ViewBill> ListALl(string searching,int page, int pageSize)
        {
            IQueryable<ViewBill> model = from a in db.BillInfoes where a.status==null
                                         join b in db.Bills
                                         on a.idBill equals b.Bill_id
                                         where b.Timein ==b.Timeout
                                         join c in db.Accounts
                                         on a.idAccount equals c.id
                                         join d in db.TableFoods
                                         on a.idTable equals d.TableFood_id
                                         join e in db.Foods
                                         on a.idFood equals e.Food_id

                                         select new ViewBill
                                         {
                                             TableFood_name = d.TableFood_name,
                                             count = a.count,
                                             BillInfo_id = a.BillInfo_id,
                                             idBill = b.Bill_id,
                                             idFood = e.Food_id,
                                             Food_name = e.Food_name,
                                             Timein=b.Timein,
                                             billsinfo = db.BillInfoes.ToList()
                                         };
            if (!string.IsNullOrEmpty(searching))
            {
                model = model.Where(x => x.Food_name.Contains(searching)).OrderBy(x => x.idBill);
            }
            return model.OrderBy(k => k.idBill).ToPagedList(page, pageSize);
        }
    }
}
