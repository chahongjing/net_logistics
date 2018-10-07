<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<RoleToBusinessListViewData>" %>

<%@ Import Namespace="BaseFrameWork.MVC" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>用户详情</title>
    <meta name="description" content="用户详情">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/Front/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Front/dist/css/font-awesome.min.css">
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/Front/dist/css/datepicker.min.css">
    <link rel="stylesheet" href="/Front/dist/css/daterangepicker.min.css">
    <!-- ace styles -->
    <link rel="stylesheet" href="/Front/dist/css/ace.min.css" class="ace-main-stylesheet"
        id="main-ace-style">
    <link rel="stylesheet" href="/Front/dist/css/fix.css">
    <style>
        .selectPeople
        {
            border-left: 0;
        }
        #divTable tr.selected, #divTable1 tr.selected
        {
            background-color: #dbfee6;
        }
    </style>
    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="/Front/dist/css/ace-ie.min.css" />
		<![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->

    <script src="/Front/dist/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
		<script src="/Front/dist/js/html5shiv.min.js"></script>
		<script src="/Front/dist/js/respond.min.js"></script>
		<![endif]-->
</head>
<body>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="tabbable">
                            <ul class="nav nav-tabs" id="myTab"><input type="hidden" name="RoleGuid" value="<%= this.Model.RoleGuid %>" />
                                <li class="active"><a data-toggle="tab" href="#RoleCompany" aria-expanded="true"><i
                                    class="green ace-icon fa fa-home bigger-120"></i>角色添加业务对象 </a></li>
                                <li class=""><a data-toggle="tab" href="#UserRole" aria-expanded="false">业务对象添加角色</a></li>
                            </ul>
                            <div class="tab-content fullscreen">
                                <div id="RoleCompany" class="tab-pane fade active in">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="modal-content">
                                                <div class="modal-header no-padding" id="Div3">
                                                    <div class="table-header">
                                                        <div class="btn-group pull-right" style="padding-top: 4px;">
                                                           
                                                        </div>
                                                        角色列表
                                                    </div>
                                                </div>
                                                <div id="divTable">
                                                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/RoleOrgnizationList.ascx", this.Model.listOrganization.List)%>
                                                </div>
                                                <div class="no-margin-top" id="divPagination">
                                                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.listOrganization.PageData)%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="UserRole" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="modal-content">
                                                <div class="modal-header no-padding" id="Div2">
                                                    <div class="table-header">
                                                        <div class="btn-group pull-right" style="padding-top: 4px;">
                                                            
                                                        </div>
                                                        角色列表
                                                    </div>
                                                </div>
                                                <div id="divTable1">
                                                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/RoleUserList.ascx", this.Model.listUserInfo.List)%>
                                                </div>
                                                <div class="no-margin-top" id="divPagination1">
                                                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.listUserInfo.PageData)%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
            </div>
        </div>
    </div>
    <!-- basic scripts -->
    <!--[if !IE]> -->

    <script src="/Front/dist/js/jquery/2.1.3/jquery.min.js"></script>

    <!-- <![endif]-->
    <!--[if IE]>
		<script src="/Front/dist/js/jquery/1.11.2/jquery.min.js"></script>
		<![endif]-->
    <!--[if !IE]> -->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='/Front/dist/js/jquery.min.js'>" + "<" + "/script>");
    </script>

    <!-- <![endif]-->
    <!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='/Front/dist/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='/Front/dist/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>

    <script src="/Front/dist/js/bootstrap.js"></script>

    <!-- page specific plugin scripts -->

    <script src="/Front/dist/js/date-time/bootstrap-datepicker.min.js"></script>

    <script src="/Front/dist/js/date-time/daterangepicker.min.js"></script>

    <script src="/Front/dist/js/jquery.validate.min.js"></script>

    <!-- ace scripts -->

    <script src="/Front/dist/js/ace-elements.min.js"></script>

    <script src="/Front/dist/js/ace.min.js"></script>

    <script src="../Front/JQuery/jquery.form.js" type="text/javascript"></script>

    <!-- inline scripts related to this page -->
</body>
</html>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Js/form.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/RoleToBusinessList.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>
