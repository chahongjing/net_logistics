using System;
using BaseFrameWork.Entity;

namespace Logistics.Entity
{
    /// <summary>
    /// 
    /// </summary>
    [Entity("CustomerID")]
    public partial class Customer : BaseEntity
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
        [ColumnRequired("必填!", typeof(Guid))]
        public Guid CustomerID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("客户名称必填!", typeof(String))]
        public String Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn("Company", "CompanyID")]
        [ColumnRequired("公司必填", typeof(Guid?))]
        public Guid? CompanyID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Phone { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Email { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String DeliveryAddress { get; set; }
        /// <summary>
        /// 
        [ColumnRequired("货运量必填!", typeof(Decimal?))]
        /// </summary>
        public Decimal? LuggageAmount { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("货运单位必填!", typeof(String))]
        public String LuggageUnit { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Job { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public DateTime? BirthDay { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String StartAddress { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnRequired("起运地必填!", typeof(String))]
        public String StartPlace { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String DestinationPlace { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String InterimPlace { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn("AgentCompany", "AgentID")]
        public Guid? AgentOne { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? AgentOneCost { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? AgentOnePayment { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn("AgentCompany", "AgentID")]
        public Guid? AgentTwo { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? AgentTwoCost { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? AgentTwoPayment { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn("AgentCompany", "AgentID")]
        public Guid? AgentThree { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? AgentThreeCost { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? AgentThreePayment { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? BidCost { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? SaleAmount { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? FactCost { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Decimal? Profit { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Boolean? IsDamaged { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public Boolean? HasFutureBusiness { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn]
        public String Comment { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn("BusinessType", "TypeID")]
        [ColumnRequired("业务类型必填!", typeof(String))]
        public Guid? BusinessType { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [ColumnLength("备注只能输入1000个字!", 0, 1000)]
        public String Memo { get; set; }

        [Relation("CompanyID.Name")]
        public String CompanyName { get; set; }

        [Relation("BusinessType.Name")]
        public String BusinessTypeName { get; set; }

        [Relation("AgentOne.Name")]
        public String AgentOneName { get; set; }
        [Relation("AgentTwo.Name")]
        public String AgentTwoName { get; set; }
        [Relation("AgentThree.Name")]
        public String AgentThreeName { get; set; }

        public Decimal? TotalBidCost { get; set; }
        public Decimal? TotalSaleAmount { get; set; }
        public Decimal? TotalFactCost { get; set; }
        public Decimal? TotalProfit { get; set; }

        public string StepName { get; set; }
        public DateTime? EstimateDate { get; set; }
    }
}
