using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.ViewModel
{
    public class FoodViewModel
    {
        public int Food_id { get; set; }
        public string Food_name { get; set; }
        public int FoodCate_id { get; set; }
        public string FoodCate_name { get; set; }
        public int DVT_id { get; set; }
        public string DVT_Name { get; set; }
        public decimal Price { get; set; }
        public bool status { get; set; }
 


    }
}
