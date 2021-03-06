﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    public class ProcessStepBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(ProcessStep entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.StepID = (entity.StepID == Guid.Empty ? Guid.NewGuid() : entity.StepID);
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
        public AjaxResult Update(ProcessStep entity)
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
            ProcessStep entity = new ProcessStep();
            entity.StepID = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public ProcessStep Retrieve(Guid oid)
        {
            ProcessStep entity = new ProcessStep();
            entity.StepID = oid;
            return (ProcessStep)entity.Retrieve();
        }
        /// <summary>
        /// 获取键值对列表
        /// </summary>
        /// <param name="filter">过滤条件</param>
        /// <returns></returns>
        public List<ProcessStep> RetrieveList(string filter)
        {
            ProcessStep entity = new ProcessStep();
            return entity.RetrieveList(filter) as List<ProcessStep>;
        }
    }
}
