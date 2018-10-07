using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("CompanyID")]
    public partial class Company : BaseEntity
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
        public Guid CompanyID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("公司名称", typeof(string))]
        public String Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Logo { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("公司地址", typeof(string))]
        public String Address { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("公司性质", typeof(string))]
        public String Character { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String PayType { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String IdentifyCode { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String BankCardNumber { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String BankName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("联系人改名", typeof(string))]
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
        public Int32? AirLuggageLimit { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Int32? ShippingLuggageLimit { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Int32? Japanese { get; set; }
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

        public string CompanyCharacterName { get; set; }

        public string PayTypeName { get; set; }

        public int Processing { get; set; }

        public int Finished { get; set; }
    }
}
