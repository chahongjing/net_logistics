using System.Collections.Generic;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using Logistics.Entity;
using System;

namespace Logistics.WebLib.ViewData
{
    public class OrganizationDetailViewData : FormViewData<Organization>
    {
    }

    public class OrganizationListViewData : ListViewData<Organization>
    {
        public string treeList { get; set; }
        public string treeTitle { get; set; }
    }
}
