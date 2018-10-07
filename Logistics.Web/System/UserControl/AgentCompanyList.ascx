<%@ Control Language="C#" Inherits="BaseUserControlView<AgentCompanyListViewData>" %>
<style>
    .female
    {
        color: #CC66FF;
    }
    i
    {
        cursor: pointer;
        margin-left: 4px;
        margin-right: 4px;
    }
</style>
<table id="tblAgentCompanyList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
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
            <th class="text-center" style="width: 50px;">
                操作
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.AgentCompany entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.AgentID %>">
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
            <td class="text-center icon">
                <i class="ace-icon fa fa-pencil green bigger-110" title="编辑" onclick="window.System.AgentCompanyList.edit(this)">
                </i><i class="ace-icon fa fa-trash-o bigger-110 orange" title="删除" onclick="window.System.AgentCompanyList.deleteRecord(this)">
                </i><i class="hide ace-icon fa fa-check green bigger-110"></i><i class="hide ace-icon fa fa-times red2 bigger-110">
                </i><i class="hide ace-icon fa fa-floppy-o bigger-110 blue"></i>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
