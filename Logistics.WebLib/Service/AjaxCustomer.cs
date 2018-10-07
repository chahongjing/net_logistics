using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Logistics.BLL;
using System.Web;
using System.IO;
using Logistics.Entity;
using BaseFrameWork.MVC;
using BaseFrameWork.Model;
using BaseFrameWork.Tool;
using Logistics.WebLib.ViewData;
using BaseFrameWork.Serialize;
using BaseFrameWork.DAL;
using System.Data.SqlTypes;
using System.Configuration;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    public class AjaxCustomer
    {
        /// <summary>
        /// 客户业务逻辑
        /// </summary>
        private CustomerBLL bll = new CustomerBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(Customer entity, string stepList)
        {
            entity.CustomerID = (entity.CustomerID == Guid.Empty ? Guid.NewGuid() : entity.CustomerID);
            List<ProcessStep> list = JsonHelper.JsonTo<List<ProcessStep>>(stepList);
            using (DbConnectionScope sc = new DbConnectionScope())
            {
                foreach (ProcessStep item in list)
                {
                    item.ID = Guid.NewGuid();
                    item.CustomerID = entity.CustomerID;
                    item.CreatedOn = DateTime.Now;
                    item.CreatedBy = UserInfoBLL.GetCurrentUserGuid();
                    item.SetDefaultValue("FinishDate" );
                    item.Insert();
                }
                return bll.Insert(entity).ToString();
            }
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(Customer entity, string stepList)
        {
            List<ProcessStep> list = JsonHelper.JsonTo<List<ProcessStep>>(stepList);
            using (DbConnectionScope sc = new DbConnectionScope())
            {

                List<string> guids = new List<string>() { Guid.Empty.ToString() };
                guids.AddRange(list.Select(item => item.ID.ToString()));
                string sql = @"DELETE FROM dbo.ProcessStep WHERE CustomerID = @CustomerID AND ID NOT IN('" + string.Join("', '", guids.ToArray()) + "');";
                DbHelper.Db(sql, new { CustomerID = entity.CustomerID });
                foreach (ProcessStep item in list)
                {
                    item.CustomerID = entity.CustomerID;
                    if (item.ID == Guid.Empty)
                    {
                        item.ID = Guid.NewGuid();
                        item.CreatedOn = DateTime.Now;
                        item.CreatedBy = UserInfoBLL.GetCurrentUserGuid();
                        item.SetDefaultValue("FinishDate");
                        item.Insert();
                    }
                    else
                    {
                        item.ModifiedOn = DateTime.Now;
                        item.ModifiedBy = UserInfoBLL.GetCurrentUserGuid();
                        item.SetDefaultValue("FinishDate");
                        item.Update();
                    }
                }
                entity.ModifiedOn = DateTime.Now;
                entity.ModifiedBy = UserInfoBLL.GetCurrentUserGuid();
                return bll.Update(entity).ToString();
            }
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(Customer entity)
        {
            entity.Delete();
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string Search(SearchKeyPaginationData pd, string company, DateTime? from, DateTime? to)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.CustomerList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 WHERE (((ISNULL(@CustomerName, '') <> '') AND A.Name LIKE '%' + @CustomerName + '%') OR (ISNULL(@CustomerName, '') = ''))
   AND (((ISNULL(@CompanyName, '') <> '') AND B.Name LIKE '%' + @CompanyName + '%') OR (ISNULL(@CompanyName, '') = ''))
   AND (((ISNULL(@From, '') <> '') AND A.CreatedOn >= @From) OR (ISNULL(@From, '') = ''))
   AND (((ISNULL(@To, '') <> '') AND A.CreatedOn < DATEADD(DAY, 1, @To)) OR (ISNULL(@To, '') = ''))";
            view.List = new Pagintion(sql, new { CustomerName = pd.SearchKey, CompanyName = company, From = from, To = to }, view.PageData).ToList<Customer>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/CustomerList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string AlertSearch(SearchKeyPaginationData pd, string company, DateTime? from, DateTime? to)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.CustomerAlertList.search()";
            view.PageData.OrderBy = pd.OrderBy;

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
            view.List = new Pagintion(sql, new { AlertDays = Convert.ToInt32(ConfigurationManager.AppSettings["AlertDays"]), CustomerName = pd.SearchKey, CompanyName = company, From = from, To = to }, view.PageData).ToList<Customer>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/CustomerAlertList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string MonthSearch(SearchKeyPaginationData pd, string company, DateTime? from, DateTime? to)
        {
            BusinessTypeListViewData view = new BusinessTypeListViewData();
            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = pd.PageIndex;
            view.pageDataParents.PageSize = pd.PageSize;
            view.pageDataParents.PagintionJsFunction = "window.System.CustomerMonthList.search()";
            view.pageDataParents.OrderBy = pd.OrderBy;

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
            view.menuListParents = new Pagintion(sql, new { CustomerName = pd.SearchKey, CompanyName = company, From = from, To = to }, view.pageDataParents).ToList<BusinessType>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/CustomerMonthList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.pageDataParents);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string StatisticSearch(SearchKeyPaginationData pd, string company, DateTime? from, DateTime? to, int num)
        {
            CustomerListViewData view = new CustomerListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.CustomerStatisticList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit
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
            view.List = new Pagintion(sql, new { Num = num, CustomerName = pd.SearchKey, CompanyName = company, From = from, To = to }, view.PageData).ToList<Customer>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/CustomerStatisticList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
