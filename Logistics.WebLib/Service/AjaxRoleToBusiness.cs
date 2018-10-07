using System;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using BaseFrameWork.User;
using Logistics.BLL;
using Logistics.Entity;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class AjaxRoleToBusiness
    {
        /// <summary>
        /// 角色对象业务逻辑
        /// </summary>
        private RoleToBusinessBLL bll = new RoleToBusinessBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(RoleToBusiness entity)
        {
            entity.CreatedBy = UserManager.GetCurrentUserGuid();
            entity.CreatedOn = DateTime.Now;
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(RoleToBusiness entity)
        {
            entity.ModifiedBy = UserManager.GetCurrentUserGuid();
            entity.ModifiedOn = DateTime.Now;
            return bll.Update(entity).ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(RoleToBusiness entity)
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
        public AjaxResult DeleteRoleBusiness(RoleToBusiness entity)
        {
            bll.DeleteRoleBusiness(entity);
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }
        /// <summary>
        /// 一级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SearchRoleBusiness(PaginationData pd, Guid roleGuid)
        {
            ListViewData<Organization> view = new ListViewData<Organization>();

            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.OrderBy = pd.OrderBy;
            view.PageData.PagintionJsFunction = "window.System.RoleToBusinessList.searchRoleBusiness()";

            string sql = @"SELECT A.*, B.Name AS ParentName, C.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.Organization AS A
  LEFT JOIN dbo.Organization AS B ON A.ParentGuid = B.UnitGuid
  LEFT JOIN dbo.RoleToBusiness AS C ON A.UnitGuid = C.BusinessGuid AND C.RoleGuid = @RoleGuid
";
            view.List = new Pagintion(sql, new { RoleGuid = roleGuid }, view.PageData).ToList<Organization>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/RoleOrganizationList.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 二级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SearchRoleUser(PaginationData pd, Guid roleGuid)
        {
            ListViewData<UserInfo> view = new ListViewData<UserInfo>();
            view.PageData.PagintionJsFunction = "window.System.RoleToBusinessList.searchRoleUser()";
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS DepartmentName, C.Name AS CompanyName, D.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.UserInfo AS A
  LEFT JOIN dbo.Organization AS B ON A.DepartmentGuid = B.UnitGuid
  LEFT JOIN dbo.Organization AS C ON A.CompanyGuid = C.UnitGuid
  LEFT JOIN dbo.RoleToBusiness AS D ON A.UserGuid = D.BusinessGuid AND D.RoleGuid = @RoleGuid
";
            view.List = new Pagintion(sql, new { RoleGuid = roleGuid }, view.PageData).ToList<UserInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/RoleUserList.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 二级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SearchOrganizationToRole(PaginationData pd, Guid businessGuid)
        {
            ListViewData<RoleInfo> view = new ListViewData<RoleInfo>();
            view.PageData.PagintionJsFunction = "window.System.OrganizationToRole.search()";
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.RoleInfo AS A
  LEFT JOIN dbo.RoleToBusiness AS B ON A.RoleGuid = B.RoleGuid AND B.BusinessGuid = @BusinessGuid
";
            view.List = new Pagintion(sql, new { BusinessGuid = businessGuid }, view.PageData).ToList<RoleInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/BusinessToRole.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 二级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SearchUserToRole(PaginationData pd, Guid businessGuid)
        {
            ListViewData<UserInfo> view = new ListViewData<UserInfo>();
            view.PageData.PagintionJsFunction = "window.System.UserToRole.search()";
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.RoleInfo AS A
  LEFT JOIN dbo.RoleToBusiness AS B ON A.RoleGuid = B.RoleGuid AND B.BusinessGuid = @BusinessGuid

";
            view.List = new Pagintion(sql, new { BusinessGuid = businessGuid }, view.PageData).ToList<UserInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/UserToRole.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 二级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SearchPermissionToRole(PaginationData pd, Guid actionGuid)
        {
            ListViewData<RoleInfo> view = new ListViewData<RoleInfo>();
            view.PageData.PagintionJsFunction = "window.System.PermissionToRoleList.search()";
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.RoleToPermissionGuid AS PermissionGuid
  FROM dbo.RoleInfo AS A
  LEFT JOIN dbo.RoleToPermission AS B ON A.RoleGuid = B.RoleGuid AND B.ActionGuid = @ActionGuid
";
            view.List = new Pagintion(sql, new { ActionGuid = actionGuid }, view.PageData).ToList<RoleInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/BusinessToRole.ascx", view.List);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }


    }
}
