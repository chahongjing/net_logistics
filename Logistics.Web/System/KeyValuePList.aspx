<%@ Page Language="C#" MasterPageFile="~/System/Main.Master" Inherits="BasePageView<KeyValuePListViewData>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetCSSLink("/Front/Controls/DialogBox.css")%>
    <style>
        #tblKeyValuePList tr.selected
        {
            background-color: #dbfee6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-6">
        <input type="hidden" name="Group" value="<%= this.Model.Code %>" />
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="modal-content">
                <div class="modal-header no-padding" id="tblFirstHead">
                    <div class="table-header">
                        <div class="btn-group pull-right" style="padding-top: 4px;">
                            <button type="button" id="btnAdd" class="btn btn-warning btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-plus align-top bigger-110" style="margin-top: 2px"></i>
                                新增</button>
                            <button type="button" id="btnEdit" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                编辑</button>
                            <button type="button" id="btnDelete" class="btn btn-info btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-trash align-top bigger-110" style="margin-top: 2px"></i>
                                删除</button>
                        </div>
                        业务参数列表
                    </div>
                </div>
                <div id="divTbl">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/KeyValuePList.ascx", this.Model)%>
                </div>
                <div class="no-margin-top" id="divPagination">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.PageData)%>
                </div>
            </div>
        </div>
    </div>
    <div class="space-12">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.form.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/dist/js/bootbox.min.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/KeyValuePList.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

    <script src="/Front/dist/js/tools.js" type="text/javascript"></script>

</asp:Content>
