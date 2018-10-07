using System;
using System.Collections.Generic;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 功能点
    /// </summary>
    public class ActionController
    {
        /// <summary>
        /// 功能点业务逻辑
        /// </summary>
        private ActionInfoBLL bll = new ActionInfoBLL();

        /// <summary>
        /// 模块业务逻辑
        /// </summary>
        private FunctionInfoBLL fBll = new FunctionInfoBLL();

        /// <summary>
        /// 功能点列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/ActionList.aspx")]
        public String ActionList()
        {
            ActionListViewData view = new ActionListViewData();
            view.List = new List<ActionInfo>();

            view.PageData = new PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.ActionList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.CreatedBy, A.CreatedOn, A.ModifiedBy, A.ModifiedOn, A.ActionGuid,
       A.Code, A.Name, A.Remark, B.Name AS FunctionName, C.Name AS SystemName
  FROM dbo.ActionInfo AS A
 INNER JOIN dbo.FunctionInfo AS B ON A.FunctionGuid = B.FunctionGuid
 INNER JOIN dbo.SystemInfo AS C ON B.SystemGuid = C.SystemGuid
";
            view.List = new Pagintion(sql, null, view.PageData).ToList<ActionInfo>();
            return PageViewHelper.LoadPage("/System/ActionList.aspx", view);
        }

        /// <summary>
        /// 功能点详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/ActionDetail.aspx")]
        public String ActionDetail(Guid oid)
        {
            ActionDetailViewData view = new ActionDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxAction/Insert.cspx";
                view.Entity = new ActionInfo();
            }
            else
            {
                FunctionInfo fi = new FunctionInfo();
                view.Url = "/AjaxAction/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                fi = fBll.Retrieve(view.Entity.FunctionGuid.Value);
                view.Entity.SystemGuid = fi.SystemGuid;
                view.Entity.SystemName = fi.SystemName;
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/ActionDetail.aspx", view);
        }
    }
}
