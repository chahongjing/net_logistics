using BaseFrameWork.MVC;
using BaseFrameWork.Tool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Logistics.BLL;
using Logistics.Entity;
using Logistics.WebLib.ViewData;

namespace Logistics.WebLib.Controller
{
    public class PriceController
    {
        /// <summary>
        /// 用户逻辑
        /// </summary>
        private PriceListBLL bll = new PriceListBLL();

        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/PriceList.aspx")]
        public String PriceList()
        {
            PriceListViewData view = new PriceListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.PriceList.search()";
            view.PageData.OrderBy = "StartPlace, DestinationPlace, InterimPlace, Type, LuggageAmount";

            string sql = @"SELECT * FROM dbo.PriceList";
            view.List = new Pagintion(sql, null, view.PageData).ToList<PriceList>();

            return PageViewHelper.LoadPage("/System/PriceList.aspx", view);
        }

        /// <summary>
        /// 用户详情
        /// </summary>
        /// <param name="oid">记录主键</param>
        /// <returns></returns>
        [PageAction("/System/PriceDetail.aspx")]
        public String PriceDetail(Guid oid)
        {
            PriceDetailViewData view = new PriceDetailViewData();
            if (oid == Guid.Empty)
            {
                view.Url = "/AjaxPrice/Insert.cspx";
                view.Entity = new PriceList();
            }
            else
            {
                view.Url = "/AjaxPrice/Update.cspx";
                view.Entity = bll.Retrieve(oid);
                view.FormType = FormType.Modify;
            }
            view.TypeList = new KeyValueP().RetrieveList("[KeyValuePair].[Group] = 'UnitType'") as List<KeyValueP>;
            return PageViewHelper.LoadPage("/System/PriceDetail.aspx", view);
        }

        /// <summary>
        /// 用户列表
        /// </summary>
        /// <returns></returns>
        [PageAction("/System/SelectPrice.aspx")]
        public String SelectPrice(double amount, string type)
        {
            PriceListViewData view = new PriceListViewData();
            view.PageData = new BaseFrameWork.Model.PaginationData();
            view.PageData.PageIndex = 1;
            view.PageData.PageSize = 10;
            view.PageData.PagintionJsFunction = "window.System.SelectPrice.search()";
            view.PageData.OrderBy = "StartPlace, DestinationPlace, InterimPlace, Type, LuggageAmount";

            view.Amount = amount;
            view.Type = type;
            string sql = @"SELECT * FROM dbo.PriceList WHERE LuggageAmount= @Amount AND [Type] = @Type";
            view.List = new Pagintion(sql, new { Amount = amount, Type = type }, view.PageData).ToList<PriceList>();

            return PageViewHelper.LoadPage("/System/SelectPrice.aspx", view);
        }
    }
}
