<%@ Page Language="C#" MasterPageFile="~/System/Main.Master" Inherits="BasePageView<CustomerListViewData>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetCSSLink("/Front/Controls/DialogBox.css")%>
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/Front/dist/css/datepicker.min.css">
    <link rel="stylesheet" href="/Front/dist/css/daterangepicker.min.css">
    <style>
        #tblUserList tr.selected {
            background-color: #dbfee6;
        }
        .statusBar {
            display:inline;margin-left:50px;color:white;
        }
        .statusBar .spanMoney{
            color:yellow;
        }
        .statusBar > span{
            margin-left:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-6">
        <iframe name="ifmExport" class="hide"></iframe>
    </div>
    <form class="form-search" id="formSearch" method="post" action="/AjaxCustomer/Search.cspx">
        <input type="hidden" name="pageIndex" />
        <input type="hidden" name="pageSize" />
        <input type="hidden" name="orderBy" />
        <div class="row">
            <div class="col-sm-12">
                <div class="widget-main">
                    <div class="col-xs-1 col-sm-1 no-padding-left no-padding-right">
                        <div class="input-group text-center" style="padding-top: 10px;">客户名称</div>
                    </div>
                    <div class="col-xs-5 col-sm-5">
                            <input type="text" class="form-control search-query" name="SearchKey" placeholder="输入客户名称查询" />
                    </div>
                    <div class="col-xs-1 col-sm-1 no-padding-left no-padding-right">
                        <div class="input-group text-center" style="padding-top: 10px;">公司名称</div>
                    </div>
                    <div class="col-xs-5 col-sm-5">
                            <input type="text" class="form-control search-query" name="company" placeholder="输入公司名称查询" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="widget-main">
                    <div class="col-xs-1 col-sm-1 no-padding-left no-padding-right">
                        <div class="input-group text-center" style="padding-top: 10px;">创建日期从</div>
                    </div>
                    <div class="col-xs-5 col-sm-5">
                        <div class="input-group">
                            <input type="text" placeholder="创建起始日期" class="date-picker form-control" name="from"
                                data-date-format="yyyy-mm-dd" value="">
                            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                        </div>
                    </div>
                    <div class="col-xs-1 col-sm-1 no-padding-left no-padding-right">
                        <div class="input-group text-center" style="padding-top: 10px;">到</div>
                    </div>
                    <div class="col-xs-4 col-sm-4">
                         <div class="input-group">
                            <input type="text" placeholder="创建截止日期" class="date-picker form-control" name="to"
                                data-date-format="yyyy-mm-dd" value="">
                            <span class="input-group-addon"><i class="fa fa-calendar bigger-110"></i></span>
                        </div>
                    </div>
                    <div class="col-xs-1 col-sm-1 no-padding-left">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-purple btn-sm" id="btnSearch">
                                查询<i class="icon-search icon-on-right bigger-110"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="space-6">
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="modal-content">
                <div class="modal-header no-padding" id="tblFirstHead">
                    <div class="table-header">
                        <div class="btn-group pull-right" style="padding-top: 4px;">
                            <button type="button" id="btnAdd" class="btn btn-warning btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-plus align-top bigger-110" style="margin-top: 2px"></i>
                                新增</button>
                            <button type="button" id="btnExport" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                导出到Excel</button>
                            
                            <%--<button type="button" id="btnEdit" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                编辑</button>
                            <button type="button" id="btnDelete" class="btn btn-info btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-trash align-top bigger-110" style="margin-top: 2px"></i>
                                删除</button>--%>
                        </div>
                        客户列表<div class="statusBar"><span>总报价: <span class="spanMoney" id="spnBid">0.00</span>￥</span>
                            <span>总销售额: <span class="spanMoney" id="spnSale">0.00</span>￥</span>
                            <span>总成本: <span class="spanMoney" id="spnCost">0.00</span>￥</span>
                            <span>总利润: <span class="spanMoney" id="spnProfit">0.00</span>￥</span></div>
                    </div>
                </div>
                <div id="divTbl">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/CustomerList.ascx", this.Model)%>
                </div>
                <div class="no-margin-top" id="divPagination">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.PageData)%>
                </div>
            </div>
        </div>
    </div>
    <div class="space-12">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.form.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/dist/js/bootbox.min.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/CustomerList.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

    <script src="/Front/dist/js/date-time/bootstrap-datepicker.min.js"></script>

    <script src="/Front/dist/js/date-time/daterangepicker.min.js"></script>
    <script src="/Front/dist/js/ace-elements.min.js"></script>

    <script src="/Front/dist/js/ace.min.js"></script>


    <script src="/Front/dist/js/tools.js" type="text/javascript"></script>

</asp:Content>
