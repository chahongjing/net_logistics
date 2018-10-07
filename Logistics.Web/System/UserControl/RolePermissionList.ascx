<%@ Control Language="C#" Inherits="BaseUserControlView<System.Collections.Generic.List<ActionInfo>>" %>

<table id="tblList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 150px;">
                名称
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 100px;">
                模块
            </th>
            <th class="text-center" style="width: 100px;">
                系统
            </th>
            <th class="text-center" style="width: 50px;">
                备注
            </th>
            <th class="text-center" style="width: 50px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.ActionInfo item in this.Model)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= item.ActionGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(item.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.Code)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.FunctionName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.SystemName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.Remark)%>
            </td>
            <td>
                <% if (item.PermissionGuid.HasValue)
               { %><a href="javascript:void(0)" onclick="window.System.RoleToPermissionList.revokePermission('<%= item.ActionGuid %>')"><i class="ace-icon fa fa-pencil green bigger-110" title="回收"></i>回收</a>
                <% }
                   else
                   { %>
                <a href="javascript:void(0)" onclick="window.System.RoleToPermissionList.grantPermission('<%= item.ActionGuid %>')"><i class="ace-icon fa fa-pencil green bigger-110" title="授权"></i>授权</a>
                <% } %>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
