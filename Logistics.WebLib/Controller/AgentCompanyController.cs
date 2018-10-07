using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Logistics.BLL;
using BaseFrameWork.MVC;
using Logistics.WebLib.ViewData;
using BaseFrameWork.Tool;
using Logistics.Entity;

namespace Logistics.WebLib.Controller
{
    public class AgentCompanyController
    {
        /// <summary>
        /// 代理公司逻辑
        /// </summary>
        private AgentCompanyBLL bll = new AgentCompanyBLL();
        /// <summary>
        /// 键值对逻辑
        /// </summary>
        private KeyValuePBLL kpBll = new KeyValuePBLL();


        /// <summary>
        /// 公司列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/AgentCompanyList.aspx")]
        public String AgentCompanyList()
        {
            AgentCompanyListViewData view = new AgentCompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.AgentCompanyList.search()";
            view.PageData.OrderBy = "Name, CreatedOn";

            string sql = @"SELECT A.*, B.Name AS AgentCompanyCharacterName
  FROM dbo.AgentCompany AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.[Character] = B.Code AND B.[Group] = 'CompanyCharacter'";
            view.List = new Pagintion(sql, null, view.PageData).ToList<AgentCompany>();

            return PageViewHelper.LoadPage("/System/AgentCompanyList.aspx", view);
        }

        /// <summary>
        /// 公司详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/AgentCompanyDetail.aspx")]
        public String AgentCompanyDetail(Guid oid)
        {
            AgentCompanyDetailViewData view = new AgentCompanyDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxAgentCompany/Insert.cspx";
                view.Entity = new AgentCompany();
                view.Entity.CreatedOn = DateTime.Now;
            }
            else
            {
                view.Url = "/AjaxAgentCompany/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            view.CompanyCharacterList = kpBll.RetrieveList("[KeyValuePair].[Group] = 'CompanyCharacter' ORDER BY [KeyValuePair].[Code]"); ;
            return PageViewHelper.LoadPage("/System/AgentCompanyDetail.aspx", view);
        }
        /// <summary>
        /// 公司列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/SelectAgentCompany.aspx")]
        public String SelectAgentCompany()
        {
            AgentCompanyListViewData view = new AgentCompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.SelectAgentCompany.search()";
            view.PageData.OrderBy = "Name, CreatedOn";

            string sql = @"SELECT A.*, B.Name AS AgentCompanyCharacterName
  FROM dbo.AgentCompany AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.[Character] = B.Code AND B.[Group] = 'CompanyCharacter'";
            view.List = new Pagintion(sql, null, view.PageData).ToList<AgentCompany>();

            return PageViewHelper.LoadPage("/System/SelectAgentCompany.aspx", view);
        }
    }
}
