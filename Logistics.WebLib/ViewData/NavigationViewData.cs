using BaseFrameWork.MVC;
using Logistics.Entity;
using System.Collections.Generic;
using BaseFrameWork.Model;

namespace Logistics.WebLib.ViewData
{
    public class NavigationDetailViewData : FormViewData<Menu>
    {
        public int type { get; set; }
    }

    public class NavigationListViewData
    {
        public List<Menu> menuListParents { get; set; }
        public List<Menu> menuListChildren { get; set; }

        public PaginationData pageDataParents { get; set; }

        public PaginationData pageDataChildren { get; set; }
    }
}
