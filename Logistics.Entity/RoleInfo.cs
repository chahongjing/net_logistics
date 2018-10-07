using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 角色信息
    /// </summary>
    [Entity("RoleGuid")]
    public partial class RoleInfo : BaseEntity
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
        /// 角色主键
        /// </summary>
        [DataColumn]
        public Guid RoleGuid { get; set; }
        /// <summary>
        /// 角色名称
        /// </summary>
        [DataColumn]
        public string Name { get; set; }
        /// <summary>
        /// 代码
        /// </summary>
        [DataColumn]
        public string Code { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        [DataColumn]
        public string Remark { get; set; }
        /// <summary>
        /// 组织
        /// </summary>
        public string OrganizationName { get; set; }
        /// <summary>
        /// 用户
        /// </summary>
        public string UserName { get; set; }
        /// <summary>
        /// 权限
        /// </summary>
        public Guid? PermissionGuid { get; set; }
    }
}
