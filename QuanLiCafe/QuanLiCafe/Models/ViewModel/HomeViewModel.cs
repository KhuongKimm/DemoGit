using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.ViewModel
{
    public class Home_ViewModel
    {
       public List<BillInfo> BillInfos { get; set; }
        public List<Bill> Bills { get; set; }
        public List<Account> Accounts { get; set; }
    }

}
