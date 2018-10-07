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
                <font>操作类型</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <select class="form-control" id="selOperatorType">
                        <option value="ADD">新增</option>
                        <option value="ALTER">修改</option>
                        <option value="DELETE">删除</option>
                    </select></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>对象类型</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <select class="form-control" id="selObjectType" onchange="changeObjectType()">
                        <option value="USERTABLE">表</option>
                        <option selected value="PROCEDURE">存储过程</option>
                        <option value="FUNCTION">函数</option>
                        <option value="VIEW">视图</option>
                        <option value="FIELD">字段</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>对象名称（表）</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input class="form-control" type="text" id="txtObjectName" value="" onfocus="this.select();"
                        placeholder="表名" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control"
                id="spnField" style="display:none">
                <font>对象名称（字段）</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup" id="divField" style="display:none">
                <span>
                    <input class="form-control" type="text" id="txtObjectField" value="" onfocus="this.select();"
                        placeholder="字段名" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <div class="btn-group">
                <button type="button" id="btnExchange" class="btn btn-info" onclick="fn_getSql()">
                    <i class="fa fa-hand-o-down"></i>获取Sql</button>
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
            var o = document.getElementById("txtObjectName");

            o.focus();
            o.select();

            $(".control-label").css({ "fontSize": "10pt" });
            $("input[type=text]").css({ "fontSize": "10pt" });
            $("select").css({ "fontSize": "10pt" });
        });

        function fn_getSql() {
            var selOperatorType, selObjectType, txtObjectName, txtObjectField;
            var strOperatorType, strObjectType, strObjectName, strObjectField;
            var txtNew = document.getElementById("txtNew");

            selOperatorType = document.getElementById("selOperatorType");
            selObjectType = document.getElementById("selObjectType");
            txtObjectName = document.getElementById("txtObjectName");
            txtObjectField = document.getElementById("txtObjectField");

            strOperatorType = selOperatorType.value;
            strObjectType = selObjectType.value;
            strObjectName = txtObjectName.value;
            strObjectField = txtObjectField.value;

            switch (strObjectType) {
                case "USERTABLE":
                    getUserTableSql(strObjectName);
                    break;
                case "PROCEDURE":
                    getProcedureSql(strObjectName);
                    break;
                case "FUNCTION":
                    getFunctionSql(strObjectName);
                    break;
                case "VIEW":
                    getViewSql(strObjectName);
                    break;
                case "FIELD":
                    getFieldSql(strOperatorType, strObjectName, strObjectField);
                    break;
                default: break;
            }
            fn_setToPaste();
            txtNew.focus();
            txtNew.select();
        }

        function fn_setToPaste() {
            var strValue = document.getElementById("txtNew").value;
            window.clipboardData.setData('text', strValue);
        }

        // 表
        function getUserTableSql(strObjectName) {
            var arrReturn;

            arrReturn = [];
            arrReturn.push("IF(OBJECT_ID('" + strObjectName + "', 'U')IS NULL)");
            arrReturn.push("BEGIN");
            arrReturn.push("  CREATE TABLE [DBO].[" + strObjectName + "]");
            arrReturn.push("  (");
            arrReturn.push("  );");

            arrReturn.push("  EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = @Reference, @level0type = N'SCHEMA', @level0name = N'dbo',");
            arrReturn.push("       @level1type = N'TABLE', @level1name = '" + strObjectName + "'");
            arrReturn.push("END");
            arrReturn.push("GO");

            document.getElementById("txtNew").value = arrReturn.join("\n");
        }

        // 存储过程
        function getProcedureSql(strObjectName) {
            var arrReturn;

            arrReturn = [];
            arrReturn.push("IF(OBJECT_ID('" + strObjectName + "', 'P')IS NOT NULL)");
            arrReturn.push("BEGIN");
            arrReturn.push("  DROP PROC [DBO].[" + strObjectName + "];");
            arrReturn.push("END");
            arrReturn.push("GO");

            arrReturn.push("CREATE PROC [DBO].[" + strObjectName + "]");
            arrReturn.push("AS");
            arrReturn.push("BEGIN");
            arrReturn.push("  ");
            arrReturn.push("END");

            arrReturn.push("-- EXEC [DBO].[" + strObjectName + "]");
            arrReturn.push("GO");

            document.getElementById("txtNew").value = arrReturn.join("\n");
        }

        // 函数
        function getFunctionSql(strObjectName) {
            var arrReturn;

            arrReturn = [];
            arrReturn.push("IF(OBJECT_ID('" + strObjectName + "')IS NOT NULL)");
            arrReturn.push("BEGIN");
            arrReturn.push("  DROP FUNCTION [DBO].[" + strObjectName + "];");
            arrReturn.push("END");
            arrReturn.push("GO");

            arrReturn.push("CREATE FUNCTION [DBO].[" + strObjectName + "]");
            arrReturn.push("()");
            arrReturn.push("RETURNS TABLE");
            arrReturn.push("AS");
            arrReturn.push("BEGIN");

            arrReturn.push("  ");
            arrReturn.push("END");
            arrReturn.push("-- SELECT * FROM [DBO].[" + strObjectName + "]");
            arrReturn.push("GO");

            document.getElementById("txtNew").value = arrReturn.join("\n");
        }

        // 视图
        function getViewSql(strObjectName) {
            var arrReturn;

            arrReturn = [];
            arrReturn.push("IF(OBJECT_ID('" + strObjectName + "', 'V')IS NOT NULL)");
            arrReturn.push("BEGIN");
            arrReturn.push("  DROP VIEW [DBO].[" + strObjectName + "];");
            arrReturn.push("END");
            arrReturn.push("GO");

            arrReturn.push("CREATE VIEW [DBO].[" + strObjectName + "]");
            arrReturn.push("AS");
            arrReturn.push("  ");
            arrReturn.push("-- SELECT * FROM [DBO].[" + strObjectName + "];");
            arrReturn.push("GO");

            document.getElementById("txtNew").value = arrReturn.join("\n");
        }

        // 字段
        function getFieldSql(strOperatorType, strObjectName, strObjectField) {
            var arrReturn;

            arrReturn = [];

            if (strOperatorType == "ADD") {
                arrReturn.push("-- 添加表字段");
                arrReturn.push("IF(COL_LENGTH('" + strObjectName + "', '" + strObjectField + "') IS NULL)");
                arrReturn.push("BEGIN");
                arrReturn.push("  ALTER TABLE [DBO].[" + strObjectName + "]");
                arrReturn.push("    ADD [" + strObjectField + "] NVARCHAR(XXXX);");
                arrReturn.push("  EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = @Reference, @level0type = N'SCHEMA', @level0name = N'dbo',")
                arrReturn.push("       @level1type = N'TABLE', @level1name = '" + strObjectName + "', @level2type = N'COLUMN', @level2name = '" + strObjectField + "'");
                arrReturn.push("END");
            } else if (strOperatorType == "ALTER" || strOperatorType == "DELETE") {
                arrReturn.push("-- 修改删除表字段");
                arrReturn.push("IF(COL_LENGTH('" + strObjectName + "', '" + strObjectField + "') IS NOT NULL)");
                arrReturn.push("BEGIN");
                arrReturn.push("  ALTER TABLE [DBO].[" + strObjectName + "]");
                arrReturn.push("  ALTER COLUMN [" + strObjectField + "] MONEY;");
                arrReturn.push("  EXEC sys.sp_updateextendedproperty @name = N'MS_Description', @value = @Reference, @level0type = N'SCHEMA', @level0name = N'dbo',")
                arrReturn.push("       @level1type = N'TABLE', @level1name = '" + strObjectName + "', @level2type = N'COLUMN', @level2name = '" + strObjectField + "'");

                arrReturn.push("");
                arrReturn.push("  ALTER TABLE [DBO].[" + strObjectName + "]");
                arrReturn.push("   DROP COLUMN [" + strObjectField + "];");
                arrReturn.push("END");
            }
            arrReturn.push("GO");

            document.getElementById("txtNew").value = arrReturn.join("\n");
        }

        function changeObjectType() {
            if (document.getElementById("selObjectType").value == "FIELD") {
                document.getElementById("divField").style.display = "block";
                document.getElementById("spnField").style.display = "block";
            } else {
                document.getElementById("divField").style.display = "none";
                document.getElementById("spnField").style.display = "none";
            }
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
