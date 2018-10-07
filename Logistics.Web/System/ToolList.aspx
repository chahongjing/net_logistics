<%@ Page Language="C#" MasterPageFile="~/System/Main.Master" Inherits="BasePageView<object>" Title="工具列表" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
<div class="col-xs-12">
	<h3 class="header smaller lighter green">工具列表</h3>

	<p>
		<a href="/ToolHtml/SqlVbCs.aspx" class="btn btn-yellow btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-refresh bigger-230" style="display:block;"></i>
			Sql<->C#
			<%--<span class="badge badge-pink">+3</span>--%>
		</a>
		<a href="/ToolHtml/AutoCompleteSql.aspx" class="btn btn-success btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-lastfm bigger-230" style="display:block;"></i>
			Sql生成器
			<%--<span class="label label-inverse arrowed-in">6+</span>--%>
		</a>
		<a href="/ToolHtml/TableToObject.aspx" class="btn btn-warning btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-code bigger-230" style="display:block;"></i>
			实体生成器
		</a>
		<a href="/ToolHtml/AutoCompleteReference1.aspx" class="btn btn-primary btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-info-circle bigger-230" style="display:block;"></i>
			函数注释
			<%--<span class="badge badge-warning badge-left">11</span>--%>
		</a>
		<a href="/ToolHtml/ReplaceChar.aspx" class="btn btn-info btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-exchange bigger-230" style="display:block;"></i>
			字符替换
		</a>
		<a href="/ToolHtml/BizParamInner.aspx" class="btn btn-danger btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-server bigger-230" style="display:block;"></i>
			业务参数
		</a>
		<a href="/ToolHtml/BizParamReportSheet.aspx" class="btn btn-purple btn-app radius-4" target="_blank">
			<i class="icon-cog fa fa-bar-chart bigger-230" style="display:block;"></i>
			报表功能点
		</a>

		<%--<a href="#" class="btn btn-app btn-primary no-radius">
			<i class="icon-edit bigger-230"></i>
			编辑
			<span class="badge badge-warning badge-left">11</span>
		</a>

		<a href="#" class="btn btn-app btn-success">
			<i class="icon-refresh bigger-230"></i>
			Reload
		</a>

		<button class="btn btn-app btn-warning">
			<i class="icon-undo bigger-230"></i>
			Undo
		</button>

		<a href="#" class="btn btn-app btn-info btn-sm no-radius">
			<i class="icon-envelope bigger-200"></i>
			Mailbox
			<span class="label label-inverse arrowed-in">6+</span>
		</a>

		<button class="btn btn-app btn-danger btn-sm">
			<i class="icon-trash bigger-200"></i>
			Delete
		</button>

		<button class="btn btn-app btn-purple btn-sm">
			<i class="icon-cloud-upload bigger-200"></i>
			Upload
		</button>

		<button class="btn btn-app btn-pink btn-sm">
			<i class="icon-share-alt bigger-200"></i>
			Share
		</button>

		<button class="btn btn-app btn-inverse btn-xs">
			<i class="icon-lock bigger-160"></i>
			Lock
		</button>

		<button class="btn btn-app btn-grey btn-xs radius-4">
			<i class="icon-save bigger-160"></i>

			Save
			<span class="badge badge-transparent">
				<i class="light-red icon-asterisk"></i>
			</span>
		</button>

		<button class="btn btn-app btn-light btn-xs">
			<i class="icon-print bigger-160"></i>
			Print
		</button>

		<a href="#" class="btn btn-app btn-yellow btn-xs">
			<i class="icon-shopping-cart bigger-160"></i>
			Shop
		</a>--%>
	</p>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">
</asp:Content>
