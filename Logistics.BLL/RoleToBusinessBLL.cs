using System;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    /// <summary>
    /// 角色业务对象
    /// </summary>
    public class RoleToBusinessBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(RoleToBusiness entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.RoleToBusinessGuid = (entity.RoleToBusinessGuid == Guid.Empty ? Guid.NewGuid() : entity.RoleToBusinessGuid);
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
        public AjaxResult Update(RoleToBusiness entity)
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
            RoleToBusiness entity = new RoleToBusiness();
            entity.RoleToBusinessGuid = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="roleGuid">角色主键</param>
        /// <param name="businessGuid">业务主键</param>
        /// <returns></returns>
        public int DeleteRoleBusiness(RoleToBusiness entity)
        {
            return entity.Delete(string.Format("RoleGuid = '{0}' AND BusinessGuid = '{1}'", entity.RoleGuid, entity.BusinessGuid));
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public RoleToBusiness Retrieve(Guid oid)
        {
            RoleToBusiness entity = new RoleToBusiness();
            entity.RoleToBusinessGuid = oid;
            return (RoleToBusiness)entity.Retrieve();
        }
    }
}
