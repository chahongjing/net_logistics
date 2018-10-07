<%@ Control Language="C#" Inherits="BaseUserControlView<OrganizationListViewData>" %>
<style>
    .female
    {
        color: #CC66FF;
    }
    i
    {
        cursor: pointer;
        margin-left: 2px;
        margin-right: 2px;
    }
</style>
<table id="tblOrganizationList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 150px;"><i class="fa fa-university bigger-110" title="部门"></i>
                组织
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 150px;"><i class="fa fa-building-o bigger-110" title="公司"></i>
                上级组织
            </th>
            <th class="text-center" style="width: 150px;">
                上级编码
            </th>
            <th class="text-center" style="width: 100px;">
                图标
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.Organization organization in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= organization.UnitGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(organization.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(organization.Code)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(organization.ParentName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(organization.ParentCode)%>
            </td>
            <td><i class="ace-icon <%= organization.Icon %> bigger-110" title="图标"></i>
                <%= HttpUtility.HtmlEncode(organization.Icon)%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
