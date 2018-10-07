using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    public class AgentCompanyBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(AgentCompany entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.AgentID = (entity.AgentID == Guid.Empty ? Guid.NewGuid() : entity.AgentID);
            entity.Valid();
            entity.CreatedOn = DateTime.Now;
            entity.CreatedBy = UserInfoBLL.GetCurrentUserGuid();
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

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Update(AgentCompany entity)
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

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public int Delete(Guid oid)
        {
            AgentCompany entity = new AgentCompany();
            entity.AgentID = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public AgentCompany Retrieve(Guid oid)
        {
            AgentCompany entity = new AgentCompany();
            entity.AgentID = oid;
            return (AgentCompany)entity.Retrieve();
        }
    }
}
