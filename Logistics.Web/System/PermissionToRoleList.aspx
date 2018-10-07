<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<PermissionRoleListViewData>" %>

<%@ Import Namespace="BaseFrameWork.MVC" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>角色权限</title>
    <meta name="description" content="角色权限">
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
        #divTable tr.selected
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
                    <div class="col-md-4 col-sm-4 col-xs-4">
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <select>
                            <option>1 </option>
                        </select>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-2">
                        <select>
                            <option>1 </option>
                        </select>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="modal-content">
                            <div class="modal-header no-padding" id="Div3">
                                <div class="table-header">
                                <input type="hidden" name="ActionGuid" value="<%= this.Model.ActionGuid %>" />
                                    <div class="btn-group pull-right" style="padding-top: 4px;">
                                    </div>
                                    角色列表
                                </div>
                            </div>
                            <div id="divTable">
                                <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/BusinessToRole.ascx", this.Model.List)%>
                            </div>
                            <div class="no-margin-top" id="divPagination">
                                <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.PageData)%>
                            </div>
                        </div>
                    </div>
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
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/PermissionToRoleList.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>

