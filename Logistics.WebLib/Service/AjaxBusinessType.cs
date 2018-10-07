using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using BaseFrameWork.User;
using System;
using System.Collections.Generic;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;
using BaseCommon.Serialize;

namespace Logistics.WebLib.Service
{
    public class AjaxBusinessType
    {
        /// <summary>
        /// 菜单业务逻辑
        /// </summary>
        private BusinessTypeBLL bll = new BusinessTypeBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(BusinessType entity)
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
        public string Update(BusinessType entity)
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
        public AjaxResult Delete(BusinessType entity)
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
            BusinessTypeListViewData view = new BusinessTypeListViewData();
            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = pd.PageIndex;
            view.pageDataParents.PageSize = pd.PageSize;
            view.pageDataParents.PagintionJsFunction = "window.System.BusinessTypeList.firstSearch()";
            view.pageDataParents.OrderBy = pd.OrderBy;

            string sql = "SELECT * FROM BusinessType WHERE ParentID IS NULL";
            view.menuListParents = new Pagintion(sql, null, view.pageDataParents).ToList<BusinessType>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/BusinessTypeListFirst.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.pageDataParents);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        /// <summary>
        /// 二级分类查询
        /// </summary>
        /// <param name="parentID">低级主键</param>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SecondSearch(Guid parentID, PaginationData pd)
        {
            BusinessTypeListViewData view = new BusinessTypeListViewData();
            view.pageDataChildren = new BaseFrameWork.Model.PaginationData();
            view.pageDataChildren.PageIndex = pd.PageIndex;
            view.pageDataChildren.PageSize = pd.PageSize;
            view.pageDataChildren.PagintionJsFunction = "window.System.BusinessTypeList.secondSearch()";
            view.pageDataChildren.OrderBy = pd.OrderBy;

            string sql = "SELECT A.*, B.[Name] AS ParentName FROM BusinessType AS A INNER JOIN BusinessType AS B ON A.ParentID = B.TypeID WHERE B.TypeID = @TypeID";
            view.menuListChildren = new Pagintion(sql, new { TypeID = parentID }, view.pageDataChildren).ToList<BusinessType>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/BusinessTypeListSecond.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.pageDataChildren);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        [Action]
        public AjaxResult<List<BusinessType>> RetrieveList(Guid parentID)
        {
            AjaxResult<List<BusinessType>> result = new AjaxResult<List<BusinessType>>(ResultStatus.OK);
            result.Value = bll.RetrieveList("[BusinessType].[ParentID] = '" + parentID.ToString() + "'");
            return result;
        }
        /// <summary>
        /// 一级分类查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <returns></returns>
        [Action]
        public string SelectSearch(SearchKeyPaginationData pd)
        {
            BusinessTypeListViewData view = new BusinessTypeListViewData();
            view.pageDataParents = new BaseFrameWork.Model.PaginationData();
            view.pageDataParents.PageIndex = pd.PageIndex;
            view.pageDataParents.PageSize = pd.PageSize;
            view.pageDataParents.PagintionJsFunction = "window.System.SelectBusinessType.search()";
            view.pageDataParents.OrderBy = pd.OrderBy;

            string sql = "SELECT * FROM BusinessType WHERE ParentID IS NULL AND Name LIKE '%' + @key + '%'";
            view.menuListParents = new Pagintion(sql, new { key = pd.SearchKey }, view.pageDataParents).ToList<BusinessType>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/SelectBusinessType.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.pageDataParents);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
