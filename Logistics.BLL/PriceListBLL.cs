using System;
using System.Web;
using BaseFrameWork.MVC;
using Logistics.Entity;

namespace Logistics.BLL
{
    /// <summary>
    /// 用户
    /// </summary>
    public class PriceListBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(PriceList entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.ListID = (entity.ListID == Guid.Empty ? Guid.NewGuid() : entity.ListID);
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
        public AjaxResult Update(PriceList entity)
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
            PriceList entity = new PriceList();
            entity.ListID = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public PriceList Retrieve(Guid oid)
        {
            PriceList entity = new PriceList();
            entity.ListID = oid;
            return (PriceList)entity.Retrieve();
        }
    }
}
