<%@ Page Language="C#" MasterPageFile="~/ToolHtml/Main.Master" Inherits="BasePageView<object>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-12">
    </div>
    <div class="row no-margin-right no-padding-right">
        <div class="col-md-9 col-sm-9 col-xs-9">
            <select id="selType" style="margin: auto; width: 100%; height: 40px; font-size: 10pt;"
                onchange="setInfo()">
                <option value="sqlToVb">SQL -> VB中的SQL</option>
                <option value="vbToSql">VB -> SQL中的SQL</option>
                <option value="sqlToVbStringBuilder">SQL -> VB中的SQL(StringBuilder)</option>
                <option value="VbToSqlStringBuilder">VB中的SQL -> SQL(StringBuilder)</option>
                <option value="convertSqlToCS">SQL -> C#中的SQL</option>
                <option value="convertCSToSql">C#中的SQL -> SQL</option>
                <option value="convertSqlToCSStringBuilder">SQL -> C#中的SQL(StringBuilder)</option>
                <option value="convertCsToSqlStringBuilder">C# =中的SQL-> Sql(StringBuilder)</option>
                <option value="trimSql">去掉数据库文本后的空格</option>
                <option value="addSpaceBefore">文本前加空格</option>
                <option value="specialChar">HTML特殊字符编码</option>
                <option value="convertSpecialCharToNormal">HTML特殊字符解码</option>
            </select>
        </div>
        <div class="col-md-1 col-sm-1 col-xs-1">
            <input type="text" id="txtNumber" style="width: 30px; display: none;" />
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
            <button type="button" id="btnExchange" class="btn btn-info" value="转换并复制到剪贴板" onclick="fn_convert()">
                <i class="fa fa-hand-o-down"></i>转换并复制到剪贴板</button>
        </div>
    </div>
    <div class="space-12">
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-6">
            <textarea id="txtOld" class="txt" rows="25" cols="150" style="width: 100%; font-size: 9pt;"
                placeholder="输入要转换的文本"></textarea></div>
        <div class="col-md-6 col-sm-6 col-xs-6">
            <textarea id="txtNew" class="txt" rows="25" cols="150" style="width: 100%; font-size: 9pt;"
                placeholder="在上面的文本框中输入要转换的文本获取结果" readonly="readonly"></textarea></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">

    <script type="text/javascript">
        $(function() {
            var txtOld = document.getElementById("txtOld");
            txtOld.focus();
        });
        function fn_convert() {
            var strSelect = document.getElementById("selType");
            var txtNew = document.getElementById("txtNew");

            switch (strSelect.value.toUpperCase()) {
                //从Sql转到VB中                                            
                case "sqlToVb".toUpperCase():
                    convertSqlToVb();
                    break;
                //从VB转到Sql中                 
                case "vbToSql".toUpperCase():
                    convertVbToSql();
                    break;
                //从sql转到vb中StringBuilder                  
                case "sqlToVbStringBuilder".toUpperCase():
                    convertSqlToVbStringBuilder();
                    break;
                //从vb转到sql中StringBuilder                 
                case "VbToSqlStringBuilder".toUpperCase():
                    convertVbToSqlStringBuilder();
                    break;
                //从Sql转到C#中                    
                case "convertSqlToCS".toUpperCase():
                    convertSqlToCS();
                    break;
                //从C#中转到Sql中                 
                case "convertCSToSql".toUpperCase():
                    convertCSToSql();
                    break;
                //从Sql转到C#中StringBuilder                 
                case "convertSqlToCSStringBuilder".toUpperCase():
                    convertSqlToCSStringBuilder();
                    break;
                //从C#中的Sql转到sql StringBuilder                 
                case "convertCsToSqlStringBuilder".toUpperCase():
                    convertCsToSqlStringBuilder();
                    break;
                //去掉数据库文本后的空格                    
                case "trimSql".toUpperCase():
                    trimSql();
                    break;
                //文本前添加空格        
                case "addSpaceBefore".toUpperCase():
                    addSpaceBefore();
                    break;
                //特殊字符转义                                          
                case "specialChar".toUpperCase():
                    convertSpecialChar();
                    break;
                //转义HTML中的特殊字符到正常显示                 
                case "convertSpecialCharToNormal".toUpperCase():
                    convertSpecialCharToNormal();
                    break;
                default: break;
            }

            fn_setToPaste();
            txtNew.focus();
            txtNew.select();
        }

        //从Sql转到VB中
        function convertSqlToVb() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;
            var regExp = /\t/g;

            intLength = arrOld.length;
            if (txtOld.value == "") {
                return false;
            } else if (intLength == 1) {
                arrOld[0] = "\"" + arrOld[0] + "\"";
                txtNew.value = arrOld.join("\n");
                return true;
            }
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = "\"" + arrOld[i].replace(regExp, "").rightTrim() + " \" & _";
            }
            arrOld[i] = "\"" + arrOld[i].replace(regExp, "").rightTrim() + "\"";
            txtNew.value = arrOld.join("\n");
        }
        //从VB转到Sql中
        function convertVbToSql() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");

            var arrOld = txtOld.value.replace(/\" & _/g, "").split("\n");
            var intLength = arrOld.length;
            var i;

            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = arrOld[i].trim().replace(/^\"/g, "");
            }
            arrOld[i] = arrOld[i].trim().replace(/^\"|\"$/g, "");
            txtNew.value = arrOld.join("\n");
        }
        //从sql转到vb中StringBuilder
        function convertSqlToVbStringBuilder() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;

            intLength = arrOld.length;
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = (i % 5 == 0 && i > 0 ? "\n" : "") + "sbSql.Append(\"" + arrOld[i].rightTrim() + " \")";
            }
            arrOld[i] = "sbSql.Append(\"" + arrOld[i].rightTrim() + "\")";
            txtNew.value = arrOld.join("\n");
        }
        //从vb转到sql中StringBuilder
        function convertVbToSqlStringBuilder() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;

            intLength = arrOld.length;
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = arrOld[i].replace(/^.*\.Append\(\"/g, "").replace(/\"\).{0,1}$/g, "").rightTrim();
            }
            arrOld[i] = arrOld[i].replace(/^.*\.Append\(\"/g, "").replace(/\"\).{0,1}$/g, "").rightTrim();
            txtNew.value = arrOld.join("\n");
        }
        //从Sql转到C#中
        function convertSqlToCS() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;
            var regExp = /\t/g;

            intLength = arrOld.length;
            if (txtOld.value == "") {
                return false;
            } else if (intLength == 1) {
                arrOld[0] = "\"" + arrOld[0] + "\"";
                txtNew.value = arrOld.join("\n");
                return true;
            }
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = "\"" + arrOld[i].replace(regExp, "").rightTrim() + " \" +";
            }
            arrOld[i] = "\"" + arrOld[i].replace(regExp, "").rightTrim() + "\"";
            txtNew.value = arrOld.join("\n");
        }
        //从C#中转到Sql中
        function convertCSToSql() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");

            var arrOld = txtOld.value.split("\n");
            var intLength = arrOld.length;
            var i;

            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = arrOld[i].trim().replace(/^\"/g, "").replace(/\" +.{0,1}$/g, "").rightTrim();
            }
            arrOld[i] = arrOld[i].trim().replace(/^\"/g, "").replace(/\".{0,1}$/g, "").rightTrim();
            txtNew.value = arrOld.join("\n");
        }
        //从sql转到C#中StringBuilder
        function convertSqlToCSStringBuilder() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;

            intLength = arrOld.length;
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = (i % 5 == 0 && i > 0 ? "\n" : "") + "sbSql.Append(\"" + arrOld[i].rightTrim() + " \");";
            }
            arrOld[i] = "sbSql.Append(\"" + arrOld[i].rightTrim() + "\");";
            txtNew.value = arrOld.join("\n");
        }
        //从C#转到sql中StringBuilder
        function convertCsToSqlStringBuilder() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;

            intLength = arrOld.length;
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = arrOld[i].replace(/^.*\.Append\(\"/g, "").replace(/\"\);.{0,1}$/g, "").rightTrim();
            }
            arrOld[i] = arrOld[i].replace(/^.*\.Append\(\"/g, "").replace(/\"\);.{0,1}$/g, "").rightTrim();
            txtNew.value = arrOld.join("\n");
        }
        //去掉数据库文本后的空格
        function trimSql() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength;
            var regExp = /\t/g;

            intLength = arrOld.length;
            if (txtOld.value == "") {
                return false;
            } else if (intLength == 1) {
                arrOld[0] = "\"" + arrOld[0] + "\"";
                txtNew.value = arrOld.join("\n");
                return true;
            }
            for (i = 0; i < intLength - 1; i++) {
                arrOld[i] = arrOld[i].replace(regExp, "").rightTrim();
            }
            arrOld[i] = arrOld[i].replace(regExp, "").rightTrim();
            txtNew.value = arrOld.join("\n");
        }
        //文本前添加空格
        function addSpaceBefore() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var arrOld = txtOld.value.split("\n");
            var i, intLength, spaceCount;
            var space;

            intLength = arrOld.length;
            if (txtOld.value == "") {
                return false;
            }
            spaceCount = parseInt(document.getElementById("txtNumber").value);
            if (isNaN(spaceCount) || spaceCount < 1) {
                alert("请输入正数字!");
                return false;
            }
            space = "";
            for (i = 0; i < spaceCount; i++) {
                space += " ";
            }
            for (i = 0; i < intLength; i++) {
                arrOld[i] = space + arrOld[i].trim();
            } 
            txtNew.value = arrOld.join("\n");
        }
        //转义HTML中的特殊字符
        function convertSpecialChar() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");
            var regExp = /[<>&'"]/g;

            txtNew.value = txtOld.value.replace(regExp, function(strChar, intPosition, strOldText) {
                switch (strChar) {
                    case "<":
                        return "&lt;";
                        break;
                    case ">":
                        return "&gt;";
                        break;
                    case "&":
                        return "&amp;";
                        break;
                    case "'":
                        return "&acute;";
                        break;
                    case "\"":
                        return "&quot;";
                        break;
                    default:
                        return strChar;
                        break;
                }
            }
            );
        }

        function setInfo() {
            var strSelect = document.getElementById("selType");

            switch (strSelect.value.toUpperCase()) {
                //从Sql转到VB中        
                case "addSpaceBefore".toUpperCase():
                    convertSqlToVb();
                    $("#txtNumber").show();
                    break;
                //从VB转到Sql中          
                default:
                    $("#txtNumber").hide();
                    break;
            }
        }

        //转义HTML中的特殊字符到正常显示
        function convertSpecialCharToNormal() {
            var txtOld = document.getElementById("txtOld");
            var txtNew = document.getElementById("txtNew");

            txtNew.value = txtOld.value.replace(/&acute;/g, "<").replace(/&quot;/g, ">").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&");
        }

        //将处理后的结果放到剪贴板中
        function fn_setToPaste() {
            var strValue = document.getElementById("txtNew").value;
            window.clipboardData.setData('text', strValue);
        }

        // 用正则表达式去掉字符串前后空格
        String.prototype.trim = function() {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }
        // 用正则表达式去掉字符串前面的空格
        String.prototype.leftTrim = function() {
            return this.replace(/^\s*/g, "");
        }
        // 用正则表达式去掉字符串后面的空格
        String.prototype.rightTrim = function() {
            return this.replace(/\s*$/g, "");
        }
    </script>

</asp:Content>
