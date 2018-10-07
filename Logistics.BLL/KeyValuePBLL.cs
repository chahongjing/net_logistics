using System;
using BaseFrameWork.MVC;
using Logistics.Entity;
using System.Collections.Generic;

namespace Logistics.BLL
{
    /// <summary>
    /// 键值对
    /// </summary>
    public class KeyValuePBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(KeyValueP entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.ID = (entity.ID == Guid.Empty ? Guid.NewGuid() : entity.ID);
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
        public AjaxResult Update(KeyValueP entity)
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
            KeyValueP entity = new KeyValueP();
            entity.ID = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public KeyValueP Retrieve(Guid oid)
        {
            KeyValueP entity = new KeyValueP();
            entity.ID = oid;
            return (KeyValueP)entity.Retrieve();
        }

        /// <summary>
        /// 获取键值对列表
        /// </summary>
        /// <param name="filter">过滤条件</param>
        /// <returns></returns>
        public List<KeyValueP> RetrieveList(string filter) 
        {
            KeyValueP entity = new KeyValueP();
            return entity.RetrieveList(filter) as List<KeyValueP>;
        }
    }
}
