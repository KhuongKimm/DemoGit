using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.ViewModel
{
    [System.Runtime.InteropServices.ComVisible(true)]
    [System.Serializable]
    public class ViewBill
    {
        public int BillInfo_id { get; set; }

        public int idBill { get; set; }

        public int idFood { get; set; }

        public int idAccount { get; set; }
        public string UserName { get; set; }

        public int count { get; set; }

        public decimal Price { get; set; }

        public DateTime DateCheckIn { get; set; }

        public DateTime DateCheckOut { get; set; }

        public int idTable { get; set; }
        public TimeSpan? Timein { get; set; }

        public TimeSpan? Timeout { get; set; }
        public string TableFood_name { get; set; }
        public List<BillInfo> billsinfo { get; set; }
        public int Food_id { get; set; }
        public string Food_name { get; set; }

    }
}
