using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Logistics.BLL;
using BaseFrameWork.MVC;
using Logistics.WebLib.ViewData;
using BaseFrameWork.Tool;
using Logistics.Entity;
using BaseFrameWork.Model;
using System.Data;
using BaseFrameWork.Excel;
using System.Configuration;

namespace Logistics.WebLib.Controller
{
    public class CustomerController
    {
        /// <summary>
        /// 客户逻辑
        /// </summary>
        private CustomerBLL bll = new CustomerBLL();
        /// <summary>
        /// 键值对逻辑
        /// </summary>
        private KeyValuePBLL kpBll = new KeyValuePBLL();
        /// <summary>
        /// 步骤逻辑
        /// </summary>
        private ProcessStepBLL stepBll = new ProcessStepBLL();

        /// <summary>
        /// 客户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/CustomerList.aspx")]
        public String CustomerList()
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.CustomerList.search()";
            view.PageData.OrderBy = "CreatedOn DESC, Name";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID";
            view.List = new Pagintion(sql, null, view.PageData).ToList<Customer>();

            return PageViewHelper.LoadPage("/System/CustomerList.aspx", view);
        }

        /// <summary>
        /// 客户详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/CustomerDetail.aspx")]
        public String CustomerDetail(Guid oid)
        {
            CustomerDetailViewData view = new CustomerDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxCustomer/Insert.cspx";
                view.Entity = new Customer();
                view.Entity.CreatedOn = DateTime.Now;
                view.Entity.HasFutureBusiness = true;
            }
            else
            {
                view.Url = "/AjaxCustomer/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            view.LuggageUnitList = kpBll.RetrieveList("[KeyValuePair].[Group] = 'UnitType' ORDER BY [KeyValuePair].[Code]");
            view.StepList = stepBll.RetrieveList("[ProcessStep].[CustomerID] = '" + oid.ToString() + "' ORDER BY [ProcessStep].[EstimateDate], [ProcessStep].[Seq]");
            view.StepList.ForEach(item => { SetIcon(item); });
            return PageViewHelper.LoadPage("/System/CustomerDetail.aspx", view);
        }

        /// <summary>
        /// 获取步骤列表图标
        /// </summary>
        /// <param name="item"></param>
        public static void SetIcon(ProcessStep item)
        {
            /// 过去
            if (item.EstimateDate < DateTime.Now.Date || item.FinishDate.HasValue)
            {
                /// 提前完成 绿色勾
                if (item.EstimateDate >= item.FinishDate)
                {
                    item.Status = "fa fa-check-circle green";
                    item.StatusTips = "顺利完成!";
                }
                /// 超时完成 红色叉
                else if (item.EstimateDate < item.FinishDate)
                {
                    item.Status = "fa fa-times-circle red";
                    item.StatusTips = "超时未完成!";
                }
                /// 时间未填写 灰色问号
                else
                {
                    item.Status = "fa fa-question grey";
                    item.StatusTips = "超时未填写!";
                }
            }
            /// 未来
            else
            {
                if (item.FinishDate.HasValue)
                {
                    if (item.EstimateDate >= item.FinishDate)
                    {
                        item.Status = "fa fa-check-circle green";
                        item.StatusTips = "顺利完成!";
                    }
                    else
                    {
                        item.Status = "fa fa-times-circle red";
                        item.StatusTips = "超时未完成!";
                    }
                }
                /// 指定天数之内
                else if (item.EstimateDate < DateTime.Now.AddDays(Convert.ToInt32(ConfigurationManager.AppSettings["AlertDays"])))
                {
                    item.Status = "fa fa-bell red";
                    item.StatusTips = "待办事项, 请注意提前准备!";
                }
                else
                {
                    item.Status = "fa fa-circle blue";
                    item.StatusTips = "将来处理事项!";
                }
                /// 指定天数之外
            }
        }

        [PageAction("/System/CustomerListExport.aspx")]
        public void CustomerListExport(string searchKey, string company, DateTime? from, DateTime? to)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = int.MaxValue;
            view.PageData.PagintionJsFunction = "window.System.CustomerList.search()";
            view.PageData.OrderBy = "CreatedOn DESC, Name";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 WHERE (((ISNULL(@CustomerName, '') <> '') AND A.Name LIKE '%' + @CustomerName + '%') OR (ISNULL(@CustomerName, '') = ''))
   AND (((ISNULL(@CompanyName, '') <> '') AND B.Name LIKE '%' + @CompanyName + '%') OR (ISNULL(@CompanyName, '') = ''))
   AND (((ISNULL(@From, '') <> '') AND A.CreatedOn >= @From) OR (ISNULL(@From, '') = ''))
   AND (((ISNULL(@To, '') <> '') AND A.CreatedOn < DATEADD(DAY, 1, @To)) OR (ISNULL(@To, '') = ''))";
            DataTable dt = new Pagintion(sql, new { CustomerName = searchKey, CompanyName = company, From = from, To = to }, view.PageData).ToDataTable();

            dt = dt.DefaultView.ToTable(true, new string[] { "Name", "CompanyName", "BusinessTypeName", "BidCost", "SaleAmount", "FactCost", "Profit", "Phone", "StartPlace", "DestinationPlace", "Comment" });

            dt.Columns["Name"].ColumnName = "客户名称";
            dt.Columns["CompanyName"].ColumnName = "所属公司";
            dt.Columns["BusinessTypeName"].ColumnName = "业务类型";
            dt.Columns["BidCost"].ColumnName = "报价";
            dt.Columns["SaleAmount"].ColumnName = "销售额";
            dt.Columns["FactCost"].ColumnName = "成本";
            dt.Columns["Profit"].ColumnName = "利润";
            dt.Columns["Phone"].ColumnName = "联系电话";
            dt.Columns["StartPlace"].ColumnName = "起运地";
            dt.Columns["DestinationPlace"].ColumnName = "目的地";
            dt.Columns["Comment"].ColumnName = "评价";

            ExcelHelper eh = new ExcelHelper();
            eh.FillDataNew("客户列表", dt, "客户列表",true);
            eh.ExportExcelFile("客户列表文件");
        }

        #region 客户提醒

        /// <summary>
        /// 客户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/CustomerAlertList.aspx")]
        public String CustomerAlertList()
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.CustomerAlertList.search()";
            view.PageData.OrderBy = "CreatedOn DESC, Name";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit, D.StepName, D.EstimateDate
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 OUTER APPLY (SELECT TOP 1 IA.ID AS StepID, IA.StepName, IA.EstimateDate
                FROM dbo.ProcessStep AS IA
               WHERE A.CustomerID = IA.CustomerID
                 AND IA.EstimateDate > GETDATE()
                 AND IA.EstimateDate < GETDATE() + @AlertDays
                 AND FinishDate IS NULL
               ORDER BY IA.EstimateDate, IA.CreatedOn) AS D
 WHERE D.StepID IS NOT NULL";
            view.List = new Pagintion(sql, new { AlertDays = Convert.ToInt32(ConfigurationManager.AppSettings["AlertDays"]) }, view.PageData).ToList<Customer>();

            return PageViewHelper.LoadPage("/System/CustomerAlertList.aspx", view);
        }

        [PageAction("/System/CustomerAlertListExport.aspx")]
        public void CustomerAlertListExport(string searchKey, string company, DateTime? from, DateTime? to)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = int.MaxValue;
            view.PageData.PagintionJsFunction = "window.System.CustomerList.search()";
            view.PageData.OrderBy = "CreatedOn DESC, Name";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit, D.StepName, D.EstimateDate
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 OUTER APPLY (SELECT TOP 1 IA.ID AS StepID, IA.StepName, IA.EstimateDate
                FROM dbo.ProcessStep AS IA
               WHERE A.CustomerID = IA.CustomerID
                 AND IA.EstimateDate > GETDATE()
                 AND IA.EstimateDate < GETDATE() + @AlertDays
                 AND FinishDate IS NULL
               ORDER BY IA.EstimateDate, IA.CreatedOn) AS D
 WHERE D.StepID IS NOT NULL
   AND (((ISNULL(@CustomerName, '') <> '') AND A.Name LIKE '%' + @CustomerName + '%') OR (ISNULL(@CustomerName, '') = ''))
   AND (((ISNULL(@CompanyName, '') <> '') AND B.Name LIKE '%' + @CompanyName + '%') OR (ISNULL(@CompanyName, '') = ''))
   AND (((ISNULL(@From, '') <> '') AND A.CreatedOn >= @From) OR (ISNULL(@From, '') = ''))
   AND (((ISNULL(@To, '') <> '') AND A.CreatedOn < DATEADD(DAY, 1, @To)) OR (ISNULL(@To, '') = ''))";
            DataTable dt = new Pagintion(sql, new
            {
                AlertDays = Convert.ToInt32(ConfigurationManager.AppSettings["AlertDays"]),
                CustomerName = searchKey,
                CompanyName = company, 
                From = from, To = to }, view.PageData).ToDataTable();

            dt = dt.DefaultView.ToTable(true, new string[] { "Name", "CompanyName", "BusinessTypeName", "BidCost", "SaleAmount", "FactCost", "Profit", "Phone", "StartPlace", "DestinationPlace", "StepName", "EstimateDate" });

            dt.Columns["Name"].ColumnName = "客户名称";
            dt.Columns["CompanyName"].ColumnName = "所属公司";
            dt.Columns["BusinessTypeName"].ColumnName = "业务类型";
            dt.Columns["BidCost"].ColumnName = "报价";
            dt.Columns["SaleAmount"].ColumnName = "销售额";
            dt.Columns["FactCost"].ColumnName = "成本";
            dt.Columns["Profit"].ColumnName = "利润";
            dt.Columns["Phone"].ColumnName = "联系电话";
            dt.Columns["StartPlace"].ColumnName = "起运地";
            dt.Columns["DestinationPlace"].ColumnName = "目的地";
            dt.Columns["StepName"].ColumnName = "下一步";
            dt.Columns["EstimateDate"].ColumnName = "预计处理日期";

            ExcelHelper eh = new ExcelHelper();
            eh.FillDataNew("客户列表", dt, "客户列表", true);
            eh.ExportExcelFile("客户列表文件");
        }
        #endregion

        #region 客户统计

        /// <summary>
        /// 客户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/CustomerStatisticList.aspx")]
        public String CustomerStatisticList()
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.CustomerStatisticList.search()";
            view.PageData.OrderBy = "CreatedOn DESC, Name";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
OUTER APPLY (SELECT COUNT(*) AS StepCount
                FROM dbo.ProcessStep AS IA
               WHERE FinishDate IS NULL) AS D
 WHERE CASE WHEN D.StepCount = 0 THEN 0 ELSE 1 END = @Num";
            view.List = new Pagintion(sql, new { Num = 0 }, view.PageData).ToList<Customer>();

            return PageViewHelper.LoadPage("/System/CustomerStatisticList.aspx", view);
        }

        [PageAction("/System/CustomerStatisticListExport.aspx")]
        public void CustomerStatisticListExport(string searchKey, string company, DateTime? from, DateTime? to, int num)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = int.MaxValue;
            view.PageData.PagintionJsFunction = "window.System.CustomerList.search()";
            view.PageData.OrderBy = "CreatedOn DESC, Name";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
OUTER APPLY (SELECT COUNT(*) AS StepCount
                FROM dbo.ProcessStep AS IA
               WHERE FinishDate IS NULL) AS D
 WHERE (((ISNULL(@CustomerName, '') <> '') AND A.Name LIKE '%' + @CustomerName + '%') OR (ISNULL(@CustomerName, '') = ''))
   AND (((ISNULL(@CompanyName, '') <> '') AND B.Name LIKE '%' + @CompanyName + '%') OR (ISNULL(@CompanyName, '') = ''))
   AND (((ISNULL(@From, '') <> '') AND A.CreatedOn >= @From) OR (ISNULL(@From, '') = ''))
   AND (((ISNULL(@To, '') <> '') AND A.CreatedOn < DATEADD(DAY, 1, @To)) OR (ISNULL(@To, '') = ''))
   AND CASE WHEN D.StepCount = 0 THEN 0 ELSE 1 END = @Num";
            DataTable dt = new Pagintion(sql, new { Num = num, CustomerName = searchKey, CompanyName = company, From = from, To = to }, view.PageData).ToDataTable();

            dt = dt.DefaultView.ToTable(true, new string[] { "Name", "CompanyName", "BusinessTypeName", "BidCost", "SaleAmount", "FactCost", "Profit", "Phone", "StartPlace", "DestinationPlace", "Comment" });

            dt.Columns["Name"].ColumnName = "客户名称";
            dt.Columns["CompanyName"].ColumnName = "所属公司";
            dt.Columns["BusinessTypeName"].ColumnName = "业务类型";
            dt.Columns["BidCost"].ColumnName = "报价";
            dt.Columns["SaleAmount"].ColumnName = "销售额";
            dt.Columns["FactCost"].ColumnName = "成本";
            dt.Columns["Profit"].ColumnName = "利润";
            dt.Columns["Phone"].ColumnName = "联系电话";
            dt.Columns["StartPlace"].ColumnName = "起运地";
            dt.Columns["DestinationPlace"].ColumnName = "目的地";
            dt.Columns["Comment"].ColumnName = "评价";
            ExcelHelper eh = new ExcelHelper();
            eh.FillDataNew("客户列表", dt, "客户列表", true);
            eh.ExportExcelFile("客户列表文件");
        }
        #endregion

        #region 月度流量

        /// <summary>
        /// 客户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/CustomerMonthList.aspx")]
        public String CustomerMonthList()
        {
            BusinessTypeListViewData view = new BusinessTypeListViewData();
            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = 1;
            view.pageDataParents.PageSize = 10;
            view.pageDataParents.PagintionJsFunction = "window.System.CustomerMonthList.search()";
            view.pageDataParents.OrderBy = "Code";

            string sql = @"SELECT DISTINCT C.Code, C.Name, SUM(BidCost) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS BidCost,
       SUM(SaleAmount) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS SaleAmount,
       SUM(FactCost) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS FactCost,
       SUM(Profit) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS Profit,
       SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 WHERE A.CreatedOn >= CAST(DATENAME(YEAR, GETDATE()) + '-' + DATENAME(MONTH, GETDATE()) + '-01' AS DATETIME)
   AND A.CreatedOn < GETDATE()";
            view.menuListParents = new Pagintion(sql, null, view.pageDataParents).ToList<BusinessType>();

            return PageViewHelper.LoadPage("/System/CustomerMonthList.aspx", view);
        }

        [PageAction("/System/CustomerMonthListExport.aspx")]
        public void CustomerMonthListExport(string searchKey, string company, DateTime? from, DateTime? to)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = int.MaxValue;
            view.PageData.PagintionJsFunction = "window.System.CustomerList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT DISTINCT C.Code, C.Name, SUM(BidCost) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS BidCost,
       SUM(SaleAmount) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS SaleAmount,
       SUM(FactCost) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS FactCost,
       SUM(Profit) OVER(PARTITION BY A.BusinessType, C.Code, C.NAME) AS Profit,
       SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 WHERE (((ISNULL(@CustomerName, '') <> '') AND A.Name LIKE '%' + @CustomerName + '%') OR (ISNULL(@CustomerName, '') = ''))
   AND (((ISNULL(@CompanyName, '') <> '') AND B.Name LIKE '%' + @CompanyName + '%') OR (ISNULL(@CompanyName, '') = ''))
   AND (((ISNULL(@From, '') <> '') AND A.CreatedOn >= @From) OR (ISNULL(@From, '') = ''))
   AND (((ISNULL(@To, '') <> '') AND A.CreatedOn < DATEADD(DAY, 1, @To)) OR (ISNULL(@To, '') = ''))";
            DataTable dt = new Pagintion(sql, new { CustomerName = searchKey, CompanyName = company, From = from, To = to }, view.PageData).ToDataTable();

            dt = dt.DefaultView.ToTable(true, new string[] { "Code", "Name", "BidCost", "SaleAmount", "FactCost", "Profit" });

            dt.Columns["Code"].ColumnName = "业务类型编码";
            dt.Columns["Name"].ColumnName = "业务类型名称";
            dt.Columns["BidCost"].ColumnName = "报价";
            dt.Columns["SaleAmount"].ColumnName = "销售额";
            dt.Columns["FactCost"].ColumnName = "实际成本";
            dt.Columns["Profit"].ColumnName = "利润";

            ExcelHelper eh = new ExcelHelper();
            eh.FillDataNew("客户列表", dt, "客户列表", true);
            eh.ExportExcelFile("客户列表文件");
        }
        #endregion
    }
}
