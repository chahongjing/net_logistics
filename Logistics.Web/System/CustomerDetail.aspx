<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<CustomerDetailViewData>" %>

<%@ Import Namespace="BaseFrameWork.MVC" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans" style="overflow-y: scroll;">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>客户详情</title>
    <meta name="description" content="客户详情">
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
        #tblList tr td.icon {
        line-height:30px;
        }
        .icon i {
        cursor:pointer;font-size:18px;
        }
        .page-content {
            height: 570px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
        #tblList tr.selected
        {
            background-color: #dbfee6;
        }
        .yellow {
        color:#e59729;
        }
        #CompanyName {
            text-decoration:underline;
            color:blue;cursor:pointer;
        }
        .form-group .activeInput {
        border:1px solid #999;
        }
        .input-group.lookup input {
            border:1px solid #999;
        }
        .input-group.lookup span {
            border:1px solid #999;border-left:none;
        }
        /*  宽度  */
.w20{width:20px;}.w30{width:30px;}.w50{width:50px;}.w70{width:70px;}.w80{width:80px;}.w90{width:90px;}
.w100{width:100px;} .w150{width:150px;} .w160{width:160px;} .w170{width:170px;} .w180{width:180px;} .w179{width:179px;} .w200{width:200px;}
.w210{width:210px;} .w220{width:220px;} .w230{width:230px;} .w245{width:245px;} .w250{width:250px;} .w300{width:300px;} .w320{width:320px;} 
.w323{width:323px;} .w330{width:330px;} .w344{width:344px;} .w345{width:345px;} .w350{width:350px;} .w400{width:400px;} .w450{width:450px;} .w480{width:480px;}.w500{width:500px;}
.w550{width:550px;} .w600{width:600px;} .w650{width:650px;} .w700{width:700px;} .w750{width:750px;} .w800{width:800px;} .w850{width:850px;}
.w860{width:860px;} .w861{width:861px;} .w862{width:862px;} .w900{width:900px;} .w950{width:950px;} .w1000{width:1000px;} .w1050{width:1050px;}
/* 百分比 */
.w5p{width:5%;} .w10p{width:10%;} .w5p{width:15%;} .w20p{width:20%;} .w25p{width:25%;} .w30p{width:30%;} .w33p{width:33%;} .w35p{width:35%;}
.w40p{width:40%;} .w45p{width:45%;} .w50p{width:50%;} .w55p{width:55%;} .w60p{width:60%;} .w65p{width:65%;} .w66p{width:66%;} .w70p{width:70%;}
.w75p{width:75%;} .w80p{width:80%;} .w85p{width:85%;} .w90p{width:90%;} .w95p{width:95%;} .w100p{width:100%;}
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
                    <input type="hidden" name="CustomerID" value="<%= this.Model.Entity.CustomerID %>" />
                    <div id="paymentInfo">
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color=""></font>客户名称
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Name" placeholder="客户名称" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Name) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color=""></font>公司名称
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" name="CompanyName" id="CompanyName" placeholder="公司名称" readonly class="form-control link"
                                        value="<%= this.Model.Entity.CompanyName %>">
                                    <span class="input-group-addon selectPeople" id="btnGetCompany"><i class="fa fa-search bigger-110"></i></span>
                                    <input type="hidden" name="CompanyID" value="<%= this.Model.Entity.CompanyID %>" />
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color=""></font>业务类型
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" name="BusinessTypeName" placeholder="业务类型" readonly class="form-control"
                                        value="<%= this.Model.Entity.BusinessTypeName %>">
                                    <span class="input-group-addon selectPeople" id="btnGetBusinessType"><i class="fa fa-search bigger-110"></i></span>
                                    <input type="hidden" name="BusinessType" value="<%= this.Model.Entity.BusinessType %>" />
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>联系电话
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Phone" placeholder="联系电话" class="form-control activeInput" maxlength="50"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Phone) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>邮箱地址
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Email" placeholder="邮箱地址" class="form-control activeInput" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Email) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>建档日期
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="CreatedOn" placeholder="建档日期" readonly class="form-control" maxlength="20"
                                        value="<%= this.Model.Entity.CreatedOn.HasValue ? this.Model.Entity.CreatedOn.Value.ToString("yyyy-MM-dd HH:mm:ss") : string.Empty %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>配送地址
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="DeliveryAddress" placeholder="配送地址" class="form-control activeInput" maxlength="200"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.DeliveryAddress) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color=""></font>行李量
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="LuggageAmount" placeholder="行李量" class="form-control text-right activeInput" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.LuggageAmount ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.LuggageAmount ?? 0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color=""></font>货量单位
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <select class="form-control activeInput" name="LuggageUnit" id="LuggageUnit" value="<%= this.Model.Entity.LuggageUnit %>">
                                        <% foreach (KeyValueP item in this.Model.LuggageUnitList)
                                           {%>
                                        <option value="<%=HttpUtility.HtmlEncode(item.Name) %>" <%= string.Equals(item.Name, this.Model.Entity.LuggageUnit) ? "selected" : string.Empty%>><%=HttpUtility.HtmlEncode(item.Name) %></option>
                                        <%}%>
                                    </select></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>职位
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Job" placeholder="职位" class="form-control activeInput" maxlength="50"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.Job) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>生日
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" placeholder="生日" class="date-picker input-sm form-control" name="BirthDay"
                                        data-date-format="yyyy-mm-dd" value="<%= this.Model.Entity.BirthDay.HasValue ? this.Model.Entity.BirthDay.Value.ToString("yyyy-MM-dd"): string.Empty %>">
                                    <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>起运地址
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="StartAddress" placeholder="起运地址" class="form-control activeInput" maxlength="200"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.StartAddress) %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right red">
                                <font color=""></font>起运地
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" name="StartPlace" placeholder="起运地" readonly class="form-control"
                                        value="<%= this.Model.Entity.StartPlace %>">
                                    <span class="input-group-addon selectPeople" id="btnGetStartPlace"><i class="fa fa-search bigger-110"></i></span>
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>目的地
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="DestinationPlace" placeholder="目的地" readonly class="form-control" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.DestinationPlace) %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>中转地
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="InterimPlace" placeholder="中转地" readonly class="form-control" maxlength="100"
                                        value="<%= HttpUtility.HtmlEncode(this.Model.Entity.InterimPlace) %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color=""></font>代理店1
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" name="AgentOneName" placeholder="代理店1" readonly class="form-control"
                                        value="<%= this.Model.Entity.AgentOneName %>">
                                    <span class="input-group-addon selectPeople" id="btnGetAgentOne"><i class="fa fa-search bigger-110"></i></span>
                                    <input type="hidden" name="AgentOne" value="<%= this.Model.Entity.AgentOne %>" />
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>成本1
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="AgentOneCost" placeholder="成本1" readonly class="form-control text-right" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.AgentOneCost ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.AgentOneCost??0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>最终支付1
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="AgentOnePayment" placeholder="最终支付1" class="form-control text-right activeInput" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.AgentOnePayment ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.AgentOnePayment??0).ToString("F2") %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color=""></font>代理店2
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" name="AgentTwoName" placeholder="代理店2" readonly class="form-control"
                                        value="<%= this.Model.Entity.AgentTwoName %>">
                                    <span class="input-group-addon selectPeople" id="btnGetAgentTwo"><i class="fa fa-search bigger-110"></i></span>
                                    <input type="hidden" name="AgentTwo" value="<%= this.Model.Entity.AgentTwo %>" />
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>成本2
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="AgentTwoCost" placeholder="成本2" readonly class="form-control text-right" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.AgentTwoCost ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.AgentTwoCost??0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>最终支付2
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="AgentTwoPayment" placeholder="最终支付2" class="form-control text-right activeInput" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.AgentTwoPayment ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.AgentTwoPayment??0).ToString("F2") %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color=""></font>代理店3
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <div class="input-group lookup">
                                    <input type="text" name="AgentThreeName" placeholder="代理店3" readonly class="form-control"
                                        value="<%= this.Model.Entity.AgentThreeName %>">
                                    <span class="input-group-addon selectPeople" id="btnGetAgentThree"><i class="fa fa-search bigger-110"></i></span>
                                    <input type="hidden" name="AgentThree" value="<%= this.Model.Entity.AgentThree %>" />
                                </div>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>成本3
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="AgentThreeCost" placeholder="成本3" readonly class="form-control text-right" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.AgentThreeCost ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.AgentThreeCost??0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>最终支付3
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="AgentThreePayment" placeholder="最终支付3" class="form-control text-right activeInput" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.AgentThreePayment ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.AgentThreePayment??0).ToString("F2") %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>报价成本
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="BidCost" placeholder="报价成本" readonly class="form-control text-right" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.BidCost ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.BidCost??0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>销售额
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="SaleAmount" placeholder="销售额" class="form-control text-right activeInput" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.SaleAmount ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.SaleAmount??0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>实际成本
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="FactCost" placeholder="实际成本" readonly class="form-control text-right" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.FactCost ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.FactCost??0).ToString("F2") %>"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>利润
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <input type="text" name="Profit" placeholder="利润" readonly class="form-control text-right" maxlength="10" data-old="<%= ((Single)(this.Model.Entity.Profit ?? 0)).ToString("F2")%>"
                                        value="<%= (this.Model.Entity.Profit??0).ToString("F2") %>"></span>
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color=""></font>是否有货损
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <div class="radio col-sm-6 no-padding-left no-padding-right">
                                    <label>
                                        <input name="form-field-radio1" type="radio" class="ace" <%= this.Model.Entity.IsDamaged != true ? "": "checked='checked'" %> onclick="$('input[name=IsDamaged]').val('true')">
                                        <span class="lbl">是 </span>
                                    </label>
                                </div>
                                <div class="radio col-sm-6 no-padding-left no-padding-right">
                                    <label>
                                        <input name="form-field-radio1" type="radio" class="ace" <%= this.Model.Entity.IsDamaged != true ? "checked='checked'" : "" %> onclick="$('input[name=IsDamaged]').val('false')">
                                        <span class="lbl">否 </span>
                                    </label>
                                </div>
                                <input type="hidden" name="IsDamaged" value="<%= this.Model.Entity.IsDamaged.HasValue ? this.Model.Entity.IsDamaged.Value.ToString().ToLower() : String.Empty %>" />
                            </div>
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color=""></font>有后续业务
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <div class="radio col-sm-6 no-padding-left no-padding-right">
                                    <label>
                                        <input name="form-field-radio2" type="radio" class="ace" <%= this.Model.Entity.HasFutureBusiness != true ? "": "checked='checked'" %> onclick="$('input[name=HasFutureBusiness]').val('true')">
                                        <span class="lbl">是 </span>
                                    </label>
                                </div>
                                <div class="radio col-sm-6 no-padding-left no-padding-right">
                                    <label>
                                        <input name="form-field-radio2" type="radio" class="ace" <%= this.Model.Entity.HasFutureBusiness != true ? "checked='checked'" : "" %> onclick="$('input[name=HasFutureBusiness]').val('false')">
                                        <span class="lbl">否 </span>
                                    </label>
                                </div>
                                <input type="hidden" name="HasFutureBusiness" value="<%= this.Model.Entity.HasFutureBusiness.HasValue ? this.Model.Entity.HasFutureBusiness.Value.ToString().ToLower() : String.Empty %>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right ">
                                <font color=""></font>客户评价
                            </label>
                            <div class="col-md-3 col-sm-3 col-xs-3 miniGroup">
                                <span>
                                    <select class="form-control activeInput" name="Comment" id="Comment" value="<%= this.Model.Entity.Comment %>">
                                        <option <%= this.Model.Entity.Comment == "优" ? "selected" : string.Empty %> value="优">优</option>
                                        <option <%= this.Model.Entity.Comment == "良" ? "selected" : string.Empty %> value="良">良</option>
                                        <option <%= this.Model.Entity.Comment == "差" ? "selected" : string.Empty %> value="差">差</option>
                                    </select></span>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                                <font color=""></font>备注
                            </label>
                            <div class="col-md-11 col-sm-11 col-xs-11 miniGroup">
                                <span>
                                    <textarea name="Memo" placeholder="备注" class="form-control activeInput" rows="3"><%= HttpUtility.HtmlEncode(this.Model.Entity.Memo) %></textarea>
                                </span>
                            </div>
                        </div>
                    </div>
                </form>

                <h4>业务流程</h4>
                <hr style="border-bottom: 1px solid #eef; margin-top: 5px;" />
                <div>
                    <div class="modal-header no-padding" id="tblFirstHead">
                        <div class="table-header" style="padding-right:2px"">
                            <input type="hidden" name="limitDate" value="<%=DateTime.Now.AddDays(Convert.ToInt32(ConfigurationManager.AppSettings["AlertDays"])).ToString("yyyy-MM-dd") %>" />
                            <div class="btn-group pull-right" style="padding-top: 4px;">
                                <button type="button" id="btnAdd" class="btn btn-warning btn-sm btn-primary no-border">
                                    <i class="ace-icon fa fa-plus align-top bigger-110" style="margin-top: 2px"></i>
                                    新增</button>
                            </div>
                            流程列表
                        </div>
                    </div>
                    <table id="tblList" class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                        <thead>
                            <tr>
                                <th class="text-center w30">序号
                                </th>
                                <th class="text-center w20">
                                    状态
                                </th>
                                <th class="text-center w150 red">步骤名称
                                </th>
                                <th class="text-center w90 red">
                                    预计完成日期
                                </th>
                                <th class="text-center w90">
                                    实际完成日期
                                </th>
                                <th class="text-center w150">备注
                                </th>
                                <th class="text-center w30">操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="hide" data-oid="00000000-0000-0000-0000-000000000000">
                                    <td class="text-center w30 icon" ></td>
                                    <td class="text-center w20 icon"><i class="fa fa-circle blue"></i></td>
                                    <td class="text-center w150"><input type="text" name="StepName" placeholder="步骤名称" class="form-control input-sm" maxlength="10" value=""></td>
                                    <td class="text-center w90">
                                        <div class="input-group">
                                            <input type="text" placeholder="预计完成日期" class="date-picker form-control input-sm" name="EstimateDate"
                                                data-date-format="yyyy-mm-dd" value="">
                                            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                                        </div>
                                    </td>
                                    <td class="text-center w90">
                                        <div class="input-group">
                                            <input type="text" placeholder="实际完成日期" class="date-picker form-control input-sm" name="FinishDate"
                                                data-date-format="yyyy-mm-dd" value="">
                                            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                                        </div>
                                    </td>
                                    <td class="text-center w150"><input type="text" name="Memo" placeholder="备注" class="form-control input-sm" maxlength="1000" value=""></td>
                                    <td class="text-center w30 icon">
                                        <i class="ace-icon fa fa-trash-o bigger-110 orange" title="删除" onclick="window.System.CustomerDetail.deleteRecord(this)"></i><i class="hide ace-icon fa fa-check green bigger-110"></i><i class="hide ace-icon fa fa-times red2 bigger-110"></i><i class="hide ace-icon fa fa-floppy-o bigger-110 blue"></i>
                                    </td>
                                
                            </tr>
                            <% var i = 1; foreach (ProcessStep entity in this.Model.StepList)
                               { %>
                            <tr data-oid="<%= entity.ID%>">
                                    <td class="text-center w30 icon" ><%= i %></td>
                                    <td class="text-center w20 icon"><i class="<%= entity.Status%>" title="<%= HttpUtility.HtmlEncode(entity.StatusTips) %>"></i></td>
                                    <td class="text-center w150"><input type="text" name="StepName" placeholder="步骤名称" class="form-control input-sm" maxlength="10" value="<%= HttpUtility.HtmlEncode(entity.StepName)%>"></td>
                                    <td class="text-center w90">
                                        <div class="input-group">
                                            <input type="text" placeholder="预计完成日期" class="date-picker form-control input-sm" name="EstimateDate"
                                                data-date-format="yyyy-mm-dd" value="<%= entity.EstimateDate.HasValue ? entity.EstimateDate.Value.ToString("yyyy-MM-dd") : string.Empty%>">
                                            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                                        </div>
                                    </td>
                                    <td class="text-center w90">
                                        <div class="input-group">
                                            <input type="text" placeholder="实际完成日期" class="date-picker form-control input-sm" name="FinishDate"
                                                data-date-format="yyyy-mm-dd" value="<%= entity.FinishDate.HasValue ? entity.FinishDate.Value.ToString("yyyy-MM-dd") : string.Empty%>">
                                            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                                        </div>
                                    </td>
                                    <td class="text-center w150"><input type="text" name="Memo" placeholder="备注" class="form-control input-sm" maxlength="1000" value="<%= HttpUtility.HtmlEncode(entity.Memo)%>"></td>
                                    <td class="text-center w30 icon">
                                        <i class="ace-icon fa fa-trash-o bigger-110 orange" title="删除" onclick="window.System.CustomerDetail.deleteRecord(this)"></i><i class="hide ace-icon fa fa-check green bigger-110"></i><i class="hide ace-icon fa fa-times red2 bigger-110"></i><i class="hide ace-icon fa fa-floppy-o bigger-110 blue"></i>
                                    </td>
                            </tr>
                            <% i++;
                               } %>
                        </tbody>
                    </table>
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
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/CustomerDetail.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
<%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>
<script src="/Front/dist/js/tools.js"></script>

<script src="/Front/dist/js/AdvanceSearch.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    function addEvent(obj) {
        obj.datepicker({
            format: 'yyyy-MM-dd',
            weekStart: 1,
            autoclose: true,
            todayBtn: 'linked',
            language: 'zh-CN'
        }).on('changeDate', function (ev) {
            //var startTime = ev.date.valueOf();
            //if (start < teach) {
            //    alert("“评估开始时间 ”不能早于“授课时间 ” ！");
            //    $("#starttime").focus();
            //}
        });
    }
</script>

