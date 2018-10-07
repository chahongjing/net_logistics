using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("AgentID")]
    public partial class AgentCompany : BaseEntity
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
        [ColumnRequired("主键必填", typeof(Guid))]
        public Guid AgentID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("代理公司名称必填", typeof(String))]
        public String Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("代理公司地址必填", typeof(String))]
        public String Address { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("代理公司性质必填", typeof(String))]
        public String Character { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("联系人姓名必填", typeof(String))]
        public String Contact { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Email { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Mobile { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String BankName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String BankCardNumber { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String IdentifyCode { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Warehouse { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String WarehouseManager { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String WarehouseContact { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String WarehouseContactEmail { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String MainBusiness { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        [ColumnLength("备注只能输入500字以内!", 0, 500)]
        public String Memo { get; set; }

        public String AgentCompanyCharacterName { get; set; }
    }
}
