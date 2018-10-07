using System;
using BaseFrameWork.MVC;
using Logistics.Entity;
using System.Collections.Generic;

namespace Logistics.BLL
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class BusinessTypeBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(BusinessType entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.TypeID = (entity.TypeID == Guid.Empty ? Guid.NewGuid() : entity.TypeID);
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
        public AjaxResult Update(BusinessType entity)
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
            BusinessType entity = new BusinessType();
            entity.TypeID = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public BusinessType Retrieve(Guid oid)
        {
            BusinessType entity = new BusinessType();
            entity.TypeID = oid;
            return (BusinessType)entity.Retrieve();
        }
        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public List<BusinessType> RetrieveList(string filter)
        {
            return new BusinessType().RetrieveList(filter) as List<BusinessType>;
        }
    }
}
