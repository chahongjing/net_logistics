using System;
using System.Collections.Generic;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    /// <summary>
    /// 模块
    /// </summary>
    public class FunctionInfoBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public AjaxResult Insert(FunctionInfo entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.FunctionGuid = (entity.FunctionGuid == Guid.Empty ? Guid.NewGuid() : entity.FunctionGuid);
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
        public AjaxResult Update(FunctionInfo entity)
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
            FunctionInfo entity = new FunctionInfo();
            entity.FunctionGuid = oid;
            return entity.Delete();
        }
        public List<FunctionInfo> GetList()
        {
            FunctionInfo entity = new FunctionInfo();
            return entity.RetrieveList("1 = 1 ORDER BY CODE") as List<FunctionInfo>;
        }
        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public FunctionInfo Retrieve(Guid oid)
        {
            FunctionInfo entity = new FunctionInfo();
            entity.FunctionGuid = oid;
            return (FunctionInfo)entity.Retrieve();
        }
    }
}
