using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using Models.ViewModel;

namespace Models.Dao
{
    public class BillDao
    {
        QuanLyQuanCafeDbContext db = null;
        public BillDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public bool Insert(Bill bill)
        {
            db.Bills.Add(bill);
            db.SaveChanges();
            return true;
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
        public List<Bill> ListAll()
        {
            return db.Bills.ToList();
        }

        public Bill GetByID(int IDBill)
        {
            Bill obj = db.Bills.Find(IDBill);
            obj.BillInfos = db.BillInfoes.Where(q => q.idBill == IDBill).ToList();
            obj.Foodsbill = ListBybillinfo();
            return obj;
        }
        public bool Edit(Bill entity)
        {
            try
            {
                //var billdao = db.Bills.Find(entity.Bill_id);
                //billdao.status = entity.status;
                //billdao.idTable = entity.idTable;
                db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Deleletb(int id)
        {
            try
            {
                var entity = db.TableFoods.Find(id);
                entity.idBill = 0;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
        public bool Delelebill(int id)
        {
            try
            {
                var entity = db.Bills.Find(id);
                db.Bills.Remove(entity);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
    }
}
