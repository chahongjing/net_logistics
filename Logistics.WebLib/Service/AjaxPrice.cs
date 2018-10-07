using System;
using System.IO;
using System.Web;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using System.Collections.Generic;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 用户
    /// </summary>
    public class AjaxPrice
    {
        /// <summary>
        /// 用户业务逻辑
        /// </summary>
        private PriceListBLL bll = new PriceListBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(PriceList entity)
        {
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(PriceList entity)
        {
            entity.ModifiedOn = DateTime.Now;
            entity.ModifiedBy = UserInfoBLL.GetCurrentUserGuid();
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(PriceList entity)
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
            PriceListViewData view = new PriceListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.PriceList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT * FROM dbo.PriceList";
            view.List = new Pagintion(sql, null, view.PageData).ToList<PriceList>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/PriceList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SelectSearch(SearchKeyPaginationData pd)
        {
            PriceListViewData view = new PriceListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.SelectPrice.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT * FROM dbo.PriceList WHERE StartPlace LIKE '%' + @Place + '%' OR DestinationPlace LIKE '%' + @Place + '%' OR InterimPlace LIKE '%' + @Place + '%'";
            view.List = new Pagintion(sql, new { Place = pd.SearchKey }, view.PageData).ToList<PriceList>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/SelectPrice.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
