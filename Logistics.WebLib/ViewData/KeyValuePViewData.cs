using System.Collections.Generic;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.WebLib.ViewData
{
    public class KeyValuePListViewData : ListViewData<KeyValueP>
    {
        public string Code { get; set; }
    }

    public class KeyValuePDetailViewData : FormViewData<KeyValueP>
    {
    }
}
