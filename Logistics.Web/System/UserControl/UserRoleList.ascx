<%@ Control Language="C#" Inherits="BaseUserControlView<System.Collections.Generic.List<RoleInfo>>" %>
<table id="tblUserList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
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
            <th class="text-center" style="width: 100px;">
                组织级
            </th>
            <th class="text-center" style="width: 50px;">
                用户级
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.RoleInfo item in this.Model)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= item.RoleGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(item.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.Code)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.Remark)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.OrganizationName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.UserName)%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
