namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FoodCategory")]
    public partial class FoodCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FoodCategory()
        {
            Foods = new HashSet<Food>();
        }

        [Key]
        public int FoodCategory_id { get; set; }

        [Required]
        [StringLength(500)]
        [Display(Name ="Nhóm thực đơn")]
        public string FoodCategory_name { get; set; }

        [StringLength(500)]
        [Display(Name = "Mô tả")]
        public string Decription { get; set; }
        [Display(Name = "Trạng thái")]
        public bool status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Food> Foods { get; set; }
    }
}
