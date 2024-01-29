using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using PagedList;

namespace Models.Dao
{
    public class FoodCategoryDao
    {
        QuanLyQuanCafeDbContext db = null;
        public FoodCategoryDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public IEnumerable<FoodCategory> ListAll(string seaching, int page, int pageSize)
        {
            IQueryable<FoodCategory> model = db.FoodCategories;
            if (!string.IsNullOrEmpty(seaching))
            {
                model = model.Where(x => x.FoodCategory_name.Contains(seaching)).OrderBy(x => x.FoodCategory_id);
            }
            return model.OrderBy(x => x.FoodCategory_id).ToPagedList(page, pageSize);

        }
        public bool Delete(int id)
        {
            try
            {
                var foodC = db.FoodCategories.Find(id);
                db.FoodCategories.Remove(foodC);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        public List<FoodCategory> listFoodCate()
        {
            return db.FoodCategories.ToList();
        }
        public bool ChangeStatus(long id)
        {
            var cate = db.FoodCategories.Find(id);
            cate.status = !cate.status;
            db.SaveChanges();
            return cate.status;
        }
        public bool Edit(FoodCategory foodc)
        {
            try
            {
                var foodct = db.FoodCategories.Find(foodc.FoodCategory_id);
                foodct.FoodCategory_name = foodc.FoodCategory_name;
                foodct.Decription = foodc.Decription;
                foodct.status = foodc.status;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public List<FoodCategory> ListAllFC()
        {
            return db.FoodCategories.ToList();
        }
        public FoodCategory ViewDetail(int id)
        {
            return db.FoodCategories.Find(id);
        }
        public long Insert(FoodCategory foodc)
        {
            db.FoodCategories.Add(foodc);
            db.SaveChanges();
            return foodc.FoodCategory_id;
        }
    }
}
