using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 菜单
    /// </summary>
    [Entity("MenuGuid", "Menu")]
    public partial class Menu : BaseEntity
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
        /// 菜单Guid
        /// </summary>
        [DataColumn]
        public Guid MenuGuid { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        [DataColumn]
        public String Name { get; set; }
        /// <summary>
        /// 路径
        /// </summary>
        [DataColumn]
        public String Url { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        [DataColumn]
        public String Icon { get; set; }
        /// <summary>
        /// 排序
        /// </summary>
        [DataColumn]
        public Int32 OrderCode { get; set; }
        /// <summary>
        /// 父级Guid
        /// </summary>
        [DataColumn("Menu", "MenuGuid")]
        public Guid? ParentGuid { get; set; }
        /// <summary>
        /// 是否系统级
        /// </summary>
        [DataColumn]
        public Boolean? IsSystem { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        [DataColumn]
        public String Remark { get; set; }
        /// <summary>
        /// 父级节点名称
        /// </summary>
        [Relation("ParentGuid.Name")]
        public String ParentName { get; set; }
    }

}
