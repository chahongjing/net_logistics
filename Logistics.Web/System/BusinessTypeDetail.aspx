<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<BusinessTypeDetailViewData>" %>

<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>业务类型</title>
    <meta name="description" content="业务类型">
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
        .selectPeople {
            border-left: 0;
        }
        .tooLong {
            font-size:13px;
            line-height:36px;
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
                <form class="form-horizontal" id="formBusinessType" role="form" method="<%= this.Model.Method %>"
                    action="<%= this.Model.Url %>">
                    <input type="hidden" name="TypeID" value="<%= this.Model.Entity.TypeID %>" />
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red">编码</font>
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <span>
                                <input type="text" name="Code" placeholder="编码" class="form-control" maxlength="50"
                                    value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Code) %>"></span>
                        </div>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red">名称</font>
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <span>
                                <input type="text" name="Name" placeholder="名称" class="form-control" maxlength="100"
                                    value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Name) %>"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                        <font color="red"></font>
                            <%= this.Model.type != 1 ? "父级" : String.Empty %><%= this.Model.type == 1 ? "父级" : string.Empty %>
                        </label>
                        <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                            <div class="input-group">
                                <input type="text" name="ParentName" placeholder="" class="form-control" readonly
                                     value="<%= this.Model.Entity.ParentName %>">
                                <span class="input-group-addon selectPeople" id="lnkSelectParent" <%= this.Model.type == 1 ? "disabled" : "" %>>
                                    <i class="fa fa-search bigger-110"></i></span>
                                <input type="hidden" name="ParentID" value="<%= this.Model.Entity.ParentID %>" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <% if (this.Model.type == 1){ %>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding tooLong" class="form-control">
                            <font color="red"></font>所需材料
                        </label>
                        <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                            <span>
                                <textarea name="Material" placeholder="所需材料" class="form-control" rows="3"><%= HttpUtility.HtmlEncode(this.Model.Entity.Material) %></textarea></span>
                            </span>
                        </div>
                        <%} else { %>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding tooLong" class="form-control">
                            <font color="red"></font>时间间隔
                        </label>
                        <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                            <span>
                                <textarea name="Material" placeholder="所需材料" class="form-control hide" rows="3"></textarea></span>
                                <input type="text" name="Time" placeholder="时间间隔" class="form-control" maxlength="50" value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Time) %>">
                            </span>
                        </div>
                        <%} %>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red"></font>备注
                        </label>
                        <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                            <span>
                                <textarea name="Memo" placeholder="备注" class="form-control" rows="3"><%= HttpUtility.HtmlEncode(this.Model.Entity.Memo) %></textarea></span>
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

<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/BusinessTypeDetail.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

