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
    public class AjaxUser
    {
        /// <summary>
        /// 用户业务逻辑
        /// </summary>
        private UserInfoBLL bll = new UserInfoBLL();

        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Insert(UserInfo entity)
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                HttpPostedFile hpf = HttpContext.Current.Request.Files[0];
                string fileName = Guid.NewGuid().ToString().Replace("-", String.Empty) + Path.GetExtension(hpf.FileName);
                string filePath = Path.Combine(@"Image\Photo", fileName);
                hpf.SaveAs(Path.Combine(HttpRuntime.AppDomainAppPath, filePath));
                entity.Photo = @"/" + filePath.Replace(@"\", "/");
            }
            return bll.Insert(entity).ToString();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public string Update(UserInfo entity)
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                HttpPostedFile hpf = HttpContext.Current.Request.Files[0];
                string fileName = Guid.NewGuid().ToString().Replace("-", String.Empty) + Path.GetExtension(hpf.FileName);
                string filePath = Path.Combine(@"Image\Photo", fileName);
                hpf.SaveAs(Path.Combine(HttpRuntime.AppDomainAppPath, filePath));
                entity.Photo = @"/" + filePath.Replace(@"\", "/");
            }
            return entity.Update().ToString();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        [Action]
        public AjaxResult Delete(UserInfo entity)
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
            UserListViewData view = new UserListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = pd.PageIndex;
            view.PageData.PageSize = pd.PageSize;
            view.PageData.PagintionJsFunction = "window.System.UserList.search()";
            view.PageData.OrderBy = pd.OrderBy;

            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS DepartmentName
  FROM dbo.UserInfo AS A
  LEFT JOIN dbo.Organization AS B ON A.CompanyGuid = B.UnitGuid
  LEFT JOIN dbo.Organization AS C ON A.DepartmentGuid = C.UnitGuid";
            view.List = new Pagintion(sql, null, view.PageData).ToList<UserInfo>();

            string table = UserControlExcutor.RenderUserControl("/System/UserControl/UserList.ascx", view);
            string pagination = UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", view.PageData);
            return JsonHelper.ToJson(new { table = table, pagination = pagination });
        }

        [Action]
        public string TestForm(UserInfo entity, string dat)
        {
            List<TestObj> list = JsonHelper.JsonTo<List<TestObj>>(dat);
            return string.Empty;
        }
    }

    public class TestObj
    {
        public string Remark { get; set; }
        public int Sex { get; set; }
        public string Interest { get; set; }
    }
}
