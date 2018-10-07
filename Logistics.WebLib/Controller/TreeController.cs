using System;
using BaseFrameWork.MVC;
using Logistics.WebLib.ViewData;
using BaseFrameWork.DAL;
using Logistics.BLL;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 树
    /// </summary>
    public class TreeController
    {
        /// <summary>
        /// 一级分类
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        [PageAction("/System/FirstMenuTree.aspx")]
        public String FirstMenuTree(Guid oid)
        {
            TreeViewData view = new TreeViewData();
            view.Title = "一级分类";

            string sql = @"SELECT Name AS Text, CAST(MenuGuid AS NVARCHAR(36)) AS ID, CAST(ParentGuid AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ' + Icon + '''></i>' AS Icon
  FROM dbo.Menu
 --WHERE ParentGuid IS NULL
 ORDER BY OrderCode";
            view.List = "[]";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = TreeNodeList.ToTreeNodeJson(DbHelper.Db(sql).ToList<TreeNode>());
            }
            return PageViewHelper.LoadPage("/System/CommonPage/SingleSelectedTree.aspx", view);
        }

        /// <summary>
        /// 公司
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/CompanyTree.aspx")]
        public String CompanyTree()
        {
            TreeViewData view = new TreeViewData();
            view.Title = "公司";

            string sql = @"SELECT Name AS Text, CAST(UnitGuid AS NVARCHAR(36)) AS ID, CAST(ParentGuid AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ' + Icon + '''></i>' AS Icon
  FROM dbo.Organization
 WHERE ParentGuid IS NULL
 ORDER BY Code";
            view.List = "[]";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = TreeNodeList.ToTreeNodeJson(DbHelper.Db(sql).ToList<TreeNode>());
            }
            return PageViewHelper.LoadPage("/System/CommonPage/SingleSelectedTree.aspx", view);
        }

        /// <summary>
        /// 部门
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/DepartmentTree.aspx")]
        public String DepartmentTree()
        {
            TreeViewData view = new TreeViewData();
            view.Title = "部门";

            string sql = @"SELECT Name AS Text, CAST(UnitGuid AS NVARCHAR(36)) AS ID, CAST(ParentGuid AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ' + Icon + '''></i>' AS Icon
  FROM dbo.Organization
 --WHERE ParentGuid IS NOT NULL
 ORDER BY Code";
            view.List = "[]";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = TreeNodeList.ToTreeNodeJson(DbHelper.Db(sql).ToList<TreeNode>());
            }
            return PageViewHelper.LoadPage("/System/CommonPage/SingleSelectedTree.aspx", view);
        }

        /// <summary>
        /// 系统
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/SystemTree.aspx")]
        public String SystemTree()
        {
            TreeViewData view = new TreeViewData();
            view.Title = "系统";

            string sql = @"SELECT Name AS Text, CAST(SystemGuid AS NVARCHAR(36)) AS ID, CAST(NULL AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ''></i>' AS Icon
  FROM dbo.SystemInfo
 ORDER BY Code";
            view.List = "[]";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = TreeNodeList.ToTreeNodeJson(DbHelper.Db(sql).ToList<TreeNode>());
            }
            return PageViewHelper.LoadPage("/System/CommonPage/SingleSelectedTree.aspx", view);
        }
        /// <summary>
        /// 模块
        /// </summary>
        /// <param name="systemGuid">系统主键</param>
        /// <returns></returns>
        [PageAction("/System/FunctionTree.aspx")]
        public String FunctionTree(Guid systemGuid)
        {
            TreeViewData view = new TreeViewData();
            view.Title = "模块";

            string sql = @"SELECT Name AS Text, CAST(FunctionGuid AS NVARCHAR(36)) AS ID, CAST(NULL AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ''></i>' AS Icon
  FROM dbo.FunctionInfo
 WHERE SystemGuid = @SystemGuid
 ORDER BY Code";
            view.List = "[]";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = TreeNodeList.ToTreeNodeJson(DbHelper.Db(sql, new { SystemGuid = systemGuid }).ToList<TreeNode>());
            }
            return PageViewHelper.LoadPage("/System/CommonPage/SingleSelectedTree.aspx", view);
        }

        /// <summary>
        /// 键值对
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/ParentKeyValuePairTree.aspx")]
        public String ParentKeyValuePairTree()
        {
            TreeViewData view = new TreeViewData();
            view.Title = "父级";

            string sql = @"SELECT Name AS Text, CAST(ID AS NVARCHAR(36)) AS ID, CAST(ParentGuid AS NVARCHAR(36)) AS ParentID, '<i class=''ace-icon ''></i>' AS Icon
  FROM KeyValuePair
 ORDER BY [Group], Code";
            view.List = "[]";
            using (DbConnectionScope dcs = new DbConnectionScope())
            {
                view.List = TreeNodeList.ToTreeNodeJson(DbHelper.Db(sql).ToList<TreeNode>());
            }
            return PageViewHelper.LoadPage("/System/CommonPage/SingleSelectedTree.aspx", view);
        }
    }
}
