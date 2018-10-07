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
    /// 键值对
    /// </summary>
    public class AjaxKeyValueP
    {
        /// <summary>
        /// 键值对业务逻辑
        /// </summary>
        private KeyValuePBLL bll = new KeyValuePBLL();

        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(KeyValueP entity)
        {
            return bll.Insert(entity).ToString();
        }
        
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(KeyValueP entity)
        {
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(KeyValueP entity)
        {
            entity.Delete();
            return new AjaxResult(ResultStatus.OK) { Status = ResultStatus.OK };
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="pd">查询条件</param>
        /// <param name="code">代码</param>
        /// <returns></returns>
        [Action]
        public string Search(PaginationData pd, String code)
        {
            KeyValuePListViewData view = new KeyValuePListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.KeyValuePList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.[Name] AS ParentName
  FROM KeyValuePair AS A
  LEFT JOIN KeyValuePair AS B ON A.ParentGuid = B.ID
 WHERE A.[Group] = @Group
";
            view.List = new Pagintion(sql, new { Group = code }, view.PageData).ToList<KeyValueP>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/KeyValuePList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }
    }
}
