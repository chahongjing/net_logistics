using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 系统
    /// </summary>
    [Entity("SystemGuid", "SystemInfo")]
    public partial class SystemInfo : BaseEntity
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
        /// 系统Guid
        /// </summary>
        [DataColumn("SystemInfo", "SystemGuid")]
        public Guid SystemGuid { get; set; }
        /// <summary>
        /// 代码
        /// </summary>
        [DataColumn]
        public String Code { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        [DataColumn]
        public String Name { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        [DataColumn]
        public String Icon { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        [DataColumn]
        public String Remark { get; set; }
        /// <summary>
        /// 系统名称
        /// </summary>
        [Relation("SystemGuid.Name")]
        public String SystemName { get; set; }
    }

}
