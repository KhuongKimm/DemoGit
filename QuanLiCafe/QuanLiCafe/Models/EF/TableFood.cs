namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TableFood")]
    public partial class TableFood
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TableFood()
        {
            Bills = new HashSet<Bill>();
            BillInfoes = new HashSet<BillInfo>();
        }

        [Key]
        public int TableFood_id { get; set; }

      
        [StringLength(100)]
        [Required(ErrorMessage = "Bàn cần nhập bàn")]
        [Display(Name = "Tên bàn:")]
        public string TableFood_name { get; set; }
        [Required(ErrorMessage = "Cần nhập khu vực")]
        [Display(Name = "Khu vực:")]
        public int idArea { get; set; }
        [Required(ErrorMessage = "Cần chọn trạng thái")]
        [Display(Name = "Trạng thái:")]
        public bool status { get; set; }

        public int idBill { get; set; }

        public virtual Area Area { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bill> Bills { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillInfo> BillInfoes { get; set; }
    }
}
