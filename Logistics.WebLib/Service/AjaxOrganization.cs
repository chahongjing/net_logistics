
using System;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using BaseCommon.Serialize;
namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 组织架构
    /// </summary>
    public class AjaxOrganization
    {
        /// <summary>
        /// 组织架构业务逻辑
        /// </summary>
        private OrganizationBLL bll = new OrganizationBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(Organization entity)
        {
            entity.UnitGuid = entity.UnitGuid == Guid.Empty ? Guid.NewGuid() : entity.UnitGuid;
            return entity.Insert().ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(Organization entity)
        {
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(Organization entity)
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
        public string Search(PaginationData pd)
        {
            OrganizationListViewData view = new OrganizationListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.OrganizationList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS ParentName
  FROM dbo.Organization AS A
  LEFT JOIN dbo.Organization AS B ON A.ParentGuid = B.UnitGuid
 WHERE 1 = 1
   --AND A.ParentGuid = @ParentGuid
   AND 1 = 1";
            view.List = new Pagintion(sql, null, view.PageData).ToList<Organization>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/OrganizationList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
