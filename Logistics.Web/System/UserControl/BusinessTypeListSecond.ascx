<%@ Control Language="C#" Inherits="BaseUserControlView<BusinessTypeListViewData>" %>
<style>

    i
    {
        cursor: pointer;
        margin-left: 5px;
        margin-right: 5px;
    }
</style>
<table id="tblSecond" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width:200px;">
                编码
            </th>
            <th class="text-center" style="width:200px;">
                名称
            </th>
            <th class="text-center" style="width:150px;">
                父级名称
            </th>
            <th class="text-center" style="width:100px;">
                时间间隔
            </th>
            <th class="text-center" style="width:100px;">
                备注
            </th>
        </tr>
    </thead>
    <tbody>
        <% foreach (Logistics.Entity.BusinessType entity in this.Model.menuListChildren)
           { %>
        <tr data-oid="<%= entity.TypeID %>">
            <td>
                <%= HttpUtility.HtmlEncode(entity.Code) %>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Name) %>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.ParentName) %>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Time) %>
            </td>
            <td class="text-center" title="<%= HttpUtility.HtmlEncode(entity.Memo)%>">
                <% if (!string.IsNullOrEmpty(entity.Memo) && entity.Memo.Length > 50)
                   {%>
                    <%= HttpUtility.HtmlEncode(entity.Memo.Substring(0, 50)+ "...")%>
                <% }else { %>
                <%= HttpUtility.HtmlEncode(entity.Memo)%>
                <% }%>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
