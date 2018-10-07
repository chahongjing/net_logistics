using BaseFrameWork.MVC;
using BaseFrameWork.Tool;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class NavigationController
    {
        public JavaScriptSerializer serializer = new JavaScriptSerializer();
        /// <summary>
        /// 菜单业务逻辑
        /// </summary>
        private MenuBLL bll = new MenuBLL();

        /// <summary>
        /// 菜单列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/NavigationList.aspx")]
        public String NavigationList()
        {
            NavigationListViewData view = new NavigationListViewData();

            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = 1;
            view.pageDataParents.PageSize = 10;
            view.pageDataParents.PagintionJsFunction = "window.System.NavigationList.firstSearch()";
            view.pageDataParents.OrderBy = "OrderCode";

            string sql = "select * from dbo.Menu where ParentGuid IS NULL";
            view.menuListParents = new Pagintion(sql, null, view.pageDataParents).ToList<Menu>();

            view.pageDataChildren = new BaseFrameWork.Model.PaginationData();
            view.pageDataChildren.PageIndex = 1;
            view.pageDataChildren.PageSize = 10;
            view.pageDataChildren.PagintionJsFunction = "window.System.NavigationList.secondSearch()";
            view.pageDataChildren.OrderBy = "OrderCode";

            Guid ParentGuid = view.menuListParents.Count > 0 ? view.menuListParents[0].MenuGuid : Guid.Empty;
            sql = "select A.*, B.Name AS ParentName from dbo.Menu AS A INNER JOIN dbo.Menu AS B ON A.ParentGuid = B.MenuGuid where A.ParentGuid = @ParentGuid";
            view.menuListChildren = new Pagintion(sql, new { ParentGuid = ParentGuid }, view.pageDataChildren).ToList<Menu>();

            return PageViewHelper.LoadPage("/System/NavigationList.aspx", view);
        }

        public Dictionary<string, object> dd(string json)
        {
            Dictionary<string, object> ret = new Dictionary<string, object>();
            Hashtable table = serializer.DeserializeObject(json) as Hashtable;
            if (table == null)
            {
                return ret;
            }
            foreach (string item in table.Keys)
            {
                abc(ret, item, table[item]);
            }
            return ret;
        }

        public void abc(Dictionary<string, object> ret, string key, object val)
        {
            Hashtable json = val as Hashtable;
            if (json == null)
            {
                ret.Add(key, val);
                return;
            }

            foreach (string item in json.Keys)
            {
                abc(ret, item, json[item]);
            }
        }

        /// <summary>
        /// 菜单详情页面
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <param name="type">级数</param>
        /// <param name="id">上级主键</param>
        /// <param name="name">上级名称</param>
        /// <returns></returns>
        [PageAction("/System/NavigationDetail.aspx")]
        public String NavigationDetail(Guid oid, int type, Guid id, string name)
        {
            NavigationDetailViewData view = new NavigationDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxMenu/Insert.cspx";
                view.Entity = new Menu();
                if (type == 2)
                {
                    view.Entity.ParentGuid = id;
                    view.Entity.ParentName = name;
                }
            }
            else
            {
                view.Url = "/AjaxMenu/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            view.type = type;
            return PageViewHelper.LoadPage("/System/NavigationDetail.aspx", view);
        }
    }
}
