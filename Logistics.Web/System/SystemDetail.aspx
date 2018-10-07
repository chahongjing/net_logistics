<%@ Page Language="C#" Title="系统详情" Inherits="BasePageView<SystemDetailViewData>" %>

<%@ Import Namespace="BaseFrameWork.MVC" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>系统详情</title>
    <meta name="description" content="系统详情">
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
                <form class="form-horizontal" id="formSystem" role="form" method="<%= this.Model.Method %>"
                action="<%= this.Model.Url %>" enctype="multipart/form-data">
                <input type="hidden" name="SystemGuid" value="<%= this.Model.Entity.SystemGuid %>" />
                <div id="paymentInfo">
                    <div class="form-group">
                        <label class="col-md-2 col-sm-2 col-xs-2 control-label no-padding-right" class="form-control">
                            <font color="red">*</font>名称
                        </label>
                        <div class="col-md-10 col-sm-10 col-xs-10 miniGroup">
                            <span>
                                <input type="text" name="Name" placeholder="名称" class="form-control" required value="<%= this.Model.Entity.Name %>"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 col-sm-2 col-xs-2 control-label no-padding-right" class="form-control">
                            <font color="red">*</font>编码
                        </label>
                        <div class="col-md-10 col-sm-10 col-xs-10 miniGroup">
                            <span>
                                <input type="text" name="Code" placeholder="编码" class="form-control" required value="<%= this.Model.Entity.Code %>">
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 col-sm-2 col-xs-2 control-label no-padding-right" class="form-control">
                            <font color="red"></font>图标
                        </label>
                        <div class="col-md-10 col-sm-10 col-xs-10 miniGroup">
                            <span>
                                <input type="text" name="Icon" placeholder="图标" class="form-control" required value="<%= this.Model.Entity.Icon %>">
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 col-sm-2 col-xs-2 control-label no-padding-right" class="form-control">
                            <font color="red"></font>备注
                        </label>
                        <div class="col-md-10 col-sm-10 col-xs-10 miniGroup">
                            <span>
                                <input type="text" name="Remark" placeholder="备注" class="form-control" required value="<%= this.Model.Entity.Remark %>">
                            </span>
                        </div>
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

    <script src="../Front/JQuery/jquery.form.js" type="text/javascript"></script>

    <!-- inline scripts related to this page -->
</body>
</html>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Js/form.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/SystemDetail.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    /// <reference path="../Front/JQuery/jquery-2.1.0.js" />
    /// <reference path="/Front/Common/Public.js" />
    jQuery(function($) {
        $('#id-input-file-1 , #id-input-file-2').ace_file_input({
            no_file: '未选择文件 ...',
            btn_choose: '选择头像',
            btn_change: '换一个',
            droppable: false,
            onchange: null,
            thumbnail: false //| true | large
            //whitelist:'gif|png|jpg|jpeg'
            //blacklist:'exe|php'
            //onchange:''
            //
        });
        $('#id-input-file-3').ace_file_input({
            style: 'well',
            btn_choose: 'Drop files here or click to choose',
            btn_change: null,
            no_icon: 'icon-cloud-upload',
            droppable: true,
            thumbnail: 'small'//large | fit
            //,icon_remove:null//set null, to hide remove/reset button
            /**,before_change:function(files, dropped) {
            //Check an example below
            //or examples/file-upload.html
            return true;
            }*/
            /**,before_remove : function() {
            return true;
            }*/
					,
            preview_error: function(filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                //alert(error_code);
            }

        }).on('change', function() {
            //console.log($(this).data('ace_input_files'));
            //console.log($(this).data('ace_input_method'));
        });
    });
</script>

