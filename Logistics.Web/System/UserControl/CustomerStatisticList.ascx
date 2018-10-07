<%@ Control Language="C#" Inherits="BaseUserControlView<CustomerListViewData>" %>
<%@ Import Namespace="System.Linq" %>
<style>
    .female
    {
        color: #CC66FF;
    }
    i
    {
        cursor: pointer;
        margin-left: 5px;
        margin-right: 5px;
    }        /*  宽度  */
.w30{width:30px;}.w50{width:50px;}.w70{width:70px;}.w80{width:80px;}.w90{width:90px;}
.w100{width:100px;} .w150{width:150px;} .w160{width:160px;} .w170{width:170px;} .w180{width:180px;} .w179{width:179px;} .w200{width:200px;}
.w210{width:210px;} .w220{width:220px;} .w230{width:230px;} .w245{width:245px;} .w250{width:250px;} .w300{width:300px;} .w320{width:320px;} 
.w323{width:323px;} .w330{width:330px;} .w344{width:344px;} .w345{width:345px;} .w350{width:350px;} .w400{width:400px;} .w450{width:450px;} .w480{width:480px;}.w500{width:500px;}
.w550{width:550px;} .w600{width:600px;} .w650{width:650px;} .w700{width:700px;} .w750{width:750px;} .w800{width:800px;} .w850{width:850px;}
.w860{width:860px;} .w861{width:861px;} .w862{width:862px;} .w900{width:900px;} .w950{width:950px;} .w1000{width:1000px;} .w1050{width:1050px;}
</style>
<table id="tblCustomerList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top" data-TotalBidCost="<%= ((this.Model.List.Count > 0 ? this.Model.List.First().TotalBidCost: 0) ?? 0).ToString("#,##0.00") %>"
    data-TotalSaleAmount="<%= ((this.Model.List.Count > 0 ? this.Model.List.First().TotalSaleAmount: 0) ?? 0).ToString("#,##0.00") %>"
    data-TotalFactCost="<%= ((this.Model.List.Count > 0 ? this.Model.List.First().TotalFactCost: 0) ?? 0).ToString("#,##0.00") %>"
    data-TotalProfit="<%= ((this.Model.List.Count > 0 ? this.Model.List.First().TotalProfit: 0) ?? 0).ToString("#,##0.00") %>">
    <thead>
        <tr>
            <th class="text-center w150">
                客户名称
            </th>
            <th class="text-center w100">
                所属公司
            </th>
            <th class="text-center w150">
                业务类型
            </th>
            <th class="text-center w80">
                报价
            </th>
            <th class="text-center w80">
                销售额
            </th>
            <th class="text-center w80">
                成本
            </th>
            <th class="text-center w80">
                利润
            </th>
            <th class="text-center w80">
                联系电话
            </th>
            <th class="text-center w90">
                起运地
            </th>
            <th class="text-center w90">
                目的地
            </th>
            <th class="text-center w50">
                评价
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.Customer entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.CustomerID %>">
            <td class="w150">
                <%= HttpUtility.HtmlEncode(entity.Name)%>
            </td>
            <td class="w100">
                <%= HttpUtility.HtmlEncode(entity.CompanyName)%>
            </td>
            <td class="w150">
                <%= HttpUtility.HtmlEncode(entity.BusinessTypeName)%>
            </td>
            <td class="w80 text-right">
                <%= (entity.BidCost??0).ToString("#,##0.00")%>
            </td>
            <td class="w80 text-right">
                <%= (entity.SaleAmount??0).ToString("#,##0.00")%>
            </td>
            <td class="w80 text-right">
                <%= (entity.FactCost??0).ToString("#,##0.00")%>
            </td>
            <td class="w80 text-right">
                <%= (entity.Profit??0).ToString("#,##0.00")%>
            </td>
            <td class="w80">
                <%= HttpUtility.HtmlEncode(entity.Phone)%>
            </td>
            <td class="w90">
                <%= HttpUtility.HtmlEncode(entity.StartPlace)%>
            </td>
            <td class="w90">
                <%= HttpUtility.HtmlEncode(entity.DestinationPlace)%>
            </td>
            <td class="text-center w50">
                <%= HttpUtility.HtmlEncode(entity.Comment)%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
