using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using Models.ViewModel;
using System.Globalization;

namespace Models.EF
{
    public class TKDTDao
    {
        QuanLyQuanCafeDbContext db = null;
        public TKDTDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public DateTime XuLyChuoiNgayThang(string date)
        {
            int nam = Convert.ToInt32(date.Substring(0, 4));
            int thang = Convert.ToInt32(date.Substring(5, 2));
            int ngay = Convert.ToInt32(date.Substring(8, 2));
            DateTime dt = new DateTime(nam, thang, ngay).Date;
            return dt.Date;
        }
      
        public IEnumerable<ViewBill> ListALl(string ChonTime,string date,string date1)
        {
         
            IQueryable<ViewBill> model = from a in db.BillInfoes
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
                            DateCheckIn =  b.DateCheckIn,
                            DateCheckOut = b.DateCheckOut,
                            TableFood_name = d.TableFood_name,
                            Price = a.Price,
                            count = a.count,
                            BillInfo_id = a.BillInfo_id,
                            idAccount = c.id,
                            idBill = b.Bill_id,
                            idTable = d.TableFood_id,
                            idFood = e.Food_id,
                            Food_name = e.Food_name,
                            billsinfo = db.BillInfoes.ToList()
                        };
          if(!string.IsNullOrEmpty(date) && !string.IsNullOrEmpty(date1))
            {
                DateTime ngay = XuLyChuoiNgayThang(date);
                DateTime ngay2 = XuLyChuoiNgayThang(date1);
                var m = ngay.Month;
                var y = ngay.Year;
                var day1 = ngay.AddDays(-1);
                var day = ngay;
             
                
                model = model.Where(x => x.DateCheckIn >= ngay && x.DateCheckIn <=ngay2 ).OrderByDescending(x => x.idBill);
            }

            else
            if(!string.IsNullOrEmpty(ChonTime))
            {
                if(ChonTime=="1")
                {
                    DateTime ngay = DateTime.Now;
                    var day1 = ngay.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    DateTime day = XuLyChuoiNgayThang(day1);
                    model = model.Where(x => x.DateCheckIn.Equals(day)).OrderByDescending(x => x.idBill);
                }
                else if(ChonTime=="3")
                {
                    DateTime ngay = DateTime.Now;
                    var day1 = ngay.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    DateTime day = XuLyChuoiNgayThang(day1);
                    var m = day.Month;
                    model = model.Where(x => x.DateCheckIn.Month==m).OrderByDescending(x => x.idBill);
                }
                else if(ChonTime=="4")
                {
                    DateTime ngay = DateTime.Now;
                    var day1 = ngay.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    DateTime day = XuLyChuoiNgayThang(day1);
                    var y = day.Year;
                    model = model.Where(x => x.DateCheckIn.Year == y).OrderByDescending(x => x.idBill);
                }
            }
                
            return model.OrderByDescending(x => x.idBill);
        }

    }
}
