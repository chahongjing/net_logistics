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
                <font>函数注释类型</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <select class="form-control" id="selType">
                        <option value="JS">JS</option>
                        <option value="VB">VB</option>
                        <option value="CS">CS</option>
                    </select></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>函数名称</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input class="form-control" type="text" id="txtFunctionName" placeholder="函数名称" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>函数功能</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input class="form-control" type="text" id="txtFunction" placeholder="函数功能" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>创 建 人</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input class="form-control" type="text" id="txtCreateBy" placeholder="创建人" />
                </span>
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
                switch (strType.toUpperCase()) {
                    // JS函数注释           
                    case "JS".toUpperCase():
                        convertToJSReference();
                        break;
                    // VB函数注释           
                    case "VB".toUpperCase():
                        convertToVBReference();
                        break;
                    // CS函数注释           
                    case "CS".toUpperCase():
                        convertToCSReference();
                        break;
                    default:
                        break;
                }
                fn_setToPaste();
                txtNew.focus();
                txtNew.select();
            });

            $(".text").focus(function() {
                this.select();
            });

            $("#txtFunctionName")[0].select();
            $(".control-label").css({ "fontSize": "10pt" });
            $("input[type=text]").css({ "fontSize": "10pt" });
            $("select").css({ "fontSize": "10pt" });
        });
        function fn_setToPaste() {
            var strValue = document.getElementById("txtNew").value;
            window.clipboardData.setData('text', strValue);
        }
        // JS函数注释
        function convertToJSReference() {
            var arrResult;
            var strCreateBy, strSpace;

            strCreateBy = $("#txtCreateBy").val();
            if (strCreateBy == "") {
                strCreateBy = "zengjy01";
            }

            strSpace = "            ";
            arrResult = [];
            arrResult.push(strSpace + "// 函数名称： " + $("#txtFunctionName").val());
            arrResult.push(strSpace + "// 函数功能： " + $("#txtFunction").val());
            arrResult.push(strSpace + "// 函数参数： 无");
            arrResult.push(strSpace + "// 返 回 值： 无");
            arrResult.push(strSpace + "// 创 建 人： " + strCreateBy);
            arrResult.push(strSpace + "// 创建日期： " + (new Date()).format("yyyy-MM-dd HH:mm:ss"));
            arrResult.push(strSpace + "function " + $("#txtFunctionName").val() + "() {");
            arrResult.push(strSpace + "    var optionData = {}, jReturn;");
            arrResult.push(strSpace + "    optionData.getData = {};");
            arrResult.push(strSpace + "    ");
            arrResult.push(strSpace + "    optionData.url = \"/XXXX.cspx\";");
            arrResult.push(strSpace + "    optionData.ywType = \"xxxx\";");
            arrResult.push(strSpace + "    optionData.getData.oid = appForm.oid.value;");
            arrResult.push(strSpace + "    ");
            arrResult.push(strSpace + "    jReturn = processAjax(optionData);");
            arrResult.push(strSpace + "    if(jReturn.Status == \"OK\") {");
            arrResult.push(strSpace + "        return jReturn.Value;");
            arrResult.push(strSpace + "    } else {");
            arrResult.push(strSpace + "        alert(jReturn.Message);");
            arrResult.push(strSpace + "        return \"\";");
            arrResult.push(strSpace + "    }");
            arrResult.push(strSpace + "}");

            $("#txtNew").val(arrResult.join("\n"));
        }
        // VB函数注释
        function convertToVBReference() {
            var arrResult;
            var strCreateBy;

            strCreateBy = $("#txtCreateBy").val();
            if (strCreateBy == "") {
                strCreateBy = "zengjy01";
            }

            arrResult = [];
            arrResult.push("''' 函数名称： " + $("#txtFunctionName").val());
            arrResult.push("''' 函数功能： " + $("#txtFunction").val());
            arrResult.push("''' 函数参数： 无");
            arrResult.push("''' 返 回 值： 无");
            arrResult.push("''' 创 建 人： " + strCreateBy);
            arrResult.push("''' 创建日期： " + (new Date()).format("yyyy-MM-dd HH:mm:ss"));
            arrResult.push("Private Function " + $("#txtFunctionName").val() + "() As String");
            arrResult.push("    Dim sql As String");
            arrResult.push("    Dim ret As Result");
            arrResult.push("    Dim dt As DataTable");
            arrResult.push("");
            arrResult.push("    sql = \"\" & _");
            arrResult.push("    \"\"");
            arrResult.push("");
            arrResult.push("    Try");
            arrResult.push("        dt = MyDB.GetDataTable(sql)");
            arrResult.push("    Catch ex As Exception");
            arrResult.push("        dt = New DataTable");
            arrResult.push("    End Try");
            arrResult.push("");
            arrResult.push("    If (dt.Rows.Count > 0) Then");
            arrResult.push("        ret = New Result(\"OK\")");
            arrResult.push("    ElseIf (dt.Rows.Count = 0) Then");
            arrResult.push("        ret = New Result(\"NO\", \"未找到数据！\")");
            arrResult.push("    Else");
            arrResult.push("        ret = New Result(\"ERROR\", \"数据库错误！\")");
            arrResult.push("    End If");
            arrResult.push("    Return ret.ToString()");
            arrResult.push("End Function");

            $("#txtNew").val(arrResult.join("\n"));
        }
        // CS函数注释
        function convertToCSReference() {
            var arrResult;
            var strCreateBy;

            strCreateBy = $("#txtCreateBy").val();
            if (strCreateBy == "") {
                strCreateBy = "zengjy01";
            }

            arrResult = [];
            arrResult.push("/// 函数名称： " + $("#txtFunctionName").val());
            arrResult.push("/// 函数功能： " + $("#txtFunction").val());
            arrResult.push("/// 函数参数： 无");
            arrResult.push("/// 返 回 值： 无");
            arrResult.push("/// 创 建 人： " + strCreateBy);
            arrResult.push("/// 创建日期： " + (new Date()).format("yyyy-MM-dd HH:mm:ss"));

            $("#txtNew").val(arrResult.join("\n"));
        }
    </script>

</asp:Content>
