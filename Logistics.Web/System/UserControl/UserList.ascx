<%@ Control Language="C#" Inherits="BaseUserControlView<UserListViewData>" %>
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
            <th class="text-center" style="width: 150px;">
                姓名
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 50px;"><i class="fa fa-venus-mars bigger-110 red2" title="性别"></i>
                性别
            </th>
            <th class="text-center" style="width: 150px;"><i class="ace-icon fa fa-birthday-cake bigger-110 red2" title="生日"></i>
                生日
            </th>
            <th class="text-center" style="width: 50px;">
                头像
            </th>
            <th class="text-center" style="width: 100px;"><i class="fa fa-building-o bigger-110" title="公司"></i>
                公司
            </th>
            <th class="text-center" style="width: 100px;"><i class="fa fa-university bigger-110" title="部门"></i>
                部门
            </th>
            <th class="text-center" style="width: 50px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.UserInfo user in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= user.UserGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(user.UserName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(user.UserCode)%>
            </td>
            <td class="text-center">
                <% if (user.Sex == true)
                   { %>
                <i class="ace-icon fa fa-male green bigger-130" title="男"></i>
                <% }
                   else if (user.Sex == false)
                   { %>
                <i class="ace-icon fa fa-female female bigger-130" title="女"></i>
                <% }%>
            </td>
            <td class="text-center">
                <%= user.Birthday.HasValue ? user.Birthday.Value.ToString("yyyy-MM-dd"): String.Empty %>
            </td>
            <td class="text-center">
                <a href="<%= HttpUtility.HtmlEncode(user.Photo)%>" target="_blank">
                    <% if (!string.IsNullOrEmpty(user.Photo))
                       { %>
                    <i class="ace-icon fa fa-picture-o bigger-110" title="查看头像"></i>
                    <% } %>
                </a>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(user.CompanyName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(user.DepartmentName)%>
            </td>
            <td class="text-center icon">
                <i class="ace-icon fa fa-pencil green bigger-110" title="编辑" onclick="window.System.UserList.edit(this)">
                </i><i class="ace-icon fa fa-trash-o bigger-110 orange" title="删除" onclick="window.System.UserList.deleteRecord(this)">
                </i><i class="hide ace-icon fa fa-check green bigger-110"></i><i class="hide ace-icon fa fa-times red2 bigger-110">
                </i><i class="hide ace-icon fa fa-floppy-o bigger-110 blue"></i>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
