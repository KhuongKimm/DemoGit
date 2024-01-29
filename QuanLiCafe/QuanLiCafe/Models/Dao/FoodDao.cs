using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using PagedList;
using Models.ViewModel;

namespace Models.Dao
{
    public class FoodDao
    {
        QuanLyQuanCafeDbContext db = null;
        public FoodDao()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public bool insert(Food food)
        {

            db.Foods.Add(food);
            db.SaveChanges();
            return true;
        }
        public bool ChangeStatus(long id)
        {
            var food = db.Foods.Find(id);
            food.status = !food.status;
            db.SaveChanges();
            return food.status;
        }
        public bool Delete(int id)
        {
            try
            {
                var food = db.Foods.Find(id);
                db.Foods.Remove(food);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<Food> ListAll(string searching, int page, int pageSize)
        {
            IQueryable<Food> model = db.Foods;
            if (!string.IsNullOrEmpty(searching))
            {
                model = model.Where(x => x.Food_name.Contains(searching)).OrderBy(x => x.Food_id);
            }
          
            return model.OrderBy(x => x.Food_id).ToPagedList(page, pageSize);
        }
      
        public Food Viewdetail(int id)
        {
            return db.Foods.Find(id);
        }
        public bool Edit(Food entity)
        {
            try
            {
                var food = db.Foods.Find(entity.Food_id);
                food.Food_name = entity.Food_name;
                food.idCategory = entity.idCategory;
                food.price = entity.price;
                food.status = entity.status;
                food.idDVT = entity.idDVT;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }


        }
        public List<Food> ListAllClient()
        {
            return db.Foods.ToList();
        }


        public IEnumerable<FoodViewModel> ListByFoodid(string seaching,int? idCategory,int? idDVT,  int page, int pageSize)
        {
            IQueryable<FoodViewModel> model = from a in db.Foods
                        join b in db.FoodCategories
                        on a.idCategory equals b.FoodCategory_id
                        join c in db.DVTs
                        on a.idDVT equals c.DVT_id
                        select new FoodViewModel()
                        {
                            Food_id = a.Food_id,
                            Food_name = a.Food_name,
                            FoodCate_name = b.FoodCategory_name,
                            Price = a.price,
                            status = a.status,
                            FoodCate_id = b.FoodCategory_id,
                            DVT_id=c.DVT_id,
                            DVT_Name=c.DVT_Name
                        };
            if (!string.IsNullOrEmpty(seaching))
            {
                
                    model = model.Where(x => x.Food_name.Contains(seaching) ).OrderBy(x => x.FoodCate_id);
            }
            else if(idCategory != null)
            {
                model = model.Where(x =>x.FoodCate_id == idCategory).OrderBy(x => x.FoodCate_id);
            }
            else if(idDVT != null)
            {
                model = model.Where(x => x.DVT_id == idDVT).OrderBy(x => x.FoodCate_id);
            }
                
            return model.OrderBy(x => x.FoodCate_id).ToPagedList(page, pageSize);
        }
    }
}
