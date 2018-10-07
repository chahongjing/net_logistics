using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 用户
    /// </summary>
    [Entity("UserGuid", "UserInfo")]
    public partial class UserInfo : BaseEntity
    {
        /// <summary>
        /// 创建人
        /// </summary>
        [DataColumn]
        [Relation("CompanyGuid.Name")]
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
        /// 用户Guid
        /// </summary>
        [DataColumn]
        public Guid UserGuid { get; set; }
        /// <summary>
        /// 代码
        /// </summary>
        [DataColumn]
        public String UserCode { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        [DataColumn]
        public String UserName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        [DataColumn]
        public String Password { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        [DataColumn]
        public bool? Sex { get; set; }
        /// <summary>
        /// 生日
        /// </summary>
        [DataColumn]
        public DateTime? Birthday { get; set; }
        /// <summary>
        /// 头像
        /// </summary>
        [DataColumn]
        public String Photo { get; set; }
        /// <summary>
        /// 公司Guid
        /// </summary>
        [DataColumn("Organization", "UnitGuid")]
        public Guid? CompanyGuid { get; set; }
        /// <summary>
        /// 部门Guid
        /// </summary>
        [DataColumn("Organization", "UnitGuid")]
        public Guid? DepartmentGuid { get; set; }
        /// <summary>
        /// 是否禁用
        /// </summary>
        [DataColumn]
        public bool? IsDisabled { get; set; }

        /// <summary>
        /// 公司名称
        /// </summary>
        [Relation("CompanyGuid.Name")]
        public String CompanyName { get; set; }

        /// <summary>
        /// 部门名称
        /// </summary>
        [Relation("DepartmentGuid.Name")]
        public String DepartmentName { get; set; }

        /// <summary>
        /// 权限
        /// </summary>
        public Guid? PermissionGuid { get; set; }
    }

}
