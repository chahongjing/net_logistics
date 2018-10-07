<%@ Page Language="C#" MasterPageFile="~/System/Main.Master" Inherits="BasePageView<AgentCompanyListViewData>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetCSSLink("/Front/Controls/DialogBox.css")%>
    <style>
        #tblAgentCompanyList tr.selected
        {
            background-color: #dbfee6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-6">
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="widget-main">
	            <form class="form-search">
                    <div class="col-xs-2 col-sm-2 no-padding-left no-padding-right">
                        <div class="input-group text-center" style="padding-top:10px;">按名称查询</div>
                    </div>
			        <div class="col-xs-10 col-sm-10">
				        <div class="input-group">
					        <input type="text" class="form-control search-query" name="key" placeholder="输入代理公司名称查询" />
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
    <div class="row">
        <div class="col-sm-12">
            <div class="modal-content">
                <div class="modal-header no-padding" id="tblFirstHead">
                    <div class="table-header">
                        <div class="btn-group pull-right" style="padding-top: 4px;">
                            <button type="button" id="btnAdd" class="btn btn-warning btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-plus align-top bigger-110" style="margin-top: 2px"></i>
                                新增</button>
                            <%--<button type="button" id="btnAddRole" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                添加角色</button>
                            <button type="button" id="btnEdit" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                编辑</button>
                            <button type="button" id="btnDelete" class="btn btn-info btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-trash align-top bigger-110" style="margin-top: 2px"></i>
                                删除</button>--%>
                        </div>
                        代理公司列表
                    </div>
                </div>
                <div id="divTbl">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/AgentCompanyList.ascx", this.Model)%>
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
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/AgentCompanyList.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/Mask.js")%>

    <script src="/Front/dist/js/tools.js" type="text/javascript"></script>

</asp:Content>
