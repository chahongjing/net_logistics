<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<NavigationDetailViewData>" %>

<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>导航</title>
    <meta name="description" content="导航">
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
        	border-left:0;
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
                <form class="form-horizontal" id="formNavigation" role="form" method="<%= this.Model.Method %>"
                action="<%= this.Model.Url %>">
                <input type="hidden" name="MenuGuid" value="<%= this.Model.Entity.MenuGuid %>" />
                <div class="form-group">
                    <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red">名称</font>
                    </label>
                    <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                        <span>
                            <input type="text" name="Name" placeholder="名称" required class="form-control" required
                                value="<%= this.Model.Entity.Name %>"></span>
                    </div>
                    <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red">路径</font>
                    </label>
                    <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                        <span>
                            <input type="text" name="Url" placeholder="路径" class="form-control" required value="<%= this.Model.Entity.Url %>">
                        </span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red">
                            <%= this.Model.type != 1 ? "父级" : String.Empty %></font><%= this.Model.type == 1 ? "父级" : string.Empty %>
                    </label>
                    <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                        <div class="input-group">
                            <input type="text" name="ParentName" placeholder="" class="form-control" readonly
                                required value="<%= this.Model.Entity.ParentName %>">
                            <span class="input-group-addon selectPeople" id="lnkSelectParent" <%= this.Model.type == 1 ? "disabled" : "required" %>>
                                <i class="fa fa-search bigger-110"></i></span>
                            <input type="hidden" name="ParentGuid" value="<%= this.Model.Entity.ParentGuid %>" />
                        </div>
                    </div>
                    <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red"></font>图标
                    </label>
                    <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                        <span>
                            <input type="text" name="Icon" placeholder="图标" class="form-control" value="<%= this.Model.Entity.Icon %>"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red"></font>排序
                    </label>
                    <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                        <span>
                            <input type="text" name="OrderCode" placeholder="排序" class="form-control number"
                                value="<%= this.Model.Entity.OrderCode %>"></span>
                    </div>
                    <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red"></font>备注
                    </label>
                    <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                        <span>
                            <input type="text" name="Remark" placeholder="备注" class="form-control" value="<%= this.Model.Entity.Remark %>"></span>
                    </div>
                </div>
                </form>
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

    <script src="/Front/JQuery/jquery.form.js" type="text/javascript"></script>

    <script src="/Front/dist/js/jquery.validate.min.js" type="text/javascript"></script>

    <!-- inline scripts related to this page -->
</body>
</html>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Js/form.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>

<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/NavigationDetail.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

