<%@ Control Language="C#" Inherits="BaseUserControlView<AgentCompanyListViewData>" %>
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
                仓库地址
            </th>
            <th class="text-center" style="width: 50px;">
                联系人
            </th>
            <th class="text-center" style="width: 50px;">
                联系电话
            </th>
            <th class="text-center" style="width: 60px;">
                邮箱
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.AgentCompany entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.AgentID %>" data-name="<%= HttpUtility.HtmlEncode(entity.Name) %>">
            <td>
                <%= HttpUtility.HtmlEncode(entity.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Address)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.AgentCompanyCharacterName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Warehouse)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.WarehouseManager)%>
            </td>
            <td>
                <%= entity.WarehouseContact%>
            </td>
            <td>
                <%= entity.WarehouseContactEmail%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
