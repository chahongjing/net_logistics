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
    /// 系统
    /// </summary>
    public class AjaxSystem
    {
        /// <summary>
        /// 系统业务逻辑
        /// </summary>
        private SystemInfoBLL bll = new SystemInfoBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(SystemInfo entity)
        {
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(SystemInfo entity)
        {
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(SystemInfo entity)
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
            SystemListViewData view = new SystemListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.SystemList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, SystemGuid,
       Code, Name, Remark
  FROM dbo.SystemInfo
";
            view.List = new Pagintion(sql, null, view.PageData).ToList<SystemInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/SystemList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
