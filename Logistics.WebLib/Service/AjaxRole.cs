using System;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 角色
    /// </summary>
    public class AjaxRole
    {
        /// <summary>
        /// 角色业务逻辑
        /// </summary>
        private RoleInfoBLL bll = new RoleInfoBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(RoleInfo entity)
        {
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(RoleInfo entity)
        {
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(RoleInfo entity)
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
        public string SearchRole(PaginationData pd)
        {
            ListViewData<RoleInfo> view = new ListViewData<RoleInfo>();

            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.RoleTab.searchRole()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, CASE WHEN B.OrganizationName IS NOT NULL THEN STUFF(B.OrganizationName, 1, 1, '') ELSE '' END AS OrganizationName,
       CASE WHEN C.UserName IS NOT NULL THEN STUFF(C.UserName, 1, 1, '') ELSE '' END AS UserName
  FROM dbo.RoleInfo AS A
 OUTER APPLY (SELECT ';' + IB.Name
                FROM dbo.RoleToBusiness AS IA
               INNER JOIN dbo.Organization AS IB ON IA.BusinessGuid = IB.UnitGuid
               WHERE IB.Name > ''
               ORDER BY IB.Code
                 FOR XML PATH('')) AS B(OrganizationName)
 OUTER APPLY (SELECT ';' + IB.UserName
                FROM dbo.RoleToBusiness AS IA
               INNER JOIN dbo.UserInfo AS IB ON IA.BusinessGuid = IB.UserGuid
               WHERE IB.UserName > ''
               ORDER BY IB.UserCode
                 FOR XML PATH('')) AS C(UserName)";

            view.List = new Pagintion(sql, null, view.PageData).ToList<RoleInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/RoleList.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <param name="businessGuid">业务对象</param>
        /// <returns></returns>
        [Action]
        public string SearchRoleByBusiness(PaginationData pd, Guid businessGuid)
        {
            ListViewData<RoleInfo> view = new ListViewData<RoleInfo>();

            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.RoleTab.searchRoleByBusiness()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*
  FROM dbo.RoleInfo AS A
 INNER JOIN dbo.RoleToBusiness AS B ON A.RoleGuid = B.RoleGuid
 WHERE B.BusinessGuid = @BusinessGuid";

            view.List = new Pagintion(sql, new { BusinessGuid = businessGuid }, view.PageData).ToList<RoleInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/RoleList.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
