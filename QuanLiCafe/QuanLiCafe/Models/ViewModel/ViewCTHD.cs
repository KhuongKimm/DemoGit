using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.EF;

namespace Models.ViewModel
{
    public class ViewCTHD
    {
        public IEnumerable<ViewBill> billS { get; set; }
        public List<BillInfo> billiinfo { get; set; }
    }
}
