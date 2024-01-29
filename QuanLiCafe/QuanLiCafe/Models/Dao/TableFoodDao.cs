using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.Dao;
using Models.EF;
using PagedList;
using Models.ViewModel;

namespace Models.Dao
{
    public class TableFoodDao
    {
        QuanLyQuanCafeDbContext db = null;
        public TableFoodDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public IEnumerable<TableFood> ListAll(int page, int pageSize)
        {
            return db.TableFoods.OrderBy(x => x.TableFood_id).ToPagedList(page, pageSize);
        }
        public List<TableFood> ListAllTf()
        {
            return db.TableFoods.ToList();
        }
        public IEnumerable<TableFViewModel> ListByTableid(string seaching,int page, int pageSize)
        {
            IQueryable<TableFViewModel> model = from a in db.Areas
                        join b in db.TableFoods
                        on a.Area_id equals b.idArea
                        select new TableFViewModel()
                        {
                            id = b.TableFood_id,
                            name = b.TableFood_name,
                            NameArea = a.AreaName,
                            status = b.status,

                        };
            if(!string.IsNullOrEmpty(seaching))
            {
                model = model.Where(q => q.NameArea.Contains(seaching) || q.name.Contains(seaching)).OrderByDescending(a => a.id);
            }
            return model.OrderByDescending(x=>x.id).ToPagedList(page,pageSize);
        }
        public List<TableFViewModel> listTableEdit()
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
        public long insert(TableFood TF)
        {
            
            db.TableFoods.Add(TF);
            db.SaveChanges();
            return TF.TableFood_id;
        }
        public TableFood ViewDetail(int id)
        {
            return db.TableFoods.Find(id);
        }

        public TableFood GetByID(int id_table)
        {
            return db.TableFoods.Find(id_table);
        }

        public bool Delete(int id)
        {
            try
            {
                var dao = db.TableFoods.Find(id);
                db.TableFoods.Remove(dao);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool ChangeStatus(long id)
        {
            var tf = db.TableFoods.Find(id);
            tf.status = !tf.status;
            db.SaveChanges();
            return tf.status;
        }
        public bool Edit(TableFood entity)
        {
            try
            {
                //var tf = db.TableFoods.Find(entity.TableFood_id);
                //tf.name = entity.name;
                //tf.idArea = entity.idArea;
                db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
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
