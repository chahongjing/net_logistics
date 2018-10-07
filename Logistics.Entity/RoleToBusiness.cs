using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 角色业务表
    /// </summary>
    [Entity("RoleToBusinessGuid")]
    public partial class RoleToBusiness : BaseEntity
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
        /// 角色业务主键
        /// </summary>
        [DataColumn]
        public Guid RoleToBusinessGuid { get; set; }
        /// <summary>
        /// 角色主键
        /// </summary>
        [DataColumn]
        public Guid? RoleGuid { get; set; }
        /// <summary>
        /// 业务主键
        /// </summary>
        [DataColumn]
        public Guid? BusinessGuid { get; set; }
    }
}
