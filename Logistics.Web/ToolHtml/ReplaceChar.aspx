<%@ Page Language="C#" MasterPageFile="~/ToolHtml/Main.Master" Inherits="BasePageView<object>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-12">
    </div>
    <div class="row no-margin-right no-padding-right">
        <div class="form-group">
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <div class="input-group">
                        <span class="input-group-addon">将</span>
                        <input class="form-control input-mask-phone" type="text" id="txtFrom" name="txtFrom"
                            title="页码" data-last-value="" />
                    </div>
                </span>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <div class="input-group">
                        <span class="input-group-addon">替换为</span>
                        <input class="form-control input-mask-phone" type="text" id="txtTo" name="txtTo"
                            title="页码" data-last-value="" />
                    </div>
                </span>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 miniGroup">
            <button type="button" id="btnExchange" class="btn btn-info" onclick="fn_convert()">
                    <i class="fa fa-hand-o-down"></i>转换并复制到剪贴板</button>
            </div>
        </div>
    </div>
    <div class="space-12">
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-6">
            <textarea id="txtOld" class="txt" rows="20" cols="150" style="width: 100%;" placeholder="输入信息后得出结果"
                ></textarea>
                </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
            <textarea id="txtNew" class="txt" rows="20" cols="150" style="width: 100%;" placeholder="输入信息后得出结果"
                readonly="readonly"></textarea>
                </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">

    <script type="text/javascript">
        $(function() {
            var txtOld = document.getElementById("txtOld");
            txtOld.focus();
            $(".control-label").css({ "fontSize": "10pt" });
            $("input[type=text]").css({ "fontSize": "10pt" });
            $("select").css({ "fontSize": "10pt" });
            $(".control-label").width(60);
            $(".controls").css({ "marginLeft": 80 });
        });
        function fn_convert() {
            var txtNew = document.getElementById("txtNew");

            replaceChar();

            fn_setToPaste();
            txtNew.focus();
            txtNew.select();
        }

        //转义HTML中的特殊字符到正常显示
        function replaceChar() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var txtFrom = document.getElementById("txtFrom");
            var txtTo = document.getElementById("txtTo");
            var reg = new RegExp(txtFrom.value, "g");

            txtNew.value = txtOld.value.replace(reg, txtTo.value);
        }

        //将处理后的结果放到剪贴板中
        function fn_setToPaste() {
            var strValue = document.getElementById("txtNew").value;
            window.clipboardData.setData('text', strValue);
        }
    </script>

</asp:Content>
