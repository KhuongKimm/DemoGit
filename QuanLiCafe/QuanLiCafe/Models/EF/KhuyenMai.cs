namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhuyenMai")]
    public partial class KhuyenMai
    {
        [Key]
        public int KM_id { get; set; }

        [Required]
        [StringLength(250)]
        public string KM_Name { get; set; }

        [Column(TypeName = "date")]
        public DateTime TimeTu { get; set; }

        [Column(TypeName = "date")]
        public DateTime TimeDen { get; set; }

        [StringLength(350)]
        public string Descreption { get; set; }

        public int KM_Value { get; set; }

        public bool status { get; set; }
    }
}
