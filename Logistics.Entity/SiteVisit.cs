using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 站点访问
    /// </summary>
    [Entity("ID")]
    public partial class SiteVisit : BaseEntity
    {
        /// <summary>
        /// 创建人
        /// </summary>
        [DataColumn]
        public Guid? CreatedBy { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        [DataColumn]
        public DateTime? CreatedOn { get; set; }
        /// <summary>
        /// 修改人
        /// </summary>
        [DataColumn]
        public Guid? ModifiedBy { get; set; }
        /// <summary>
        /// 修改日期
        /// </summary>
        [DataColumn]
        public DateTime? ModifiedOn { get; set; }
        /// <summary>
        /// 主键
        /// </summary>
        [DataColumn]
        public Guid ID { get; set; }
        /// <summary>
        /// IP
        /// </summary>
        [DataColumn]
        public string IP { get; set; }
        /// <summary>
        /// 浏览器
        /// </summary>
        [DataColumn]
        public string Broswer { get; set; }
        /// <summary>
        /// 操作系统
        /// </summary>
        [DataColumn]
        public string System { get; set; }
    }
}
