using System;
using System.IO;
using System.Web;
using BaseFrameWork.Model;
using BaseFrameWork.MVC;
using BaseFrameWork.Serialize;
using BaseFrameWork.Tool;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;

namespace Logistics.WebLib.Service
{
    /// <summary>
    /// 数据库
    /// </summary>
    public class AjaxToolHtml
    {
        /// <summary>
        /// 获取表信息
        /// </summary>
        /// <param name="TableName"></param>
        /// <param name="DataSource"></param>
        /// <param name="DbName"></param>
        /// <param name="UserId"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        [Action]
        public string GetClassInfo(string TableName, string DataSource, string DbName, string UserId, string Password)
        {
            return ToolsBusiness.GetClassInfo(TableName, DataSource, DbName, UserId, Password);
        }
        [Action]
        public AjaxResult GetGuid()
        {
            return new AjaxResult(ResultStatus.OK, "", Guid.NewGuid().ToString());
        }
    }
}
