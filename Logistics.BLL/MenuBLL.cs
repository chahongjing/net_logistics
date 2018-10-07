using System;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class MenuBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(Menu entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.MenuGuid = (entity.MenuGuid == Guid.Empty ? Guid.NewGuid() : entity.MenuGuid);
            entity.IsSystem = false;
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
        public AjaxResult Update(Menu entity)
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
            Menu entity = new Menu();
            entity.MenuGuid = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public Menu Retrieve(Guid oid)
        {
            Menu entity = new Menu();
            entity.MenuGuid = oid;
            return (Menu)entity.Retrieve();
        }
    }
}
