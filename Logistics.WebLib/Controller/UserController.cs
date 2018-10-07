using System;
using BaseFrameWork;
using BaseFrameWork.MVC;
using Logistics.WebLib.ViewData;
using Logistics.BLL;
using Logistics.Entity;
using BaseFrameWork.Tool;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 用户
    /// </summary>
    public class UserController
    {
        /// <summary>
        /// 用户逻辑
        /// </summary>
        private UserInfoBLL bll = new UserInfoBLL();

        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/UserList.aspx")]
        public String UserList()
        {
            UserListViewData view = new UserListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.UserList.search()";
            view.PageData.OrderBy = "UserCode";

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS DepartmentName
  FROM dbo.UserInfo AS A
  LEFT JOIN dbo.Organization AS B ON A.CompanyGuid = B.UnitGuid
  LEFT JOIN dbo.Organization AS C ON A.DepartmentGuid = C.UnitGuid";
            view.List = new Pagintion(sql, null, view.PageData).ToList<UserInfo>();

            return PageViewHelper.LoadPage("/System/UserList.aspx", view);
        }

        /// <summary>
        /// 用户详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/UserDetail.aspx")]
        public String UserDetail(Guid oid)
        {
            UserDetailViewData view = new UserDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxUser/Insert.cspx";
                view.Entity = new UserInfo();
                view.Entity.Sex = true;
            }
            else
            {
                view.Url = "/AjaxUser/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/UserDetail.aspx", view);
        }

        [PageAction("/System/UserToRole.aspx")]
        public string OrganizationToRole(Guid oid)
        {
            BusinessToRoleViewData view = new BusinessToRoleViewData();
            view.BusinessGuid = oid;

            view.PageData.PagintionJsFunction = "window.System.UserToRole.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.*, B.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.RoleInfo AS A
  LEFT JOIN dbo.RoleToBusiness AS B ON A.RoleGuid = B.RoleGuid AND B.BusinessGuid = @BusinessGuid
";
            view.List = new Pagintion(sql, new { BusinessGuid = oid }, view.PageData).ToList<RoleInfo>();
            return PageViewHelper.LoadPage("/System/UserToRole.aspx", view);
        }
    }
}
