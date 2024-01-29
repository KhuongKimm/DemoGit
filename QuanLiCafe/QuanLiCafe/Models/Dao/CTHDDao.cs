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
    public class CTHDDao
    {
        QuanLyQuanCafeDbContext db = null;
        public CTHDDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public List<ViewBill> ListbyCTHD(int idbill)
        {
            var model = from a in db.BillInfoes.Where(x=>x.idBill==idbill)
                                         join b in db.Bills
                                         on a.idBill equals b.Bill_id
                                         join c in db.Accounts
                                         on a.idAccount equals c.id
                                         join d in db.TableFoods
                                         on a.idTable equals d.TableFood_id 
                                         join e in db.Foods
                                         on a.idFood equals e.Food_id
                                         select new ViewBill
                                         {
                                              UserName = c.Name,
                                              DateCheckIn=b.DateCheckIn,
                                              DateCheckOut=b.DateCheckOut,
                                              TableFood_name = d.TableFood_name,
                                              Price= a.Price,
                                              count= a.count,
                                               BillInfo_id=a.BillInfo_id,
                                               idAccount=c.id,
                                               idBill=b.Bill_id,
                                               idTable=d.TableFood_id,
                                               idFood=e.Food_id,
                                               Food_name=e.Food_name,
                                             billsinfo= db.BillInfoes.ToList()
                                         };

            return model.ToList();
        }
        public List<FoodViewModel> ListBybillinfo()
        {
            var model = from a in db.Foods
                        join b in db.DVTs
                        on a.idDVT equals b.DVT_id
                        select new FoodViewModel()
                        {
                            Food_id = a.Food_id,
                            Food_name = a.Food_name,
                            Price = a.price,
                            status = a.status,
                            DVT_id = b.DVT_id,
                            DVT_Name = b.DVT_Name
                        };
            return model.ToList();
        }
        public Bill GetByID(int id)
        {
            Bill obj = db.Bills.Find(id);
            obj.viewbill = ListbyCTHD(id);
            obj.Foodsbill = ListBybillinfo();
            return obj;
        }
        public DateTime XuLyChuoiNgayThang(string date)
        {
            int nam = Convert.ToInt32(date.Substring(0, 4));
            int thang = Convert.ToInt32(date.Substring(5, 2));
            int ngay = Convert.ToInt32(date.Substring(8, 2));
            DateTime dt = new DateTime(nam, thang, ngay).Date;
            return dt.Date;
        }
        public IEnumerable<ViewBill> listbyAll(string seaching,string date,int page, int pageSize)
        {
            IQueryable<ViewBill> model = from a in db.Bills
                                         join b in db.Accounts
                                         on a.idAccount equals b.id
                                         join c in db.TableFoods
                                         on a.idTable equals c.TableFood_id
                                         select new ViewBill
                                         {
                                             UserName = b.Name,
                                             DateCheckIn = a.DateCheckIn,
                                             DateCheckOut = a.DateCheckOut,
                                             TableFood_name = c.TableFood_name,
                                             idAccount = b.id,
                                             idBill = a.Bill_id,
                                             idTable = c.TableFood_id,
                                             billsinfo = db.BillInfoes.ToList(),
                                             Timein= a.Timein,
                                             Timeout=a.Timeout
                                         };
            if(!string.IsNullOrEmpty(seaching))
            {
                model = model.Where(x => x.TableFood_name.Contains(seaching) || x.UserName.Contains(seaching) ).OrderByDescending(x => x.idBill);
            }
            else if(!string.IsNullOrEmpty(date))
            {
                DateTime day = XuLyChuoiNgayThang(date);
                model = model.Where(x =>x.DateCheckIn.Equals(day)).OrderByDescending(x => x.idBill);
            }

            return model.OrderByDescending(x => x.idBill).ToPagedList(page, pageSize);


        }


    }
}
