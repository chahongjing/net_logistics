using System;
using System.Web;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    /// <summary>
    /// 用户
    /// </summary>
    public class UserInfoBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(UserInfo entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.UserGuid = (entity.UserGuid == Guid.Empty ? Guid.NewGuid() : entity.UserGuid);
            if (entity.Insert() == 1)
            {
                res.Status = ResultStatus.OK;
            }
            else
            {
                res.Status = ResultStatus.NO;
                res.Message = "新增失败!";
            }
            return res;
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Update(UserInfo entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            if (entity.Update() == 1)
            {
                res.Status = ResultStatus.OK;
            }
            else
            {
                res.Status = ResultStatus.NO;
                res.Message = "更新失败!";
            }
            return res;
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public int Delete(Guid oid)
        {
            UserInfo entity = new UserInfo();
            entity.UserGuid = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public UserInfo Retrieve(Guid oid)
        {
            UserInfo entity = new UserInfo();
            entity.UserGuid = oid;
            return (UserInfo)entity.Retrieve();
        }

        /// <summary>
        /// 获取当前用户
        /// </summary>
        /// <returns></returns>
        public static UserInfo GetCurrentUser()
        {
            UserInfo ui;
            string userCode;
            if (HttpContext.Current.User != null)
            {
                userCode = HttpContext.Current.User.Identity.Name;
                ui = HttpRuntime.Cache.Get(userCode) as UserInfo;
                if (ui != null)
                {
                    return ui;
                }
                ui = (UserInfo)new UserInfo().Retrieve(new { UserCode = userCode }, "UserInfo.UserCode = @UserCode");
                if (ui != null)
                {
                    HttpRuntime.Cache.Insert(userCode, ui);
                    return ui;
                }
            }
            return null;
        }

        /// <summary>
        /// 获取当前用户Guid
        /// </summary>
        /// <returns></returns>
        public static Guid GetCurrentUserGuid()
        {
            UserInfo ui = GetCurrentUser();
            if(ui == null)
            {
                throw new Exception("用户超时!请重新登录!");
            }
            return ui.UserGuid;
        }
    }
}
