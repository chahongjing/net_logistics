using System;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    /// <summary>
    /// 功能点
    /// </summary>
    public class RoleToPermissionBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(RoleToPermission entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.RoleToPermissionGuid = (entity.RoleToPermissionGuid == Guid.Empty ? Guid.NewGuid() : entity.RoleToPermissionGuid);
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
        public AjaxResult Update(RoleToPermission entity)
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
            RoleToPermission entity = new RoleToPermission();
            entity.RoleToPermissionGuid = oid;
            return entity.Delete();
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public int DeleteRolePermission(RoleToPermission entity)
        {
            return entity.Delete(string.Format("RoleGuid = '{0}' AND ActionGuid = '{1}'", entity.RoleGuid, entity.ActionGuid));
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public RoleToPermission Retrieve(Guid oid)
        {
            RoleToPermission entity = new RoleToPermission();
            entity.RoleToPermissionGuid = oid;
            return (RoleToPermission)entity.Retrieve();
        }
    }
}
