<%@ Control Language="C#" Inherits="BaseUserControlView<NavigationListViewData>" %>
<style>

    i
    {
        cursor: pointer;
        margin-left: 2px;
        margin-right: 2px;
    }
</style>
<table id="tblFirst" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width:200px;">
                名称
            </th>
            <th class="text-center" style="width:150px;">
                图标
            </th>
            <th class="text-center" style="width:100px;">
                <i class="ace-icon fa fa-clock-o bigger-110"></i>排序
            </th>
            <th class="text-center" style="width:100px;">
                是否系统级
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.Menu menu in this.Model.menuListParents)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= menu.MenuGuid %>" data-name="<%= menu.Name %>">
            <td>
                <%= HttpUtility.HtmlEncode(menu.Name)%>
            </td>
            <td><i class="ace-icon <%= HttpUtility.HtmlEncode(menu.Icon)%> bigger-110"></i>
                <%= HttpUtility.HtmlEncode(menu.Icon)%>
            </td>
            <td class="text-center">
                <%= menu.OrderCode%>
            </td>
            <td class="text-center">
                <%= menu.IsSystem == true ? "是" : "否"%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
