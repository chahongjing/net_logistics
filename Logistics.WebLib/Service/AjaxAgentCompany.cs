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
    public class AjaxAgentCompany
    {
        /// <summary>
        /// 公司业务逻辑
        /// </summary>
        private AgentCompanyBLL bll = new AgentCompanyBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(AgentCompany entity)
        {
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(AgentCompany entity)
        {
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
        public AjaxResult Delete(AgentCompany entity)
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
            AgentCompanyListViewData view = new AgentCompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.AgentCompanyList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS AgentCompanyCharacterName
  FROM dbo.AgentCompany AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.[Character] = B.Code AND B.[Group] = 'CompanyCharacter'
 WHERE A.Name LIKE '%' + @key + '%'";
            view.List = new Pagintion(sql, new {key = pd.SearchKey }, view.PageData).ToList<AgentCompany>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/AgentCompanyList.ascx", view);
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
            AgentCompanyListViewData view = new AgentCompanyListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.SelectAgentCompany.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS AgentCompanyCharacterName
  FROM dbo.AgentCompany AS A
  LEFT JOIN dbo.KeyValuePair AS B ON A.[Character] = B.Code AND B.[Group] = 'CompanyCharacter'
 WHERE A.Name LIKE '%' + @key + '%'";
            view.List = new Pagintion(sql, new { key = pd.SearchKey }, view.PageData).ToList<AgentCompany>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/SelectAgentCompany.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
