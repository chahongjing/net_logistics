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
    public class BusinessTypeController
    {
        /// <summary>
        /// 菜单业务逻辑
        /// </summary>
        private BusinessTypeBLL bll = new BusinessTypeBLL();

        /// <summary>
        /// 菜单列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/BusinessTypeList.aspx")]
        public String BusinessTypeList()
        {
            BusinessTypeListViewData view = new BusinessTypeListViewData();

            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = 1;
            view.pageDataParents.PageSize = 10;
            view.pageDataParents.PagintionJsFunction = "window.System.BusinessTypeList.firstSearch()";
            view.pageDataParents.OrderBy = "Code";

            string sql = "SELECT * FROM BusinessType WHERE ParentID IS NULL";
            view.menuListParents = new Pagintion(sql, null, view.pageDataParents).ToList<BusinessType>();

            view.pageDataChildren = new BaseFrameWork.Model.PaginationData();
            view.pageDataChildren.PageIndex = 1;
            view.pageDataChildren.PageSize = 10;
            view.pageDataChildren.PagintionJsFunction = "window.System.BusinessTypeList.secondSearch()";
            view.pageDataChildren.OrderBy = "Code";

            Guid ParentGuid = view.menuListParents.Count > 0 ? view.menuListParents[0].TypeID : Guid.Empty;
            sql = "SELECT A.*, B.[Name] AS ParentName FROM BusinessType AS A INNER JOIN BusinessType AS B ON A.ParentID = B.TypeID WHERE B.TypeID = @TypeID";
            view.menuListChildren = new Pagintion(sql, new { TypeID = ParentGuid }, view.pageDataChildren).ToList<BusinessType>();

            return PageViewHelper.LoadPage("/System/BusinessTypeList.aspx", view);
        }

        /// <summary>
        /// 菜单详情页面
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <param name="type">级数</param>
        /// <param name="id">上级主键</param>
        /// <param name="name">上级名称</param>
        /// <returns></returns>
        [PageAction("/System/BusinessTypeDetail.aspx")]
        public String BusinessTypeDetail(Guid oid, int type, Guid id, string name)
        {
            BusinessTypeDetailViewData view = new BusinessTypeDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxBusinessType/Insert.cspx";
                view.Entity = new BusinessType();
                if (type == 2)
                {
                    view.Entity.ParentID = id;
                    view.Entity.ParentName = name;
                }
            }
            else
            {
                view.Url = "/AjaxBusinessType/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            view.type = type;
            return PageViewHelper.LoadPage("/System/BusinessTypeDetail.aspx", view);
        }

        /// <summary>
        /// 菜单列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/SelectBusinessType.aspx")]
        public String SelectBusinessType()
        {
            BusinessTypeListViewData view = new BusinessTypeListViewData();

            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = 1;
            view.pageDataParents.PageSize = 10;
            view.pageDataParents.PagintionJsFunction = "window.System.SelectBusinessType.search()";
            view.pageDataParents.OrderBy = "Code";

            string sql = "SELECT * FROM BusinessType WHERE ParentID IS NULL";
            view.menuListParents = new Pagintion(sql, null, view.pageDataParents).ToList<BusinessType>();

            return PageViewHelper.LoadPage("/System/SelectBusinessType.aspx", view);
        }
    }
}
