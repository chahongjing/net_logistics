using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BaseFrameWork.MVC;
using Logistics.Entity;
using BaseFrameWork.DAL;
using System.Configuration;

namespace Logistics.BLL
{
    public class CustomerBLL
    {
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns></returns>
        public AjaxResult Insert(Customer entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.CreatedOn = DateTime.Now;
            entity.CreatedBy = UserInfoBLL.GetCurrentUserGuid();
            entity.SetDefaultValue("BirthDay");
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
        public AjaxResult Update(Customer entity)
        {
            AjaxResult res = new AjaxResult(ResultStatus.OK);
            entity.Valid();
            entity.SetDefaultValue("BirthDay");
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
            Customer entity = new Customer();
            entity.CustomerID = oid;
            return entity.Delete();
        }

        /// <summary>
        /// 查询信息
        /// </summary>
        /// <param name="oid">主键</param>
        /// <returns></returns>
        public Customer Retrieve(Guid oid)
        {
            Customer entity = new Customer();
            entity.CustomerID = oid;
            return (Customer)entity.Retrieve();
        }

        /// <summary>
        /// 获取提醒记录数
        /// </summary>
        /// <returns></returns>
        public static List<Customer> GetAlertCustomer()
        {
            string sql = @"SELECT A.*, B.Name AS CompanyName, C.Name AS BusinessTypeName, SUM(BidCost) OVER() AS TotalBidCost, SUM(SaleAmount) OVER() AS TotalSaleAmount,
       SUM(FactCost) OVER() AS TotalFactCost, SUM(Profit) OVER() AS TotalProfit, D.StepName, D.EstimateDate
  FROM dbo.Customer AS A
  LEFT JOIN dbo.Company AS B ON A.CompanyID = B.CompanyID
  LEFT JOIN dbo.BusinessType AS C ON A.BusinessType = C.TypeID
 OUTER APPLY (SELECT TOP 1 IA.ID AS StepID, IA.StepName, IA.EstimateDate
                FROM dbo.ProcessStep AS IA
               WHERE A.CustomerID = IA.CustomerID
                 AND IA.EstimateDate > GETDATE()
                 AND IA.EstimateDate < GETDATE() + @AlertDays
                 AND FinishDate IS NULL
               ORDER BY IA.EstimateDate, IA.CreatedOn) AS D
 WHERE D.StepID IS NOT NULL";
            using(DbConnectionScope cs = new DbConnectionScope())
            {
                return DbHelper.Db(sql, new { AlertDays = Convert.ToInt32(ConfigurationManager.AppSettings["AlertDays"]) }).ToList<Customer>();
            }
        }
    }
}
