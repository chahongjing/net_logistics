<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<BusinessTypeListViewData>" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>选择</title>
    <meta name="description" content="top menu &amp; navigation">
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
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/Front/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Front/dist/css/font-awesome.min.css">
    <!-- page specific plugin styles -->
    <!-- ace styles -->
    <link rel="stylesheet" href="/Front/dist/css/ace.min.css" class="ace-main-stylesheet"
        id="Link1">
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/Front/dist/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
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
<body class="no-skin">
    <div class="row">
        <div class="col-sm-6">
            <div class="widget-main">
	            <form class="form-search">
                    <div class="col-xs-2 col-sm-2 no-padding-left no-padding-right">
                        <div class="input-group text-center" style="padding-top:10px;font-size:13px;">按名称查询</div>
                    </div>
			        <div class="col-xs-10 col-sm-10">
				        <div class="input-group">
					        <input type="text" class="form-control search-query" name="key" placeholder="输入业务类型名称查询" />
					        <span class="input-group-btn">
						        <button type="button" class="btn btn-purple btn-sm" id="btnSearch">查询<i class="icon-search icon-on-right bigger-110"></i>
						        </button>
					        </span>
				        </div>
			        </div>
	            </form>
            </div>
        </div>
	</div>
    <div class="space-6">
    </div>
    <div class="modal-header no-padding" id="tblFirstHead">
        <div class="table-header" style="padding-right: 2px">
            业务类型列表
        </div>
    </div>
    <div id="divTbl">
        <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/SelectBusinessType.ascx", this.Model)%>
    </div>
    <div class="no-margin-top" id="divPagination">
        <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.pageDataParents)%>
    </div>
</body>
</html>

<script src="/Front/Controls/DialogBox1.js" type="text/javascript"></script>

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

<!-- ace scripts -->

<script src="/Front/dist/js/ace-elements.min.js"></script>

<script src="/Front/dist/js/ace.min.js"></script>

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

<script src="/Front/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<script src="/Front/dist/js/fuelux/fuelux.tree.min.js"></script>

<!-- ace scripts -->

<script src="/Front/dist/js/ace-elements.min.js"></script>

<script src="/Front/dist/js/ace.min.js"></script>
<script src="/Front/Common/Utility.js"></script>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/SelectBusinessType.js")%>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    $(function () {
        $("#tblList tr:gt(0)").click(function () {
            $(this).addClass("selected").siblings().removeClass("selected");
        });
    });

    function getReturnDate() {
        var tr = $("#tblList tr.selected");
        if (tr.length == 0) {
            alert("请选择一条记录");
            return false;
        }
        return tr;
    }
</script>

