using System.Collections.Generic;
using BaseFrameWork.Model;
using ToolSite.Entity;

namespace ToolSite.WebLib.ViewData
{
    public class NavigationListViewData
    {
        public List<Menu> menuList { get; set; }

        public List<Menu> menuListParents { get; set; }
        public List<Menu> menuListChildren { get; set; }

        public PaginationData pageDataParents { get; set; }

        public PaginationData pageDataChildren { get; set; }
    }
}
