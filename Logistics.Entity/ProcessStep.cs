using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("ID")]
    public partial class ProcessStep : BaseEntity
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
        public Guid ID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? CustomerID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? StepID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String StepName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public DateTime? EstimateDate { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public DateTime? FinishDate { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Memo { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Seq { get; set; }

        public string Status { get; set; }
        public string StatusTips { get; set; }
        
    }
}
