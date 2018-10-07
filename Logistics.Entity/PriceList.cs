using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("ListID")]
    public partial class PriceList : BaseEntity
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
        [ColumnRequired("必填", typeof(Guid))]
        public Guid ListID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? LuggageAmount { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Type { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String StartPlace { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String DestinationPlace { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String InterimPlace { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? CostOne { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? CostTwo { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? CostThree { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnLength("备注只能输入1000个字!", 0, 1000)]
        public String Memo { get; set; }
    }
}
