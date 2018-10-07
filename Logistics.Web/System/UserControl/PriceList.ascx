<%@ Control Language="C#" Inherits="BaseUserControlView<PriceListViewData>" %>
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
    }
</style>
<table id="tblList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 80px;">
                出发地
            </th>
            <th class="text-center" style="width: 80px;">
                目的地
            </th>
            <th class="text-center" style="width: 80px;">
                中转地
            </th>
            <th class="text-center" style="width: 60px;">
                行李量
            </th>
            <th class="text-center" style="width: 60px;">
                称重类型
            </th>
            <th class="text-center" style="width: 60px;">
                费用1
            </th>
            <th class="text-center" style="width: 60px;">
                费用2
            </th>
            <th class="text-center" style="width: 60px;">
                费用3
            </th>
            <th class="text-center" style="width: 100px;">
                备注
            </th>
            <th class="text-center" style="width: 50px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.PriceList entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.ListID %>">
            <td>
                <%= HttpUtility.HtmlEncode(entity.StartPlace)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.DestinationPlace)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.InterimPlace)%>
            </td>
            <td class="text-right">
                <%= entity.LuggageAmount.HasValue ? entity.LuggageAmount.Value.ToString("#,##0.00") : string.Empty%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Type)%>
            </td>
            <td class="text-right">
                <%= entity.CostOne.HasValue ? entity.CostOne.Value.ToString("#,##0.00") : string.Empty%>
            </td>
            <td class="text-right">
                <%= entity.CostTwo.HasValue ? entity.CostTwo.Value.ToString("#,##0.00") : string.Empty%>
            </td>
            <td class="text-right">
                <%= entity.CostThree.HasValue ? entity.CostThree.Value.ToString("#,##0.00") : string.Empty%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Memo) %>
            </td>
            <td class="text-center icon">
                <i class="ace-icon fa fa-pencil green bigger-110" title="编辑" onclick="window.System.PriceList.edit(this)">
                </i><i class="ace-icon fa fa-trash-o bigger-110 orange" title="删除" onclick="window.System.PriceList.deleteRecord(this)">
                </i><i class="hide ace-icon fa fa-check green bigger-110"></i><i class="hide ace-icon fa fa-times red2 bigger-110">
                </i><i class="hide ace-icon fa fa-floppy-o bigger-110 blue"></i>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
