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
    /// 模块
    /// </summary>
    public class FunctionController
    {
        /// <summary>
        /// 模块业务逻辑
        /// </summary>
        private FunctionInfoBLL bll = new FunctionInfoBLL();

        /// <summary>
        /// 模块列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/FunctionList.aspx")]
        public String FunctionList()
        {
            FunctionListViewData view = new FunctionListViewData();
            view.List = new List<FunctionInfo>();

            view.PageData = new PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.FunctionList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.CreatedBy, A.CreatedOn, A.ModifiedBy, A.ModifiedOn, A.FunctionGuid,
       A.Code, A.Name, A.Remark, B.Name AS SystemName
  FROM dbo.FunctionInfo AS A
  LEFT JOIN dbo.SystemInfo AS B ON A.SystemGuid = B.SystemGuid
";
            view.List = new Pagintion(sql, null, view.PageData).ToList<FunctionInfo>();
            return PageViewHelper.LoadPage("/System/FunctionList.aspx", view);
        }

        /// <summary>
        /// 模块详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/FunctionDetail.aspx")]
        public String FunctionDetail(Guid oid)
        {
            FunctionDetailViewData view = new FunctionDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxFunction/Insert.cspx";
                view.Entity = new FunctionInfo();
            }
            else
            {
                view.Url = "/AjaxFunction/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/FunctionDetail.aspx", view);
        }
    }
}
