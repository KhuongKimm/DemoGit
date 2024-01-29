using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using PagedList;

namespace Models.Dao
{
    public class DVTDao
    {
        QuanLyQuanCafeDbContext db = null;
        public DVTDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        
        public IEnumerable<DVT> ListAll(string seaching,int page,int pageSize)
        {
            IQueryable<DVT> model = db.DVTs;
            if (!string.IsNullOrEmpty(seaching))
            {
                model = db.DVTs.Where(x => x.DVT_Name.Contains(seaching)).OrderBy(x => x.DVT_id);
            }
            return model.OrderBy(x => x.DVT_id).ToPagedList(page,pageSize);
        }
        public List<DVT> ListDVT()
        {
            return db.DVTs.ToList();
        }
        public bool insert(DVT dvt)
        {
            db.DVTs.Add(dvt);
            db.SaveChanges();
            return true;
        }
        public bool Edit(DVT dvt)
        {
            try
            {
                var entity = db.DVTs.Find(dvt.DVT_id);
                entity.DVT_Name = dvt.DVT_Name;
                entity.Descreption = dvt.Descreption;
                entity.status = dvt.status;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }
        public bool Delete(int id)
        {
            try
            {
                var dvt = db.DVTs.Find(id);
                db.DVTs.Remove(dvt);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public DVT Viewdetail(int id)
        {
            return db.DVTs.Find(id);
        }
        public List<DVT> ListbyFood()
        {
            return db.DVTs.ToList();
        }
    }
}
