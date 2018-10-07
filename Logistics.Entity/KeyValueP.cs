using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 键值对
    /// </summary>
    [Entity("ID", "KeyValuePair")]
    public partial class KeyValueP : BaseEntity
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
        /// 编码
        /// </summary>
        [DataColumn]
        public string Code { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        [DataColumn]
        public string Name { get; set; }
        /// <summary>
        /// 分组
        /// </summary>
        [DataColumn]
        public string Group { get; set; }
        /// <summary>
        /// 父级主键
        /// </summary>
        [DataColumn("KeyValuePair", "ID")]
        public Guid? ParentGuid { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        [DataColumn]
        public String Remark { get; set; }

        /// <summary>
        /// 父级名称
        /// </summary>
        [Relation("ParentGuid.Name")]
        public String ParentName { get; set; }
    }
}
