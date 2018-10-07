<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<UserDetailViewData>" %>

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
                <form class="form-horizontal"id="formUser" role="form" method="<%= this.Model.Method %>" action="<%= this.Model.Url %>"
                enctype="multipart/form-data">
                <input type="hidden" name="UserGuid" value="<%= this.Model.Entity.UserGuid %>" />
                <div id="paymentInfo">
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red">*</font>编码
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <span>
                                <input type="text" name="UserCode" placeholder="编码" class="form-control" required
                                    value="<%= this.Model.Entity.UserCode %>"></span>
                        </div>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red">*</font>姓名
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <span>
                                <input type="text" name="UserName" placeholder="姓名" class="form-control" required
                                    value="<%= this.Model.Entity.UserName %>">
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red">*</font>密码
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <span>
                                <input type="password" name="Password" placeholder="密码" class="form-control" required
                                    value="<%= this.Model.Entity.Password %>"></span>
                        </div>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-left no-padding-right" class="form-control">
                            <font color="red">*</font>确认密码
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <span>
                                <input type="password" name="PasswordAgain" placeholder="确认密码" class="form-control"
                                    required value="<%= this.Model.Entity.Password %>">
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red"></font>姓别
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5">
                            <div class="radio col-sm-6 no-padding-left no-padding-right">
                                <label>
                                    <input name="form-field-radio" type="radio" class="ace" <%= this.Model.Entity.Sex != true ? "": "checked='checked'" %> onclick="$('input[name=Sex]').val('true')">
                                    <span class="lbl">男 </span>
                                </label>
                            </div>
                            <div class="radio col-sm-6 no-padding-left no-padding-right">
                                <label>
                                    <input name="form-field-radio" type="radio" class="ace" <%= this.Model.Entity.Sex != true ? "checked='checked'" : "" %> onclick="$('input[name=Sex]').val('false')">
                                    <span class="lbl">女 </span>
                                </label>
                            </div>
                            <input type="hidden" name="Sex" value="<%= this.Model.Entity.Sex.HasValue ? this.Model.Entity.Sex.Value.ToString().ToLower() : String.Empty %>" />
                        </div>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" for="submitDate">
                            <font color="red"></font>生日
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <div class="input-group pickerInModal">
                                <input type="text" placeholder="生日" class="date-picker input-sm form-control" name="Birthday"
                                    data-date-format="yyyy-mm-dd" value="<%= this.Model.Entity.Birthday.HasValue ? this.Model.Entity.Birthday.Value.ToString("yyyy-MM-dd"): string.Empty %>">
                                <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control" <% if(this.Model.FormType == FormType.Add){ %>
                            <% } else if(!string.IsNullOrEmpty(this.Model.Entity.Photo)) { %> onclick="window.open('<%= this.Model.Entity.Photo %>', '_blank')"
                            title="查看头像" style="text-decoration: underline; cursor: pointer; color: Blue;"
                            <% } %>>
                            <font color="red"></font>头像
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup widget-body">
                            <input type="file" name="Photos" id="id-input-file-2" />
                            <%--<input multiple="" type="file" id="id-input-file-3" />--%>
                        </div>
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red">*</font>公司
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <div class="input-group">
                                <input type="text" name="CompanyName" placeholder="公司" readonly class="form-control" value="<%= this.Model.Entity.CompanyName %>">
                                <span class="input-group-addon selectPeople" id="btnGetCompany"><i class="fa fa-search bigger-110"></i>
                                </span>
                                <input type="hidden" name="CompanyGuid" value="<%= this.Model.Entity.CompanyGuid %>" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                            <font color="red"></font>部门
                        </label>
                        <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                            <div class="input-group">
                                <input type="text" name="DepartmentName" placeholder="部门" readonly class="form-control" value="<%= this.Model.Entity.DepartmentName %>">
                                <span class="input-group-addon selectPeople" id="btnGetDepartment"><i class="fa fa-search bigger-110"></i>
                                </span>
                                <input type="hidden" name="DepartmentGuid" value="<%= this.Model.Entity.DepartmentGuid %>" />
                            </div>
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
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/UserDetail.js")%>
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

