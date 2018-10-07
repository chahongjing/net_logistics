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
    /// 功能点
    /// </summary>
    public class AjaxRoleToPermission
    {
        /// <summary>
        /// 功能点业务逻辑
        /// </summary>
        private RoleToPermissionBLL bll = new RoleToPermissionBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [Action]
        public string Insert(RoleToPermission entity)
        {
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [Action]
        public string Update(RoleToPermission entity)
        {
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(RoleToPermission entity)
        {
            entity.Delete();
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult DeleteRolePermission(RoleToPermission entity)
        {
            bll.DeleteRolePermission(entity);
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string Search(PaginationData pd, Guid RoleGuid)
        {
            RolePermissionListViewData view = new RolePermissionListViewData();

            view.PageData.PagintionJsFunction = "window.System.RoleToPermissionList.search()";
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS FunctionName, C.Name AS SystemName, D.RoleToPermissionGuid AS PermissionGuid
  FROM dbo.ActionInfo AS A
  LEFT JOIN dbo.FunctionInfo AS B ON A.FunctionGuid = B.FunctionGuid
  LEFT JOIN dbo.SystemInfo AS C ON B.SystemGuid = C.SystemGuid
  LEFT JOIN dbo.RoleToPermission AS D ON A.ActionGuid = D.ActionGuid AND D.RoleGuid = @RoleGuid
";
            view.List = new Pagintion(sql, new { RoleGuid = RoleGuid }, view.PageData).ToList<ActionInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/RolePermissionList.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
