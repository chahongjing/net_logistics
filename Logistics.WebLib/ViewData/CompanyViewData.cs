using BaseFrameWork.MVC;
using System.Collections.Generic;
using Logistics.Entity;

namespace Logistics.WebLib.ViewData
{
    public class CompanyListViewData : ListViewData<Company>
    {
    }
    public class CompanyDetailViewData : FormViewData<Company>
    {
        public List<KeyValueP> PayTypeList { get; set; }
        public List<KeyValueP> CompanyCharacterList { get; set; }
    }
}
