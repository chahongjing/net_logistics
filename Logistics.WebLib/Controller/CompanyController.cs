using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Logistics.BLL;
using BaseFrameWork.MVC;
using Logistics.WebLib.ViewData;
using BaseFrameWork.Tool;
using Logistics.Entity;
using System.Web;
using BaseFrameWork.Entity;

namespace Logistics.WebLib.Controller
{
    public class CompanyController
    {
        /// <summary>
        /// 公司逻辑
        /// </summary>
        private CompanyBLL bll = new CompanyBLL();
        /// <summary>
        /// 键值对逻辑
        /// </summary>
        private KeyValuePBLL kpBll = new KeyValuePBLL();
        

        /// <summary>
        /// 公司列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/CompanyList.aspx")]
        public String CompanyList()
        {
            CompanyListViewData view = new CompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.CompanyList.search()";
            view.PageData.OrderBy = "Name, CreatedOn";

            string sql = @"SELECT A.*, B.Name AS CompanyCharacterName, C.Name AS PayTypeName, D.Processing, E.AllCustomer - D.Processing AS Finished
  FROM dbo.Company AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.[Character] = B.Code AND B.[Group] = 'CompanyCharacter'
  LEFT JOIN dbo.KeyValuePair AS C ON A.PayType = C.Code AND C.[Group] = 'PayType'
 OUTER APPLY (SELECT COUNT(DISTINCT IA.CustomerID) AS Processing
                FROM dbo.Customer AS IA
               INNER JOIN dbo.ProcessStep AS IB ON IA.CustomerID = IB.CustomerID
               WHERE IB.FinishDate IS NULL
                 AND IA.CompanyID = A.CompanyID) AS D
 OUTER APPLY(SELECT COUNT(*) AS AllCustomer FROM dbo.Customer AS IA WHERE IA.CompanyID = A.CompanyID) AS E";
            view.List = new Pagintion(sql, null, view.PageData).ToList<Company>();

            return PageViewHelper.LoadPage("/System/CompanyList.aspx", view);
        }

        /// <summary>
        /// 公司详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/CompanyDetail.aspx")]
        public String CompanyDetail(Guid oid)
        {
            CompanyDetailViewData view = new CompanyDetailViewData();
            string mode = HttpContext.Current.Request["mode"];
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxCompany/Insert.cspx";
                view.Entity = new Company();
                view.Entity.CreatedOn = DateTime.Now;
            }
            else
            {
                view.Url = "/AjaxCompany/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
                if (!string.IsNullOrEmpty(mode) && mode != "2")
                {
                    view.FormType = FormType.ReadOnly;
                }
            }
            view.PayTypeList = kpBll.RetrieveList("[KeyValuePair].[Group] = 'PayType' ORDER BY [KeyValuePair].[Code]");
            view.CompanyCharacterList = kpBll.RetrieveList("[KeyValuePair].[Group] = 'CompanyCharacter' ORDER BY [KeyValuePair].[Code]");
            return PageViewHelper.LoadPage("/System/CompanyDetail.aspx", view);
        }

        /// <summary>
        /// 公司列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/SelectCompany.aspx")]
        public String SelectCompany()
        {
            CompanyListViewData view = new CompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.SelectCompany.search()";
            view.PageData.OrderBy = "Name, CreatedOn";

            string sql = @"SELECT A.*, B.Name AS CompanyCharacterName, C.Name AS PayTypeName, D.Processing, E.AllCustomer - D.Processing AS Finished
  FROM dbo.Company AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.[Character] = B.Code AND B.[Group] = 'CompanyCharacter'
  LEFT JOIN dbo.KeyValuePair AS C ON A.PayType = C.Code AND C.[Group] = 'PayType'
 OUTER APPLY (SELECT COUNT(DISTINCT IA.CustomerID) AS Processing
                FROM dbo.Customer AS IA
               INNER JOIN dbo.ProcessStep AS IB ON IA.CustomerID = IB.CustomerID
               WHERE IB.FinishDate IS NULL
                 AND IA.CompanyID = A.CompanyID) AS D
 OUTER APPLY(SELECT COUNT(*) AS AllCustomer FROM dbo.Customer AS IA WHERE IA.CompanyID = A.CompanyID) AS E";
            view.List = new Pagintion(sql, null, view.PageData).ToList<Company>();

            return PageViewHelper.LoadPage("/System/SelectCompany.aspx", view);
        }
    }
}
