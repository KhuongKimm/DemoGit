using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using PagedList;

namespace Models.Dao
{
    public class KhuyenMaiDao
    {
        QuanLyQuanCafeDbContext db = null;
        public KhuyenMaiDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public IEnumerable<KhuyenMai> ListAll(string seaching,int page,int pageSize)
        {
            IQueryable<KhuyenMai> model = db.KhuyenMais;
            if(!string.IsNullOrEmpty(seaching))
            {
                model = model.Where(x => x.KM_Name.Contains(seaching)).OrderBy(x => x.KM_id);
            }
            return model.OrderBy(x => x.KM_id).ToPagedList(page, pageSize);
        }
        public bool insert(KhuyenMai km)
        {
            try
            {
                db.KhuyenMais.Add(km);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
               
            }
        }
        public KhuyenMai ViewDetail(int id)
        {
            return db.KhuyenMais.Find(id);
        }
        public bool Edit(KhuyenMai km)
        {
            try
            {

                db.Entry(km).State = System.Data.Entity.EntityState.Modified;
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
                var km = db.KhuyenMais.Find(id);
                db.KhuyenMais.Remove(km);
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
