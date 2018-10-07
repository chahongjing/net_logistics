using BaseFrameWork.MVC;
using System.Collections.Generic;
using Logistics.Entity;

namespace Logistics.WebLib.ViewData
{
    public class PriceDetailViewData : FormViewData<PriceList>
    {
        public List<KeyValueP> TypeList { get; set; }
    }

    public class PriceListViewData : ListViewData<PriceList>
    {
        public double Amount { get; set; }
        public string Type { get; set; }
    }
}
