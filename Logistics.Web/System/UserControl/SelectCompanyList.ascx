<%@ Control Language="C#" Inherits="BaseUserControlView<CompanyListViewData>" %>
<style>
        #tblList tr.selected
        {
            background-color: #dbfee6;
        }
</style>
<table id="tblList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
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
            <th class="text-center" style="width: 80px;">
                创建日期
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.Company entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.CompanyID %>" data-name="<%= entity.Name %>">
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
            <td class="text-center">
                <%= entity.CreatedOn.HasValue ? entity.CreatedOn.Value.ToString("yyyy-MM-dd HH:mm:ss") : string.Empty%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
