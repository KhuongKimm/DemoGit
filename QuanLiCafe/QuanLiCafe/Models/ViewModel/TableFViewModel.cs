using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.ViewModel
{
    public class TableFViewModel
    {
        public int id { get; set; }
        public string name { get; set; }

        public string NameArea { get; set; }
        public string NameAreaDrop { get; set; }
        public List<Area> Areas { get; set; }
        public bool status { get; set; }

    }
}
