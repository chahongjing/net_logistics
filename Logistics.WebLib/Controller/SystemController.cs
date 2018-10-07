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
    /// 系统
    /// </summary>
    public class SystemController
    {
        /// <summary>
        /// 系统逻辑
        /// </summary>
        private SystemInfoBLL bll = new SystemInfoBLL();

        /// <summary>
        /// 系统列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/SystemList.aspx")]
        public String SystemList()
        {
            SystemListViewData view = new SystemListViewData();
            view.List = new List<SystemInfo>();

            view.PageData = new PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.SystemList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, SystemGuid,
       Code, Name, Remark
  FROM dbo.SystemInfo
";
            view.List = new Pagintion(sql, null, view.PageData).ToList<SystemInfo>();
            return PageViewHelper.LoadPage("/System/SystemList.aspx", view);
        }

        /// <summary>
        /// 系统详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/SystemDetail.aspx")]
        public String UserDetail(Guid oid)
        {
            SystemDetailViewData view = new SystemDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxSystem/Insert.cspx";
                view.Entity = new SystemInfo();
            }
            else
            {
                view.Url = "/AjaxSystem/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/SystemDetail.aspx", view);
        }
    }
}
