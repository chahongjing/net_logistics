using System;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 功能点
    /// </summary>
    public class AjaxAction
    {
        /// <summary>
        /// 功能点业务逻辑
        /// </summary>
        private ActionInfoBLL bll = new ActionInfoBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [Action]
        public string Insert(ActionInfo entity)
        {
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [Action]
        public string Update(ActionInfo entity)
        {
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(ActionInfo entity)
        {
            entity.Delete();
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string Search(PaginationData pd)
        {
            ActionListViewData view = new ActionListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.ActionList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.CreatedBy, A.CreatedOn, A.ModifiedBy, A.ModifiedOn, A.ActionGuid,
       A.Code, A.Name, A.Remark, B.Name AS FunctionName, C.Name AS SystemName
  FROM dbo.ActionInfo AS A
 INNER JOIN dbo.FunctionInfo AS B ON A.FunctionGuid = B.FunctionGuid
 INNER JOIN dbo.SystemInfo AS C ON B.SystemGuid = C.SystemGuid
";
            view.List = new Pagintion(sql, null, view.PageData).ToList<ActionInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/ActionList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
