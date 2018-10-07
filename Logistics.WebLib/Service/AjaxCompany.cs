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
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    public class AjaxCompany
    {
        /// <summary>
        /// 公司业务逻辑
        /// </summary>
        private CompanyBLL bll = new CompanyBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(Company entity)
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                HttpPostedFile hpf = HttpContext.Current.Request.Files[0];
                string fileName = Guid.NewGuid().ToString().Replace("-", String.Empty) + Path.GetExtension(hpf.FileName);
                string filePath = Path.Combine(@"Image\Logo", fileName);
                hpf.SaveAs(Path.Combine(HttpRuntime.AppDomainAppPath, filePath));
                entity.Logo = fileName;
            }
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(Company entity)
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                HttpPostedFile hpf = HttpContext.Current.Request.Files[0];
                string fileName = Guid.NewGuid().ToString().Replace("-", String.Empty) + Path.GetExtension(hpf.FileName);
                string filePath = Path.Combine(@"Image\Logo", fileName);
                hpf.SaveAs(Path.Combine(HttpRuntime.AppDomainAppPath, filePath));
                entity.Logo = fileName;
            }
            entity.ModifiedOn = DateTime.Now;
            entity.ModifiedBy = UserInfoBLL.GetCurrentUserGuid();
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(Company entity)
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
        public string Search(SearchKeyPaginationData pd)
        {
            CompanyListViewData view = new CompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.CompanyList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS CompanyCharacterName, C.Name AS PayTypeName, D.Processing, E.AllCustomer - D.Processing AS Finished
  FROM dbo.Company AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.PayType = B.Code AND B.[Group] = 'CompanyCharacter'
  LEFT JOIN dbo.KeyValuePair AS C ON A.PayType = C.Code AND C.[Group] = 'PayType'
 OUTER APPLY (SELECT COUNT(DISTINCT IA.CustomerID) AS Processing
                FROM dbo.Customer AS IA
               INNER JOIN dbo.ProcessStep AS IB ON IA.CustomerID = IB.CustomerID
               WHERE IB.FinishDate IS NULL
                 AND IA.CompanyID = A.CompanyID) AS D
 OUTER APPLY(SELECT COUNT(*) AS AllCustomer FROM dbo.Customer AS IA WHERE IA.CompanyID = A.CompanyID) AS E
 WHERE A.Name LIKE '%' + @key + '%'";
            view.List = new Pagintion(sql, new { key = pd.SearchKey }, view.PageData).ToList<Company>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/CompanyList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SelectSearch(SearchKeyPaginationData pd)
        {
            CompanyListViewData view = new CompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.SelectCompany.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS CompanyCharacterName, C.Name AS PayTypeName, D.Processing, D.Finished
  FROM dbo.Company AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.PayType = B.Code AND B.[Group] = 'CompanyCharacter'
  LEFT JOIN dbo.KeyValuePair AS C ON A.PayType = C.Code AND C.[Group] = 'PayType'
 OUTER APPLY (SELECT COUNT(DISTINCT CASE WHEN IB.FinishDate IS NULL THEN IA.CustomerID ELSE NULL END) AS Processing,
                     COUNT(DISTINCT CASE WHEN IB.FinishDate IS NOT NULL THEN IA.CustomerID ELSE NULL END) AS Finished
                FROM dbo.Customer AS IA
               INNER JOIN dbo.ProcessStep AS IB ON IA.CustomerID = IB.CustomerID) AS D
 WHERE A.Name LIKE '%' + @key + '%'";
            view.List = new Pagintion(sql, new { key = pd.SearchKey }, view.PageData).ToList<Company>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/SelectCompanyList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
        
    }
}
