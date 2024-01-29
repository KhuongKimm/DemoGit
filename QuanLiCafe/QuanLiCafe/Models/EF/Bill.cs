namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using ViewModel;

    [Table("Bill")]
    public partial class Bill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bill()
        {
            BillInfoes = new HashSet<BillInfo>();
        }

        [Key]
        public int Bill_id { get; set; }

        [Column(TypeName = "date")]
        public DateTime DateCheckIn { get; set; }

        [Column(TypeName = "date")]
        public DateTime DateCheckOut { get; set; }

        public TimeSpan? Timein { get; set; }

        public TimeSpan? Timeout { get; set; }

        public int idTable { get; set; }

        public int idAccount { get; set; }

        public int? idKM { get; set; }

        public bool status { get; set; }

        public virtual Account Account { get; set; }

        public virtual TableFood TableFood { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillInfo> BillInfoes { get; set; }
        [NotMapped]
        public List<BillInfo> BillInfos { get; set; }
        [NotMapped]
        public List<FoodViewModel> Foodsbill { get; set; }
        [NotMapped]
        public List<ViewBill> viewbill { get; set; }
    }
}
