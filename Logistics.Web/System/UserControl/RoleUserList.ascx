<%@ Control Language="C#" Inherits="BaseUserControlView<System.Collections.Generic.List<UserInfo>>" %>
<table id="tblRoleList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 150px;">
                名称
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 100px;">
                部门
            </th>
            <th class="text-center" style="width: 100px;">
                公司
            </th>
            <th class="text-center" style="width: 100px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.UserInfo item in this.Model)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= item.UserGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(item.UserName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.UserCode)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.DepartmentName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.CompanyName)%>
            </td>
             <td>
                <% if (item.PermissionGuid.HasValue)
               { %><a href="javascript:void(0)" onclick="window.System.RoleToBusinessList.revokeUser('<%= item.UserGuid %>')"><i class="ace-icon fa fa-pencil green bigger-110" title="回收"></i>回收</a>
                <% }
                   else
                   { %>
                <a href="javascript:void(0)" onclick="window.System.RoleToBusinessList.grantUser('<%= item.UserGuid %>')"><i class="ace-icon fa fa-pencil green bigger-110" title="授权"></i>授权</a>
                <% } %>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
