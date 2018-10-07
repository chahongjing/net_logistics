using System;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using BaseFrameWork.User;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class AjaxMenu
    {
        /// <summary>
        /// 菜单业务逻辑
        /// </summary>
        private MenuBLL bll = new MenuBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(Menu entity)
        {
            entity.CreatedBy = UserManager.GetCurrentUserGuid();
            entity.CreatedOn = DateTime.Now;
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(Menu entity)
        {
            entity.ModifiedBy = UserManager.GetCurrentUserGuid();
            entity.ModifiedOn = DateTime.Now;
            return bll.Update(entity).ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(Menu entity)
        {
            entity.Delete();
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }
        /// <summary>
        /// 一级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string FirstSearch(PaginationData pd)
        {
            NavigationListViewData view = new NavigationListViewData();
            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = pd.PageIndex;
            view.pageDataParents.PageSize = pd.PageSize;
            view.pageDataParents.PagintionJsFunction = "window.System.NavigationList.firstSearch()";
            view.pageDataParents.OrderBy = pd.OrderBy;

            string sql = "select * from dbo.Menu where ParentGuid IS NULL";
            view.menuListParents = new Pagintion(sql, null, view.pageDataParents).ToList<Menu>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/NavigationListFirst.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.pageDataParents);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 二级分类查询
        /// </summary>
        /// <param name="parentGuid">低级主键</param>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SecondSearch(Guid parentGuid, PaginationData pd)
        {
            NavigationListViewData view = new NavigationListViewData();
            view.pageDataChildren = new BaseFrameWork.Model.PaginationData();
            view.pageDataChildren.PageIndex = pd.PageIndex;
            view.pageDataChildren.PageSize = pd.PageSize;
            view.pageDataChildren.PagintionJsFunction = "window.System.NavigationList.secondSearch()";
            view.pageDataChildren.OrderBy = pd.OrderBy;

            string sql = "select A.*, B.Name AS ParentName from dbo.Menu AS A INNER JOIN dbo.Menu AS B ON A.ParentGuid = B.MenuGuid where A.ParentGuid = @ParentGuid";
            view.menuListChildren = new Pagintion(sql, new { ParentGuid = parentGuid }, view.pageDataChildren).ToList<Menu>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/NavigationListSecond.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.pageDataChildren);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
