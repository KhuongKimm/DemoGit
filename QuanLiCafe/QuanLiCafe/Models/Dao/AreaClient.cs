using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;
using Models.ViewModel;

namespace Models.Dao
{
    public class AreaClient
    {
        QuanLyQuanCafeDbContext db = null;
        public AreaClient()
        {
            db = new QuanLyQuanCafeDbContext();
        }
        public ViewArea listbyarea()
        {
            var AreaList = new AreaDao().ListAllClient();
            var TableFList = new TableFoodDao().ListAllTf();
            var FoodList = new FoodDao().ListAllClient();
            var FoodCaList = new FoodCategoryDao().ListAllFC();
            var BillList = new BillDao().ListAll();
            var BillInList = new BillinfoDao().AllList();


            var model = new ViewArea()
            {
                Areas = AreaList,
                TableFoods = TableFList,
                Foods = FoodList,
                Bills = BillList,
                FoodCategorys = FoodCaList,
                BillInfos = BillInList,
            };
            return model;
        }
        
    }
}
