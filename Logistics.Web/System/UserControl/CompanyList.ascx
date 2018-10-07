<%@ Control Language="C#" Inherits="BaseUserControlView<CompanyListViewData>" %>
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
<table id="tblCompanyList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 80px;">
                公司名称
            </th>
            <th class="text-center" style="width: 100px;">
                地址
            </th>
            <th class="text-center" style="width: 50px;">
                性质
            </th>
            <th class="text-center" style="width: 50px;">
                支付方式
            </th>
            <th class="text-center" style="width: 50px;">
                联系人
            </th>
            <th class="text-center" style="width: 50px;">
                现有日本人数
            </th>
            <th class="text-center" style="width: 60px;">
                处理完成客户数量
            </th>
            <th class="text-center" style="width: 50px;">
                处理中客户数量
            </th>
            <th class="text-center" style="width: 40px;">
                创建日期
            </th>
            <th class="text-center" style="width: 50px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.Company entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.CompanyID %>">
            <td>
                <%= HttpUtility.HtmlEncode(entity.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Address)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.CompanyCharacterName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.PayTypeName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Contact)%>
            </td>
            <td class="text-right">
                <%= entity.Japanese%>
            </td>
            <td class="text-right">
                <%= entity.Finished%>
            </td>
            <td class="text-right">
                <%= entity.Processing%>
            </td>
            <td class="text-center">
                <%= entity.CreatedOn.HasValue ? entity.CreatedOn.Value.ToString("yyyy-MM-dd") : string.Empty%>
            </td>
            <td class="text-center icon">
                <i class="ace-icon fa fa-pencil green bigger-110" title="编辑" onclick="window.System.CompanyList.edit(this)">
                </i><i class="ace-icon fa fa-trash-o bigger-110 orange" title="删除" onclick="window.System.CompanyList.deleteRecord(this)">
                </i><i class="hide ace-icon fa fa-check green bigger-110"></i><i class="hide ace-icon fa fa-times red2 bigger-110">
                </i><i class="hide ace-icon fa fa-floppy-o bigger-110 blue"></i>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
