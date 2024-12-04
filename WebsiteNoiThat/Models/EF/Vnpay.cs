namespace Models.EF
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Vnpay")]
    public partial class Vnpay
    {
        [Key]
        [DisplayName("Mã giao dịch")]
        [StringLength(50)]
        public string TransactionId { get; set; }

        [DisplayName("Mô tả đơn hàng")]
        [StringLength(250)]
        public string OrderDescription { get; set; }

        [DisplayName("Mã đơn hàng")]
        [StringLength(50)]
        public string OrderId { get; set; }

        [DisplayName("Phương thức thanh toán")]
        [StringLength(50)]
        public string PaymentMethod { get; set; }

        [DisplayName("Mã thanh toán")]
        [StringLength(50)]
        public string PaymentId { get; set; }

    }
}
