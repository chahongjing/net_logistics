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
                <font>名称(ParamNameChn)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtParamValueChn" placeholder="名称" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>英文名称(ParamName)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtParamValue" placeholder="英文名称" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>应用程序(Application)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                     <input type="text" class="form-control" id="txtApplication" placeholder="应用程序" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>分组名称(GroupName)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtGroupName" placeholder="分组名称" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>分组序号(GroupOrder)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                     <input type="text" class="form-control" id="txtGroupOrder" placeholder="分组序号" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font> 组内序号(ParamOrder)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtParamOrder" placeholder="组内序号" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>参数层级(LevelLimit)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtLevel" placeholder="参数层级" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>参数宽度(ParamWidth)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtWidth" placeholder="参数宽度" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>类型(ParamType)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                     <select id="selType">
                            <option value="列表选项">列表选项</option>
                            <option value="定制扩展">定制扩展</option>
                        </select></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>页面地址(Url)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtUrl" placeholder="页面地址" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <div class="btn-group">
                <button type="button" id="btnExchange" class="btn btn-info">
                    <i class="fa fa-hand-o-down"></i> 转换并复制到剪贴板</button>
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
     <div class="space-12">
    </div>
    <div class="row no-padding-left no-padding-right no-margin-left no-margin-right">
    <pre>
--查看参数设置
SELECT * FROM myBizParamGroup WHERE Application = '明源CRM' ORDER BY GroupOrder, ParamOrder;
    
--查看一个分组下所有参数
SELECT A.ParamName, ParamNameChn, A.ParamOrder, B.ParamOrder, *
  FROM myBizParamRegist AS A
 INNER JOIN myBizParamGroup AS B ON A.ParamName = B.ParamName
 WHERE B.Application = '项目开发管理'
   AND B.GroupName = '基础资料'
 ORDER BY A.ParamOrder;
--更改参数位置
UPDATE myBizParamGroup SET ParamOrder = 7 WHERE ParamName = 'yx_MailType';
UPDATE myBizParamRegist SET ParamOrder = A.ParamOrder
  FROM myBizParamRegist
 INNER JOIN myBizParamGroup AS A ON myBizParamRegist.ParamName = A.ParamName
 WHERE A.ParamName = 'yx_MailType';
-- 查找分组下的明细 
SELECT A.ParamName, A.ParamNameChn, A.ParamType, A.ParamWidth, A.LevelLimit, B.*, A.*
  FROM myBizParamRegist AS A
  LEFT JOIN myBizParamOption AS B ON A.ParamName = B.ParamName
 WHERE A.ParamName = 'cwxt_HqCnt'

-- 获取分类
SELECT * FROM myBizParamOption
WHERE ParamValue = '商机确认'
-- 获取业务参数
SELECT * FROM myBizParamOption
WHERE ParamName = 'Yx_GjState'
ORDER BY ParamCode
    
    </pre>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">

    <script type="text/javascript">
        $(function() {
            $("#btnExchange").click(function() {
                var strType;
                var txtNew;

                txtNew = document.getElementById("txtNew");

                txtNew.value = getParamSql();
                fn_setToPaste();
                txtNew.focus();
                txtNew.select();
            });

            $(".text").focus(function() {
                this.select();
            });

            $("#txtParamValue")[0].select();
            $(".control-label").css({ "fontSize": "10pt" });
            $("input[type=text]").css({ "fontSize": "10pt" });
            $("select").css({ "fontSize": "10pt" });
        });
        function fn_setToPaste() {
            var strValue = document.getElementById("txtNew").value;
            window.clipboardData.setData('text', strValue);
        }

        function getParamSql() {
            var arrResult;
            var reg = /'/g;

            arrResult = [];
            arrResult.push("USE [XXX];");
            arrResult.push("DELETE FROM [dbo].[myBizParamGroup] WHERE [ParamName] = '" + $("#txtParamValue").val().replace(reg, "''") + "';")
            arrResult.push("DELETE FROM [dbo].[myBizParamRegist] WHERE [ParamName] = '" + $("#txtParamValue").val().replace(reg, "''") + "';")
            arrResult.push("INSERT INTO [dbo].[myBizParamGroup] ([ParamName], [Application], [GroupName], [GroupOrder], [ParamOrder])")
            arrResult.push("VALUES ('" + $("#txtParamValue").val().replace(reg, "''") + "', '" + $("#txtApplication").val().replace(reg, "''") + "', '" + $("#txtGroupName").val().replace(reg, "''") + "', " + $("#txtGroupOrder").val().replace(reg, "''") + ", " + $("#txtParamOrder").val().replace(reg, "''") + ");")
            arrResult.push("INSERT INTO [dbo].[myBizParamRegist] ([ParamName], [ParamNameChn], [ParamGroup], [ParamOrder], [ParamType],")
            arrResult.push("       [Scope], [LevelLimit], [ParamWidth], [Description], [Url],")
            arrResult.push("       [Application])")
            arrResult.push("VALUES ('" + $("#txtParamValue").val().replace(reg, "''") + "', '" + $("#txtParamValueChn").val().replace(reg, "''") + "', '" + $("#txtGroupName").val().replace(reg, "''") + "', " + $("#txtParamOrder").val().replace(reg, "''") + ", '" + $("#selType").val().replace(reg, "''") + "',")
            arrResult.push("        '集团', " + $("#txtLevel").val().replace(reg, "''") + ", " + $("#txtWidth").val().replace(reg, "''") + ", '" + $("#txtParamValueChn").val().replace(reg, "''") + "', '" + $("#txtUrl").val().replace(reg, "''") + "',")
            arrResult.push("        '" + $("#txtApplication").val().replace(reg, "''") + "');")
            arrResult.push("GO;")

            return arrResult.join("\n");
        }
    </script>

</asp:Content>
