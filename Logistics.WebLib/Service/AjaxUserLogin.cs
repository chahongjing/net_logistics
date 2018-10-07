using BaseFrameWork.Module;
using BaseFrameWork.MVC;
using BaseFrameWork.Security;
using Logistics.Entity;

namespace Logistics.WebLib.Service
{
    public class AjaxUserLogin
    {
        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <returns></returns>
        public static AjaxResult Login(UserInfo entity)
        {
            AjaxResult result = new AjaxResult(ResultStatus.OK);
            UserInfo ui = (UserInfo)new UserInfo().Retrieve(new { UserCode = entity.UserCode }, "UserInfo.UserCode = @UserCode");
            if (ui != null)
            {
                //if (ui.Password == Utility.GetMD5(user.Password))
                if (ui.Password == entity.Password)
                {
                    FormLoginModule.SignIn(ui.UserCode, ui);
                    result.Status = ResultStatus.OK;
                }
                else
                {
                    result.Status = ResultStatus.NO;
                    result.Message = "密码错误:" + entity.Password + ".";
                }
            }
            else
            {
                result.Status = ResultStatus.NO;
                result.Message = "未找到用户:" + entity.UserCode + ".";
            }
            
            return result;
        }

        /// <summary>
        /// 注销
        /// </summary>
        /// <returns></returns>
        [Permission("0D20F56C-A24E-4B0C-8046-6D9340BE6FF8", "1", "2", "OH, NO! ERROR!")]
        public static AjaxResult Logout()
        {
            FormLoginModule.SignOut();
            return new AjaxResult(ResultStatus.OK);
        }
    }
}
