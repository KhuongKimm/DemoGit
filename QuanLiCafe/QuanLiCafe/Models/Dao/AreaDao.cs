using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.Dao;
using Models.EF;
using Models.ViewModel;
using PagedList;

namespace Models.Dao
{
    public class AreaDao
    {
        QuanLyQuanCafeDbContext db = null;
        public AreaDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public bool insert(Area area)
        {

            db.Areas.Add(area);
            db.SaveChanges();
            return true;
        }
        public bool Delete(int id)
        {
            try
            {
                var are = db.Areas.Find(id);
                db.Areas.Remove(are);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<Area> ListAll1(string searching, int page, int pageSize)
        {
            IQueryable<Area> model = db.Areas;
            if (!string.IsNullOrEmpty(searching))
            {
                model = model.Where(x => x.AreaName.Contains(searching)).OrderBy(x => x.Area_id);
            }
            return model.OrderBy(x => x.Area_id).ToPagedList(page, pageSize);
        }
        public Area Viewdetail(int id)
        {
            return db.Areas.Find(id);
        }
        public bool Edit(Area entity)
        {
            try
            {
                var user = db.Areas.Find(entity.Area_id);
                user.AreaName = entity.AreaName;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }


        }
        public List<Area> ListAll()
        {
            return db.Areas.ToList();
        }
        public List<Area> ListAllClient()
        {
            return db.Areas.ToList();
        }


        public List<TableFViewModel> ListByTableid(int page, int pageSize)
        {
            var model = from a in db.Areas
                        join b in db.TableFoods
                        on a.Area_id equals b.idArea
                        select new TableFViewModel()
                        {
                            id = b.TableFood_id,
                            name = b.TableFood_name,
                            NameArea = a.AreaName,
                            status = b.status,

                        };
            return model.ToList();
        }
    }
}