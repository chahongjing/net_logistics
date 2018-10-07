using System;
using System.Collections.Generic;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    public class SystemInfoBLL
    {
        public AjaxResult Insert(SystemInfo entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.SystemGuid = (entity.SystemGuid == Guid.Empty ? Guid.NewGuid() : entity.SystemGuid);
            if (entity.Insert() == 1)
            {
                res.Status = ResultStatus.OK;
            }
            else
            {
                res.Status = ResultStatus.NO;
                res.Message = "新增失败!";
            }
            return res;
        }
        public AjaxResult Update(SystemInfo entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            if (entity.Update() == 1)
            {
                res.Status = ResultStatus.OK;
            }
            else
            {
                res.Status = ResultStatus.NO;
                res.Message = "更新失败!";
            }
            return res;
        }

        public List<SystemInfo> GetList()
        {
            SystemInfo entity = new SystemInfo();
            return entity.RetrieveList("1 = 1 ORDER BY CODE") as List<SystemInfo>;
        }

        public int Delete(Guid oid)
        {
            SystemInfo entity = new SystemInfo();
            entity.SystemGuid = oid;
            return entity.Delete();
        }
        public SystemInfo Retrieve(Guid oid)
        {
            SystemInfo entity = new SystemInfo();
            entity.SystemGuid = oid;
            return (SystemInfo)entity.Retrieve();
        }
    }
}
