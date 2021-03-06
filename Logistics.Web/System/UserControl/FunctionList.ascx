﻿<%@ Control Language="C#" Inherits="BaseUserControlView<FunctionListViewData>" %>

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
<table id="tblFunctionList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <thead>
        <tr>
            <th class="text-center" style="width: 150px;">
                名称
            </th>
            <th class="text-center" style="width: 100px;">
                编码
            </th>
            <th class="text-center" style="width: 100px;">
                系统
            </th>
            <th class="text-center" style="width: 50px;">
                备注
            </th>
        </tr>
    </thead>
    <tbody>
        <% int i = 0; foreach (Logistics.Entity.FunctionInfo entity in this.Model.List)
           { %>
        <tr class="<%= i == 0 ? "selected" : string.Empty %>" data-oid="<%= entity.FunctionGuid %>">
            <td>
                <%= HttpUtility.HtmlEncode(entity.Name)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Code)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.SystemName)%>
            </td>
            <td>
                <%= HttpUtility.HtmlEncode(entity.Remark)%>
            </td>
        </tr>
        <% i++;
           } %>
    </tbody>
</table>
