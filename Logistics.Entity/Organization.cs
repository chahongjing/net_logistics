using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 组织架构
    /// </summary>
    [Entity("UnitGuid", "Organization")]
    public partial class Organization : BaseEntity
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
        /// 组织Guid
        /// </summary>
        [DataColumn]
        public Guid UnitGuid { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        [DataColumn]
        public String Name { get; set; }
        /// <summary>
        /// 代码
        /// </summary>
        [DataColumn]
        public String Code { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        [DataColumn]
        public String Icon { get; set; }
        /// <summary>
        /// 父级代码
        /// </summary>
        [DataColumn]
        public String ParentCode { get; set; }
        /// <summary>
        /// 父级Guid
        /// </summary>
        [DataColumn("Organization", "UnitGuid")]
        public Guid? ParentGuid { get; set; }
        /// <summary>
        /// 是否禁用
        /// </summary>
        [DataColumn]
        public bool? IsDisabled { get; set; }
        /// <summary>
        /// 父级名称
        /// </summary>
        [Relation("ParentGuid.Name")]
        public String ParentName { get; set; }

        /// <summary>
        /// 权限
        /// </summary>
        public Guid? PermissionGuid { get; set; }
    }

}
