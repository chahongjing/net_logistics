<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<LoginViewData>" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta charset="utf-8">
    <title>后台管理系统登录</title>
    <meta name="description" content="User login page">
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/Front/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Front/dist/css/font-awesome.min.css">
    <!-- ace styles -->
    <link rel="stylesheet" href="/Front/dist/css/ace.min.css">
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/Front/dist/css/ace-part2.min.css" />
		<![endif]-->
    <link rel="stylesheet" href="/Front/dist/css/ace-rtl.min.css">
    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="/Front/dist/css/ace-ie.min.css" />
		<![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
		<script src="/Front/dist/js/html5shiv.min.js"></script>
		<script src="/Front/dist/js/respond.min.js"></script>
		<![endif]-->
</head>
<body class="login-layout">
    <div class="main-container">
        <div class="main-content">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="login-container">
                        <div class="space-30">
                        </div>
                        <div class="center">
                            <h1>
                                <i class="ace-icon fa fa-leaf green"></i><span class="red">后台管理</span><span class="white"
                                    id="id-text2">系统</span>
                            </h1>
                            <h4 class="blue" id="id-company-text">
                                &copy; Zjy Office</h4>
                        </div>
                        <div class="space-6">
                        </div>
                        <div class="position-relative">
                            <div id="login-box" class="login-box visible widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-coffee green"></i>请输入您的信息
                                        </h4>
                                        <div class="space-6">
                                        </div>
                                        <form id="formLogin" action="/AjaxUserLogin/Login.cspx" method="post">
                                        <input type="hidden" id="RedirectUrl" name="RedirectUrl" value="<%= this.Model.RedirectUrl %>" />
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" name="UserCode" id="UserCode" class="form-control" placeholder="用户名称">
                                                    <i class="ace-icon fa fa-user"></i></span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" name="Password" id="Password" class="form-control" placeholder="密 码">
                                                    <i class="ace-icon fa fa-lock"></i></span>
                                            </label>
                                            <div class="space">
                                            </div>
                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace">
                                                    <span class="lbl">记住我</span>
                                                </label>
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="btnLogin"
                                                    onclick="login()">
                                                    <i class="ace-icon fa fa-key"></i><span class="bigger-110">登录</span>
                                                </button>
                                            </div>
                                            <div class="space-4">
                                            </div>
                                        </fieldset>
                                        </form>
                                        <div class="social-or-login center">
                                            <span class="bigger-110">其它方式登录</span>
                                        </div>
                                        <div class="space-6">
                                        </div>
                                        <div class="social-login center">
                                            <a class="btn btn-primary"><i class="ace-icon fa fa-facebook"></i></a><a class="btn btn-info">
                                                <i class="ace-icon fa fa-twitter"></i></a><a class="btn btn-danger"><i class="ace-icon fa fa-google-plus">
                                                </i></a>
                                        </div>
                                    </div>
                                    <!-- /.widget-main -->
                                    <div class="toolbar clearfix">
                                        <div>
                                            <a href="#" data-target="#forgot-box" class="forgot-password-link"><i class="ace-icon fa fa-arrow-left">
                                            </i>忘记密码</a>
                                        </div>
                                        <div>
                                            <a href="#" data-target="#signup-box" class="user-signup-link">注 册 <i class="ace-icon fa fa-arrow-right">
                                            </i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.login-box -->
                            <div id="forgot-box" class="forgot-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header red lighter bigger">
                                            <i class="ace-icon fa fa-key"></i>获取密码
                                        </h4>
                                        <div class="space-6">
                                        </div>
                                        <p>
                                            输入您的邮箱
                                        </p>
                                        <form>
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" placeholder="邮箱">
                                                    <i class="ace-icon fa fa-envelope"></i></span>
                                            </label>
                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i><span class="bigger-110">发 送</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                        </form>
                                    </div>
                                    <!-- /.widget-main -->
                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link">返回登录 <i class="ace-icon fa fa-arrow-right">
                                        </i></a>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.forgot-box -->
                            <div id="signup-box" class="signup-box widget-box no-border">
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header green lighter bigger">
                                            <i class="ace-icon fa fa-users blue"></i>新用户注册
                                        </h4>
                                        <div class="space-6">
                                        </div>
                                        <p>
                                            输入您的详细信息:
                                        </p>
                                        <form>
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" placeholder="邮箱">
                                                    <i class="ace-icon fa fa-envelope"></i></span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" placeholder="用户名">
                                                    <i class="ace-icon fa fa-user"></i></span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" placeholder="密码">
                                                    <i class="ace-icon fa fa-lock"></i></span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" placeholder="重复密码">
                                                    <i class="ace-icon fa fa-retweet"></i></span>
                                            </label>
                                            <label class="block">
                                                <input type="checkbox" class="ace">
                                                <span class="lbl">我接受 <a href="#">用户使用协议</a> </span>
                                            </label>
                                            <div class="space-24">
                                            </div>
                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i><span class="bigger-110">重置</span>
                                                </button>
                                                <button type="button" class="width-65 pull-right btn btn-sm btn-success">
                                                    <span class="bigger-110">注册</span>&nbsp;<i class="ace-icon fa fa-arrow-right icon-on-right">
                                                    </i>
                                                </button>
                                            </div>
                                        </fieldset>
                                        </form>
                                    </div>
                                    <div class="toolbar center">
                                        <a href="#" data-target="#login-box" class="back-to-login-link"><i class="ace-icon fa fa-arrow-left">
                                        </i>返回登录 </a>
                                    </div>
                                </div>
                                <!-- /.widget-body -->
                            </div>
                            <!-- /.signup-box -->
                        </div>
                        <!-- /.position-relative -->
                        <div class="navbar-fixed-top align-right">
                            <br>
                            <a id="btn-login-dark" href="#">黑暗</a>&nbsp;<span class="blue">|</span> <a id="btn-login-blur"
                                href="#">极光</a>&nbsp;<span class="blue">|</span> <a id="btn-login-light" href="#">明亮</a>&nbsp;
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.main-content -->
    </div>
    <!-- /.main-container -->
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

    <!-- <![endif]-->
    <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/Front/dist/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.form.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

    <script src="/Front/dist/js/tools.js" type="text/javascript"></script>

    <!-- inline scripts related to this page -->

    <script type="text/javascript">
        jQuery(function($) {
            $(document).on('click', '.toolbar a[data-target]', function(e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible'); //hide others
                $(target).addClass('visible'); //show target
            });
        });



        //you don't need this, just used for changing background
        jQuery(function($) {
            $('#btn-login-dark').on('click', function(e) {
                $('body').attr('class', 'login-layout');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'blue');

                e.preventDefault();
            });
            $('#btn-login-light').on('click', function(e) {
                $('body').attr('class', 'login-layout light-login');
                $('#id-text2').attr('class', 'grey');
                $('#id-company-text').attr('class', 'blue');

                e.preventDefault();
            });
            $('#btn-login-blur').on('click', function(e) {
                $('body').attr('class', 'login-layout blur-login');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'light-blue');

                e.preventDefault();
            });

        });

        // 函数名称： login
        // 函数功能： 外部客户登录
        // 函数参数： 无
        // 返 回 值： 无
        // 创 建 人： zengjy01
        // 创建日期： 2014-03-25 10:19:27
        var login = function() {
            $("#formLogin").ajaxSubmit({
                dataType: "json",
                beforeSubmit: function(arr, $form, options) {
                    var userName = $("#UserCode");
                    var password = $("#Password");

                    if ($.trim(userName.val()) == "") {
                        //Mysoft.IT.MyUI.PopWin.showMessage("请填写账号！", function () {
                        //    userName.select();
                        //}, true);
                        //alert("请填写账号！");
                        alertModal('请输入用户名!', function() {
                            return false;
                        });
                        return false;
                    }
                    if ($.trim(password.val()) == "") {
                        alertModal('请输入密码!', function() {
                            return false;
                        });
                        return false;
                    }
                },
                success: function(data) {
                    if (data.Status == Constant.ResultStatus.OK) {
                        var url = $("#RedirectUrl").val();
                        url = url ? url : "/Login1.aspx";
                        window.location = url;
                    } else if (data.Status == Constant.ResultStatus.NO) {
                        alertModal(data.Message, function() {
                            return false;
                        });
                    }
                }
            });
        }

        $('#UserCode, #Password').bind('keypress', function(event) {
            if (event.keyCode == "13") {
                $("#btnLogin").click();
            }
        });

        $(function() {
            $("#UserCode").focus();
        });
    </script>

</body>
</html>
