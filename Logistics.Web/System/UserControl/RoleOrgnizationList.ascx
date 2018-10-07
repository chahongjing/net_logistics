<%@ Control Language="C#" Inherits="BaseUserControlView<System.Collections.Generic.List<Organization>>" %>
<table id="tblTableList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 150px;">
                名称
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 150px;">
                父级名称
            </th>
            <th class="text-center" style="width: 100px;">
                父级编码
            </th>
            <th class="text-center" style="width: 100px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.Organization item in this.Model)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= item.UnitGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(item.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.Code)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.ParentName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(item.ParentCode)%>
            </td>
            <td>
                <% if (item.PermissionGuid.HasValue)
               { %><a href="javascript:void(0)" onclick="window.System.RoleToBusinessList.revokeBusiness('<%= item.UnitGuid %>')"><i class="ace-icon fa fa-pencil green bigger-110" title="回收"></i>回收</a>
                <% }
                   else
                   { %>
                <a href="javascript:void(0)" onclick="window.System.RoleToBusinessList.grantBusiness('<%= item.UnitGuid %>')"><i class="ace-icon fa fa-pencil green bigger-110" title="授权"></i>授权</a>
                <% } %>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
