using BaseFrameWork.MVC;
using System.Collections.Generic;
using Logistics.Entity;

namespace Logistics.WebLib.ViewData
{
    public class AgentCompanyListViewData : ListViewData<AgentCompany>
    {
    }
    public class AgentCompanyDetailViewData : FormViewData<AgentCompany>
    {
        public List<KeyValueP> CompanyCharacterList { get; set; }
    }
}
