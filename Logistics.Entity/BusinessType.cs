using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("TypeID")]
    public partial class BusinessType : BaseEntity
    {
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? CreatedBy { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public DateTime? CreatedOn { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? ModifiedBy { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public DateTime? ModifiedOn { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("主键不能为空", typeof(Guid))]
        public Guid TypeID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("编码不能为空", typeof(String))]
        public String Code { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? ParentID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("名称不能为空", typeof(String))]
        public String Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnLength("所需材料只能输入1000个字!", 0, 1000)]
        public String Material { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Time { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnLength("备注只能输入500个字!", 0, 1000)]
        public String Memo { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public String ParentName { get; set; }
        public Decimal? BidCost { get; set; }
        public Decimal? SaleAmount { get; set; }
        public Decimal? FactCost { get; set; }
        public Decimal? Profit { get; set; }
        public Decimal? TotalBidCost { get; set; }
        public Decimal? TotalSaleAmount { get; set; }
        public Decimal? TotalFactCost { get; set; }
        public Decimal? TotalProfit { get; set; }
    }
}
