<%@ Page Title="" Language="C#" MasterPageFile="~/System/Main.Master" Inherits="BasePageView<RoleListViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        #divTable1 tr.selected,#divTable tr.selected
        {
            background-color: #dbfee6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="main-content">
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12 no-padding-left no-padding-right">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs" id="myTab">
                                    <li class="active"><a data-toggle="tab" href="#RoleCompany" aria-expanded="true"><i class="green ace-icon fa fa-home bigger-120">
                                    </i>角色添加业务对象
                                    </a></li>
                                    <li class="hide"><a data-toggle="tab" href="#UserRole" aria-expanded="false">业务对象添加角色</a></li>
                                </ul>
                                <div class="tab-content fullscreen">
                                    <div id="RoleCompany" class="tab-pane fade active in">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="modal-content">
                                                    <div class="modal-header no-padding" id="Div3">
                                                        <div class="table-header">
                                                            <div class="btn-group pull-right" style="padding-top: 4px;">
                                                                <button type="button" id="btnAddRole" class="btn btn-warning btn-sm btn-primary no-border">
                                                                    <i class="ace-icon fa fa-plus align-top bigger-110" style="margin-top: 2px"></i>
                                                                    新增</button>
                                                                <button type="button" id="btnEditRole" class="btn btn-success btn-sm btn-primary no-border">
                                                                    <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                                                    编辑</button>
                                                                <button type="button" id="btnGrant" class="btn btn-success btn-sm btn-primary no-border">
                                                                    <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                                                    授权对象</button>
                                                                <button type="button" id="btnGrantPermission" class="btn btn-success btn-sm btn-primary no-border">
                                                                    <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                                                    授权</button>
                                                                <button type="button" id="btnDeleteRole" class="btn btn-info btn-sm btn-primary no-border">
                                                                    <i class="ace-icon fa fa-trash align-top bigger-110" style="margin-top: 2px"></i>
                                                                    删除</button>
                                                            </div>
                                                            角色列表
                                                        </div>
                                                    </div>
                                                    <div id="divTable1">
                                                        <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/RoleList.ascx", this.Model.List)%>
                                                    </div>
                                                    <div class="no-margin-top" id="divPagination1">
                                                        <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.PageData)%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="UserRole" class="tab-pane fade">
                                        <div class="row">
                                            sd
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="hr hr-single hr-dotted hr18 no-padding-left no-padding-right">
                    </div>
                    <!-- /.row -->
                    <div class="space">
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.page-content -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.form.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/dist/js/bootbox.min.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/RoleList.js")%>

    <script src="/Front/dist/js/fuelux/fuelux.tree.min.js"></script>

    <script src="/Front/dist/js/tools.js" type="text/javascript"></script>

</asp:Content>
