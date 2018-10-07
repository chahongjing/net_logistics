using System;
using System.Web.Security;
using BaseFrameWork;
using BaseFrameWork.MVC;
using Logistics.WebLib.ViewData;

namespace Logistics.WebLib.Controller
{
    /// <summary>
    /// 登录
    /// </summary>
    public class LoginController
    {
        /// <summary>
        /// 登录
        /// </summary>
        /// <returns></returns>
        [PageAction("/Login.aspx")]
        public static String Login()
        {
            LoginViewData view = new LoginViewData();
            view.RedirectUrl = FormsAuthentication.GetRedirectUrl(String.Empty, true);
            return PageViewHelper.LoadPage("/Login.aspx", view);
        }
        /// <summary>
        /// bootstrap页面登录
        /// </summary>
        /// <returns></returns>
        [PageAction("/LoginBootStrap.aspx")]
        public static String LoginBootStrap()
        {
            LoginViewData view = new LoginViewData();
            view.RedirectUrl = FormsAuthentication.GetRedirectUrl(String.Empty, true);
            return PageViewHelper.LoadPage("/LoginBootStrap.aspx", view);
        }
    }
}
