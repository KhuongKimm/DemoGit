using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.ViewModel
{
    public class ViewArea
    {
        //public int Area_ID { get; set; }
        //public string Area_Name { get; set; }
        //public int idArea { get; set; }
        //public int TableFood_ID { get; set; }
        //public string TableFood_Name { get; set; }
        public List<TableFood> TableFoods { get; set; }
        public TableFood TableFood { get; set; }
        public List<Area> Areas { get; set; }
        public Area Area { get; set; }
        public List<FoodCategory> FoodCategorys { get; set; }
        public FoodCategory FoodCategory { get; set; }
        public List<Food> Foods { get; set; }
        public Food Food { get; set; }
        public List<Bill> Bills { get; set; }
        public Bill Bill { get; set; }
        public List<BillInfo> BillInfos { get; set; }
        public BillInfo BillInfo { get; set; }


    }
}
