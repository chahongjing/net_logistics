<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<CompanyDetailViewData>" %>

<%@ Import Namespace="BaseFrameWork.MVC" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans" style="overflow-y: scroll;">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>公司详情</title>
    <meta name="description" content="公司详情">
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

        .fontLong {
            font-size: 13px;
            line-height: 36px;
        }
        .form-group .activeInput {
        border:1px solid #999;
        }
        .input-group.lookup input {
            border:1px solid #999;
        }
        .input-group.lookup > span {
            border:1px solid #999;border-left:none;
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
                <form class="form-horizontal" id="formUser" role="form" method="<%= this.Model.Method %>" action="<%= this.Model.Url %>"
                    enctype="multipart/form-data">
                    <input type="hidden" name="CompanyID" value="<%= this.Model.Entity.CompanyID %>" />
                    <div id="paymentInfo">
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color="red">*</font>公司名称
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Name" placeholder="公司名称" <%= this.Model.FormType == FormType.ReadOnly ? "readonly" : string.Empty %> class="form-control <%= this.Model.FormType == FormType.ReadOnly ? string.Empty : "activeInput" %>" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Name) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color="red">*</font>公司地址
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Address" placeholder="公司地址" class="form-control activeInput" maxlength="200"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Address) %>">
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color="red">*</font>公司性质
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <select class="form-control activeInput" name="Character" id="Character" value="<%= this.Model.Entity.Character %>">
                                        <% foreach (KeyValueP item in this.Model.CompanyCharacterList)
                                           {%>
                                        <option value="<%=HttpUtility.HtmlEncode(item.Code) %>" <%= string.Equals(item.Code, this.Model.Entity.Character) ? "selected" : string.Empty%>><%=HttpUtility.HtmlEncode(item.Name) %></option>
                                        <%}%>
                                    </select></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong">
                                <font color="red"></font>惯用支付方式
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <select class="form-control activeInput" name="PayType" id="PayType" value="<%= this.Model.Entity.PayType %>">
                                        <% foreach (KeyValueP item in this.Model.PayTypeList)
                                           {%>
                                        <option value="<%=HttpUtility.HtmlEncode(item.Code) %>" <%= string.Equals(item.Code, this.Model.Entity.PayType) ? "selected" : string.Empty%>><%=HttpUtility.HtmlEncode(item.Name) %></option>
                                        <%}%>
                                    </select>
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong">
                                <font color="red"></font>纳税人识别号
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="IdentifyCode" placeholder="纳税人识别号" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.IdentifyCode) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>银行账号
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="BankCardNumber" placeholder="银行账号" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.BankCardNumber) %>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>开户行
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="BankName" placeholder="开户行" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.BankName) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong red">
                                <font color="red">*</font>联系人姓名
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Contact" placeholder="联系人姓名" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Contact) %>">
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>邮箱地址
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Email" placeholder="邮箱地址" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Email) %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>联系电话
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Mobile" placeholder="联系电话" class="form-control activeInput" maxlength="50"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Mobile) %>">
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong">
                                <font color="red"></font>空运行李限制
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input class="form-control input-mask-product text-right" type="text" name="AirLuggageLimit" id="AirLuggageLimit" value="<%= (this.Model.Entity.AirLuggageLimit??0).ToString("F2") %>" data-old="<%= (this.Model.Entity.AirLuggageLimit??0).ToString("F2") %>" placeholder="空运行李限制">
                                    <span class="input-group-addon">
                                        <span>KG</span>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong">
                                <font color="red"></font>海运行李限制
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input class="form-control input-mask-product text-right" type="text" name="ShippingLuggageLimit" id="ShippingLuggageLimit" value="<%= (this.Model.Entity.ShippingLuggageLimit??0).ToString("F2") %>"  data-old="<%= (this.Model.Entity.ShippingLuggageLimit??0).ToString("F2") %>" placeholder="海运行李限制">
                                    <span class="input-group-addon">
                                        <span>M³</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong">
                                <font color="red"></font>现有日本人数
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input class="form-control input-mask-product text-right" type="text" name="Japanese" id="Japanese" value="<%= this.Model.Entity.Japanese ?? 0 %>" data-old="<%= this.Model.Entity.Japanese ?? 0 %>" placeholder="现有日本人数">
                                    <span class="input-group-addon">
                                        <span>人</span>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right">
                                <font color="red"></font>建档日期
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="CreatedOn" placeholder="建档日期" readonly class="form-control"
                                        value="<%= this.Model.Entity.CreatedOn.HasValue ? this.Model.Entity.CreatedOn.Value.ToString("yyyy-MM-dd HH:mm:ss") : string.Empty %>">
                                </span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" <% if (this.Model.FormType == FormType.Add)
                                                                                                        { %>
                                <% }
                                                                                                        else if (!string.IsNullOrEmpty(this.Model.Entity.Logo))
                                                                                                        { %>
                                onclick="window.open('/image/logo/<%= this.Model.Entity.Logo %>', '_blank')"
                                title="查看Logo" style="text-decoration: underline; cursor: pointer; color: Blue;"
                                <% } %>>
                                <font color="red"></font>Logo
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup widget-body">
                                <input type="file" name="Logos" id="id-input-file-2" />
                                <%--<input multiple="" type="file" id="id-input-file-3" />--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding fontLong">
                                <font color="red"></font>公司主营业务
                            </label>
                            <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                                <span>
                                    <input type="text" name="MainBusiness" placeholder="公司主营业务" class="form-control activeInput" maxlength="500"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.MainBusiness) %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control activeInput">
                                <font color="red"></font>备注
                            </label>
                            <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                                <span>
                                    <textarea name="Memo" placeholder="备注" class="form-control activeInput" rows="3"><%= HttpUtility.HtmlEncode(this.Model.Entity.Memo) %></textarea>
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
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/CompanyDetail.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>
<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function ($) {
        $('#id-input-file-1 , #id-input-file-2').ace_file_input({
            no_file: '未选择文件 ...',
            btn_choose: '选择Logo',
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
            preview_error: function (filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                //alert(error_code);
            }

        }).on('change', function () {
            //console.log($(this).data('ace_input_files'));
            //console.log($(this).data('ace_input_method'));
        });



    });
</script>

