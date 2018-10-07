using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using System.Collections.Generic;
using Logistics.Entity;

namespace Logistics.WebLib.ViewData
{
    public class BusinessTypeDetailViewData : FormViewData<BusinessType>
    {
        public int type { get; set; }
    }

    public class BusinessTypeListViewData
    {
        public List<BusinessType> menuListParents { get; set; }
        public List<BusinessType> menuListChildren { get; set; }

        public PaginationData pageDataParents { get; set; }

        public PaginationData pageDataChildren { get; set; }
    }
}
