using System;
using System.Collections.Generic;
using System.Linq;
using BaseFrameWork.DAL;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using System.Web;
using System.Net.Mail;
using BaseFrameWork.Mail;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 组织架构
    /// </summary>
    public class OrganizationController
    {
        /// <summary>
        /// 组织架构逻辑
        /// </summary>
        OrganizationBLL bll = new OrganizationBLL();

        /// <summary>
        /// 组织架构列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/OrganizationList.aspx")]
        public static String OrganizationList()
        {
            OrganizationListViewData view = new OrganizationListViewData();
            view.List = new List<Organization>();
            List<TreeNode> list;

            view.PageData = new PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.OrganizationList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT Name AS Text, CAST(UnitGuid AS NVARCHAR(36)) AS ID, CAST(ParentGuid AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ' + Icon + '''></i>' AS Icon FROM dbo.Organization ORDER BY Code";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                list = DbHelper.Db(sql).ToList<TreeNode>();
                view.treeList = TreeNodeList.ToTreeNodeJson(list);
            }
            view.treeTitle = "组织架构";
            TreeNode tr = list.FirstOrDefault();
            if (tr == null)
            {
                tr = new TreeNode();
            }
            sql = @"SELECT A.*, B.Name AS ParentName
  FROM dbo.Organization AS A
  LEFT JOIN dbo.Organization AS B ON A.ParentGuid = B.UnitGuid
 WHERE A.ParentGuid = @ParentGuid";
            view.List = new Pagintion(sql, new { ParentGuid = tr.ID }, view.PageData).ToList<Organization>();
            return PageViewHelper.LoadPage("/System/OrganizationList.aspx", view);
        }

        /// <summary>
        /// 组织架构详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <param name="parentGuid">上级组键</param>
        /// <returns></returns>
        [PageAction("/System/OrganizationDetail.aspx")]
        public String OrganizationDetail(Guid oid, Guid parentGuid)
        {
            OrganizationDetailViewData view = new OrganizationDetailViewData();
            view.Entity = new Organization();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxOrganization/Insert.cspx";
                if (parentGuid != Guid.Empty)
                {
                    Organization org = new Organization();
                    org.UnitGuid = parentGuid;
                    org = (Organization)org.Retrieve();
                    view.Entity.ParentGuid = org.UnitGuid;
                    view.Entity.ParentCode = org.ParentCode;
                    view.Entity.ParentName = org.Name;
                }
            }
            else
            {
                view.Url = "/AjaxOrganization/Update.cspx";
                view.Entity.UnitGuid = oid;
                view.Entity = (Organization)view.Entity.Retrieve();
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/OrganizationDetail.aspx", view);
        }

        [PageAction("/System/OrganizationToRole.aspx")]
        public string OrganizationToRole(Guid oid)
        {
            BusinessToRoleViewData view = new BusinessToRoleViewData();
            view.BusinessGuid = oid;

            view.PageData.PagintionJsFunction = "window.System.OrganizationToRole.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.*, B.RoleToBusinessGuid AS PermissionGuid
  FROM dbo.RoleInfo AS A
  LEFT JOIN dbo.RoleToBusiness AS B ON A.RoleGuid = B.RoleGuid AND B.BusinessGuid = @BusinessGuid
";
            view.List = new Pagintion(sql, new { BusinessGuid = oid }, view.PageData).ToList<RoleInfo>();
            return PageViewHelper.LoadPage("/System/OrganizationToRole.aspx", view);
        }
    }
}
