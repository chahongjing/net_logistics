using System;
using System.Linq;
using System.Collections.Generic;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using BaseFrameWork.DAL;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 角色
    /// </summary>
    public class RoleController
    {
        /// <summary>
        /// 角色业务逻辑
        /// </summary>
        private RoleInfoBLL bll = new RoleInfoBLL();
        /// <summary>
        /// 系统业务逻辑
        /// </summary>
        private SystemInfoBLL bllS = new SystemInfoBLL();
        /// <summary>
        /// 模块业务逻辑
        /// </summary>
        private FunctionInfoBLL bllF = new FunctionInfoBLL();

        /// <summary>
        /// 角色列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/RoleList.aspx")]
        public String RoleList()
        {
            RoleListViewData view = new RoleListViewData();

            view.PageData.PagintionJsFunction = "window.System.RoleTab.searchRole()";
            view.PageData.OrderBy = "Code";
            string sql = @"SELECT A.*, CASE WHEN B.OrganizationName IS NOT NULL THEN STUFF(B.OrganizationName, 1, 1, '') ELSE '' END AS OrganizationName,
       CASE WHEN C.UserName IS NOT NULL THEN STUFF(C.UserName, 1, 1, '') ELSE '' END AS UserName
  FROM dbo.RoleInfo AS A
 OUTER APPLY (SELECT ';' + IB.Name
                FROM dbo.RoleToBusiness AS IA
               INNER JOIN dbo.Organization AS IB ON IA.BusinessGuid = IB.UnitGuid
               WHERE IA.RoleGuid = A.RoleGuid
                 AND IB.Name > ''
               ORDER BY IB.Code
                 FOR XML PATH('')) AS B(OrganizationName)
 OUTER APPLY (SELECT ';' + IB.UserName
                FROM dbo.RoleToBusiness AS IA
               INNER JOIN dbo.UserInfo AS IB ON IA.BusinessGuid = IB.UserGuid
               WHERE IA.RoleGuid = A.RoleGuid
                 AND IB.UserName > ''
               ORDER BY IB.UserCode
                 FOR XML PATH('')) AS C(UserName)";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = new Pagintion(sql, null, view.PageData).ToList<RoleInfo>();
            }

            return PageViewHelper.LoadPage("/System/RoleList.aspx", view);
        }

        /// <summary>
        /// 角色列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/RoleToBusinessList.aspx")]
        public String RoleToBusinessList(Guid oid)
        {
            RoleToBusinessListViewData view = new RoleToBusinessListViewData();
            view.RoleGuid = oid;

            view.listOrganization.PageData.PagintionJsFunction = "window.System.RoleList.searchOrganization()";
            view.listOrganization.PageData.OrderBy = "Code";

            string sql = @"SELECT A.*, B.Name AS ParentName, C.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.Organization AS A
  LEFT JOIN dbo.Organization AS B ON A.ParentGuid = B.UnitGuid
  LEFT JOIN dbo.RoleToBusiness AS C ON A.UnitGuid = C.BusinessGuid AND C.RoleGuid = @RoleGuid
";
            view.listOrganization.List = new Pagintion(sql, new { RoleGuid = oid }, view.listOrganization.PageData).ToList<Organization>();

            view.listUserInfo.PageData.PagintionJsFunction = "window.System.RoleList.searchUser()";
            view.listUserInfo.PageData.OrderBy = "UserCode";

            sql = @"SELECT A.*, B.Name AS DepartmentName, C.Name AS CompanyName, D.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.UserInfo AS A
  LEFT JOIN dbo.Organization AS B ON A.DepartmentGuid = B.UnitGuid
  LEFT JOIN dbo.Organization AS C ON A.CompanyGuid = C.UnitGuid
  LEFT JOIN dbo.RoleToBusiness AS D ON A.UserGuid = D.BusinessGuid AND D.RoleGuid = @RoleGuid
";
            view.listUserInfo.List = new Pagintion(sql, new { RoleGuid = oid }, view.listUserInfo.PageData).ToList<UserInfo>();
            return PageViewHelper.LoadPage("/System/RoleToBusinessList.aspx", view);
        }
        /// <summary>
        /// 角色权限
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/RoleToPermissionList.aspx")]
        public String RoleToPermissionList(Guid oid)
        {
            RolePermissionListViewData view = new RolePermissionListViewData();
            view.RoleGuid = oid;

            view.systemList = bllS.GetList();
            view.functionList = bllF.GetList();

            view.PageData.PagintionJsFunction = "window.System.RoleToPermissionList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.*, B.Name AS FunctionName, C.Name AS SystemName, D.RoleToPermissionGuid AS PermissionGuid
  FROM dbo.ActionInfo AS A
  LEFT JOIN dbo.FunctionInfo AS B ON A.FunctionGuid = B.FunctionGuid
  LEFT JOIN dbo.SystemInfo AS C ON B.SystemGuid = C.SystemGuid
  LEFT JOIN dbo.RoleToPermission AS D ON A.ActionGuid = D.ActionGuid AND D.RoleGuid = @RoleGuid
";
            view.List = new Pagintion(sql, new { RoleGuid = oid }, view.PageData).ToList<ActionInfo>();
            return PageViewHelper.LoadPage("/System/RoleToPermissionList.aspx", view);
        }
        /// <summary>
        /// 角色权限
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/PermissionToRoleList.aspx")]
        public String PermissionToRoleList(Guid oid)
        {
            PermissionRoleListViewData view = new PermissionRoleListViewData();
            view.ActionGuid = oid;

            view.PageData.PagintionJsFunction = "window.System.PermissionToRoleList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.*, B.RoleToPermissionGuid AS PermissionGuid
  FROM dbo.RoleInfo AS A
  LEFT JOIN dbo.RoleToPermission AS B ON A.RoleGuid = B.RoleGuid AND B.ActionGuid = @ActionGuid
";
            view.List = new Pagintion(sql, new { ActionGuid = oid }, view.PageData).ToList<RoleInfo>();
            return PageViewHelper.LoadPage("/System/PermissionToRoleList.aspx", view);
        }

        /// <summary>
        /// 角色详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/RoleDetail.aspx")]
        public String RoleDetail(Guid oid)
        {
            RoleDetailViewData view = new RoleDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxRole/Insert.cspx";
                view.Entity = new RoleInfo();
            }
            else
            {
                view.Url = "/AjaxRole/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/RoleDetail.aspx", view);
        }
    }
}
