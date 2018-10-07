<%@ Control Language="C#" Inherits="BaseUserControlView<BusinessTypeListViewData>" %>
<style>
    i {
        cursor: pointer;
        margin-left: 5px;
        margin-right: 5px;
    }

    td {
        height: 36px;
        width: 200px;
        line-height: 30px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
    }
            #tblList tr.selected
        {
            background-color: #dbfee6;
        }
</style>
<table id="tblList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 200px;">编码
            </th>
            <th class="text-center" style="width: 150px;">名称
            </th>
            <th class="text-center" style="width: 100px;">需要的资料
            </th>
            <th class="text-center" style="width: 100px;">备注
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.BusinessType entity in this.Model.menuListParents)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.TypeID %>" data-name="<%= entity.Name %>">
            <td style="width:100px;">
                <%= HttpUtility.HtmlEncode(entity.Code)%>
            </td>
            <td style="width:100px;">
                <%= HttpUtility.HtmlEncode(entity.Name)%>
            </td>
            <td style="width:200px;" title="<%= HttpUtility.HtmlEncode(entity.Material)%>">
                <% if(!string.IsNullOrEmpty(entity.Material) && entity.Material.Length > 50) {%>
                    <%= HttpUtility.HtmlEncode(entity.Material.Substring(0, 50)+ "...")%>
                <% }else { %>
                <%= HttpUtility.HtmlEncode(entity.Material)%>
                <% }%>
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
        <% i++;
           } %>
    </tbody>
</table>
