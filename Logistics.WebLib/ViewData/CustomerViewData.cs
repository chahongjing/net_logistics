using BaseFrameWork.MVC;
using System.Collections.Generic;
using Logistics.Entity;

namespace Logistics.WebLib.ViewData
{
    public class CustomerListViewData : ListViewData<Customer>
    {
    }
    public class CustomerDetailViewData : FormViewData<Customer>
    {
        public List<KeyValueP> LuggageUnitList { get; set; }

        public List<ProcessStep> StepList { get; set; }
    }
}
