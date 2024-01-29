namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BillInfo")]
    public partial class BillInfo
    {
        [Key]
        public int BillInfo_id { get; set; }

        public int idBill { get; set; }

        public int idFood { get; set; }

        public int idAccount { get; set; }

        public int count { get; set; }

        public decimal Price { get; set; }

        public int? idTable { get; set; }
        public bool? status { get; set; }

        public virtual Account Account { get; set; }

        public virtual Bill Bill { get; set; }

        public virtual Food Food { get; set; }

        public virtual TableFood TableFood { get; set; }
    }
}
