<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<PriceDetailViewData>" %>

<%@ Import Namespace="BaseFrameWork.MVC" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>报价详情</title>
    <meta name="description" content="报价详情">
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
        .tooLong {
            font-size:13px;
            line-height:24px;
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
                <form class="form-horizontal" id="form" role="form" method="<%= this.Model.Method %>" action="<%= this.Model.Url %>"
                    enctype="multipart/form-data">
                    <input type="hidden" name="ListID" value="<%= this.Model.Entity.ListID %>" />
                    <div id="paymentInfo">
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color="red">*</font>起运地
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="StartPlace" placeholder="起运地" class="form-control" maxlength="200"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.StartPlace) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color="red">*</font>目的地
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="DestinationPlace" placeholder="目的地" class="form-control" maxlength="200"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.DestinationPlace) %>">
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>中转地
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="InterimPlace" placeholder="中转地" class="form-control" maxlength="200"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.InterimPlace) %>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right no-padding-left">
                                <font color="red"></font>行李量
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                 <span>
                                    <input type="text" name="LuggageAmount" placeholder="行李量" class="form-control" maxlength="60"
                                        value="<%= this.Model.Entity.LuggageAmount %>">
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right tooLong">
                                <font color="red"></font>计量类别
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <select class="form-control" name="Type" id="Character" value="<%= this.Model.Entity.Type %>">
                                        <% foreach (KeyValueP item in this.Model.TypeList)
                                           {%>
                                        <option value="<%=HttpUtility.HtmlEncode(item.Name) %>" <%= string.Equals(item.Name, this.Model.Entity.Type) ? "selected" : string.Empty%>><%=HttpUtility.HtmlEncode(item.Name) %></option>
                                        <%}%>
                                    </select></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>成本1
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="CostOne" placeholder="成本1" class="form-control" maxlength="10"
                                        value="<%= this.Model.Entity.CostOne %>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>成本2
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="CostTwo" placeholder="成本2" class="form-control" maxlength="10"
                                        value="<%= this.Model.Entity.CostTwo %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>成本3
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="CostThree" placeholder="成本3" class="form-control" maxlength="10"
                                        value="<%= this.Model.Entity.CostThree %>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color="red"></font>备注
                            </label>
                            <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                                <span>
                                    <textarea name="Memo" placeholder="备注" class="form-control" rows="3"><%= HttpUtility.HtmlEncode(this.Model.Entity.Memo) %></textarea>
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
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/PriceDetail.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>
<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
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

