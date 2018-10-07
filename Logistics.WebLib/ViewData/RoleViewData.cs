using System.Collections.Generic;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using Logistics.Entity;
using System;

namespace Logistics.WebLib.ViewData
{
    public class RoleListViewData : ListViewData<RoleInfo>
    {
    }

    public class RoleDetailViewData : FormViewData<RoleInfo>
    {
    }

    public class RoleToBusinessListViewData
    {
        public ListViewData<Organization> listOrganization { get; set; }
        public ListViewData<UserInfo> listUserInfo { get; set; }

        public Guid RoleGuid { get; set; }

        public RoleToBusinessListViewData()
        {
            listOrganization = new ListViewData<Organization>();
            listUserInfo = new ListViewData<UserInfo>();
        }
    }

    public class RolePermissionListViewData: ListViewData<ActionInfo>
    {
        public List<SystemInfo> systemList { get; set; }

        public List<FunctionInfo> functionList { get; set; }

        public Guid RoleGuid { get; set; }
    }

    public class BusinessToRoleViewData : ListViewData<RoleInfo>
    {
        public Guid BusinessGuid { get; set; }
    }

    public class PermissionRoleListViewData :ListViewData<RoleInfo>
    {
        public Guid ActionGuid { get; set; }
    }
}
