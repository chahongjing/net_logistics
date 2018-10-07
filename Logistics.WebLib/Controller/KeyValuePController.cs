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
    /// 键值对
    /// </summary>
    public class KeyValuePController
    {
        /// <summary>
        /// 键值对业务逻辑
        /// </summary>
        private KeyValuePBLL bll = new KeyValuePBLL();

        /// <summary>
        /// 键值对列表
        /// </summary>
        /// <param name="groupCode"></param>
        /// <returns></returns>
        [PageAction("/System/KeyValuePList.aspx")]
        public String KeyValuePList(String groupCode)
        {
            KeyValuePListViewData view = new KeyValuePListViewData();
            view.List = new List<KeyValueP>();
            view.Code = groupCode;

            view.PageData = new PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.KeyValuePList.search()";
            view.PageData.OrderBy = "Code";

            string sql = @"SELECT A.*, B.[Name] AS ParentName
  FROM KeyValuePair AS A
  LEFT JOIN KeyValuePair AS B ON A.ParentGuid = B.ID
 WHERE A.[Group] = @Group
";
            view.List = new Pagintion(sql, new { Group = groupCode }, view.PageData).ToList<KeyValueP>();
            return PageViewHelper.LoadPage("/System/KeyValuePList.aspx", view);
        }

        /// <summary>
        /// 键值对详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <param name="code">分组代码</param>
        /// <returns></returns>
        [PageAction("/System/KeyValuePDetail.aspx")]
        public String KeyValuePDetail(Guid oid, String code)
        {
            KeyValuePDetailViewData view = new KeyValuePDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxKeyValueP/Insert.cspx";
                view.Entity = new KeyValueP();
                view.Entity.Group = code;
            }
            else
            {
                view.Url = "/AjaxKeyValueP/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/KeyValuePDetail.aspx", view);
        }
    }
}
