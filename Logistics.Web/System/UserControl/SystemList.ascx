<%@ Control Language="C#" Inherits="BaseUserControlView<SystemListViewData>" %>
<table id="tblSystemList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 150px;">
                名称
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 50px;">
                备注
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.SystemInfo system in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= system.SystemGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(system.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(system.Code)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(system.Remark)%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
