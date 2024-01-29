using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using Models.ViewModel;

namespace Models.Dao
{
    public class HomeDao
    {
        QuanLyQuanCafeDbContext db = null;
        public HomeDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public Home_ViewModel listByHome()
        {
            var billif = db.BillInfoes.ToList();
            var bill = db.Bills.ToList();
            var account = db.Accounts.ToList();
            var model = new Home_ViewModel
            {
                Accounts = account,
                Bills = bill,
                BillInfos = billif
            };
            return model;
        }
    }
}
