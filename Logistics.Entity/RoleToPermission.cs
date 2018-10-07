using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("RoleToPermissionGuid")]
    public partial class RoleToPermission : BaseEntity
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
        [DataColumn]
        public Guid RoleToPermissionGuid { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? RoleGuid { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Guid? ActionGuid { get; set; }
    }
}
