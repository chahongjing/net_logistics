using System;
using BaseFrameWork;
using BaseFrameWork.MVC;
using ToolSite.WebLib.ViewData;
using ToolSite.BLL;
using ToolSite.Entity;

namespace ToolSite.WebLib.Controller
{
    public class UserInfoController
    {
        private UserInfoBLL bll = new UserInfoBLL();
        [PageAction("/System/UserList.aspx")]
        public String UserList()
        {
            UserListViewData ulvd = new UserListViewData();
            return PageViewHelper.LoadPage("/System/UserList.aspx", ulvd);
        }
        [PageAction("/System/UserDetail.aspx")]
        public String UserDetail(Guid oid)
        {
            UserDetailViewData udvd = new UserDetailViewData();
            if (oid == Guid.Empty)
            {
                udvd.Url = "/AjaxUser/Insert.cspx";
                udvd.user = new UserInfo();
                udvd.user.Sex = true;
                udvd.FormType = FormType.Add;
            }
            else
            {
                udvd.Url = "/AjaxUser/Update.cspx";
                udvd.user = bll.Retrieve(oid);
                udvd.FormType = FormType.Modify;
            }
            return PageViewHelper.LoadPage("/System/UserDetail.aspx", udvd);
        }
    }
}
