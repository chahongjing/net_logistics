<%@ Page Language="C#" MasterPageFile="~/ToolHtml/Main.Master" Inherits="BasePageView<object>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-12">
    </div>
    <div class="row no-margin-right no-padding-right">
        <form class="form-horizontal" id="formNavigation" role="form">
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>数据源</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtDataSource" placeholder="数据源" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>数据库名称</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtDbName" placeholder="数据库名称" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>用户名</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtUserName" placeholder="用户名" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>密 码</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtPassword" placeholder="密 码" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>表 名</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtTableName" placeholder="表 名" /></span>
            </div>
        </div>
        <div class="form-group">
            <div class="btn-group">
                <button type="button" id="btnExchange" class="btn btn-info">
                    <i class="fa fa-hand-o-down"></i>转换并复制到剪贴板</button>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5">
            </div>
        </div>
        </form>
    </div>
    <div class="space-12">
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <textarea id="txtNew" class="txt" rows="20" cols="150" style="width: 100%;" placeholder="输入信息后得出结果"
                readonly="readonly"></textarea></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">

    <script type="text/javascript">
        $(function() {
            $("#btnExchange").click(function() {
                var strType;
                var txtNew;

                txtNew = document.getElementById("txtNew");
                strType = $("#selType").val();
                getClassInfo();
                fn_setToPaste();
                txtNew.focus();
                txtNew.select();
            });

            $(".text").focus(function() {
                this.select();
            });

            $("#txtTableName")[0].select();
            $(".control-label").css({ "fontSize": "10pt" });
            $("input[type=text]").css({ "fontSize": "10pt" });
            $("select").css({ "fontSize": "10pt" });
        });

        function getClassInfo() {
            $.ajax({
                url: "/AjaxToolHtml/GetClassInfo.cspx",
                data: { "TableName": $("#txtTableName").val(),
                    "DataSource": $("#txtDataSource").val(),
                    "DbName": $("#txtDbName").val(),
                    "UserId": $("#txtUserName").val(),
                    "Password": $("#txtPassword").val()
                },
                dataType: "json",
                type: "post",
                success: function(data) { $("#txtNew").val(data.Value); }
            });
        }

        //将处理后的结果放到剪贴板中
        function fn_setToPaste() {
            var strValue = document.getElementById("txtNew").value;
            window.clipboardData.setData('text', strValue);
        }
    </script>

</asp:Content>
