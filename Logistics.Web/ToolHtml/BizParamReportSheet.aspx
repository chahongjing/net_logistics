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
                <font>名称(RtsName)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtRtsName" placeholder="名称" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>模块代码(ApplyFunction)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtFunctionCode" placeholder="模块代码" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>功能点(ApplyAction)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                   <input type="text" class="form-control" id="txtActionCode" placeholder="功能点" /></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>层级编码(HierarchyCode)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                    <input type="text" class="form-control" id="txtHierarchyCode" placeholder="层级编码" />
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>是否页面报表(IsHttp)</font>
            </label>
            <div class="col-md-5 col-sm-5 col-xs-5 miniGroup">
                <span>
                   <select class="form-control" id="selIsPage">
                            <option value="1">页面报表</option>
                            <option value="0">RTS报表</option>
                        </select></span>
            </div>
            <label class="col-md-1 col-sm-1 col-xs-1 control-label no-padding-right" class="form-control">
                <font>页面地址(HttpPath)</font>
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
-- 查看
-- SELECT * FROM myAction WHERE ActionName LIKE '%事件类别TOP5%' ORDER BY ActionCode;
SELECT * FROM myAction WHERE ObjectType = '14010401' ORDER BY ActionCode;
SELECT * FROM P_Rts WHERE ApplyFunction = '14010401' ORDER BY HierarchyCode;

-- 添加一个新分组
DELETE FROM P_Rts WHERE RtsGuid = 'C0634572-AD1F-466E-8DAF-60F8FBFF1742';
INSERT INTO P_Rts(RtsGuid, RtsName, ApplySys, ApplyFunction, ApplyAction, HierarchyCode, IsRts, IsHttp, HttpPath)
VALUES ('C0634572-AD1F-466E-8DAF-60F8FBFF1742', 'ITSM报表', '1201', '12010801', '', '12010801.04', 0,  0, NULL);

-- 更新报表名称
UPDATE myAction SET ActionName = '', Comments = '' + '报表' WHERE ActionGUID = ''
UPDATE P_Rts SET RtsName = B.ActionName
  FROM P_Rts
 INNER JOIN myAction AS B ON ApplyFunction = B.ObjectType AND ApplyAction = B.ActionCode
 WHERE ObjectType = '12010801';

-- 添加模块
GO
--费用报表挂接
DELETE FROM e_myFunction WHERE FunctionGUID='7fd35371-de41-e311-bc1b-00155d0a2505'
INSERT INTO e_myFunction (FunctionGUID,Application,HierarchyCode,ParentHierarchyCode,Level,IsDummy,IsIncrement,UseScope,FunctionCode,FunctionName,ParentFunctionGUID,IsDisabled,FunctionUrl,FunctionIcon,FunctionBigIcon,Comments,IsLastStage,FunctionType) 
VALUES (N'7fd35371-de41-e311-bc1b-00155d0a2505','0404','01.08','01','1','0','0','0','04040108','统计报表','d13dcabb-ba59-43e5-b86a-e158f2b3e32f','0','/CWGL/Rts/Report_main_Fygl.aspx','/_imgs/ico_16_1.gif','/_imgs/ico_16_1.gif','','1','功能')
GO
-- 查询功能点
DELETE FROM myAction WHERE ActionGUID='bb7d5962-df41-e311-bc1b-00155d0a2505'
INSERT INTO myAction (ActionGUID,ObjectType,ActionCode,ActionName,Assembly,InvokeClass,InvokeFunction,Comments) 
VALUES (N'bb7d5962-df41-e311-bc1b-00155d0a2505','04040108','00','查询','','','','')
GO

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

            $("#txtRtsName")[0].select();
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
            var optionData = {}, jReturn, jReturnTwo;

            optionData.async = false;
            optionData.url = "/AjaxToolHtml/GetGuid.cspx?random=" + Math.random();
            jReturn = processAjax(optionData);
            optionData.url = "/AjaxToolHtml/GetGuid.cspx?random=" + Math.random();
            jReturnTwo = processAjax(optionData);

            if (jReturn.Status != "OK") {
                alert(jReturn.Message);
                return;
            }
            if (jReturnTwo.Status != "OK") {
                alert(jReturnTwo.Message);
                return;
            }

            arrResult = [];
            arrResult.push("USE [XXX];");
            arrResult.push("-- 报表功能点")
            arrResult.push("DELETE FROM [dbo].[myAction] WHERE [ActionGUID] = '" + jReturn.Value + "';")
            arrResult.push("INSERT INTO [dbo].[myAction] ([ActionGUID], [ObjectType], [ActionCode], [ActionName], [Assembly],")
            arrResult.push("       [InvokeClass], [InvokeFunction], [Comments])")
            arrResult.push("VALUES (N'" + jReturn.Value + "', '" + $("#txtFunctionCode").val().replace(reg, "''") + "', '" + $("#txtActionCode").val().replace(reg, "''") + "', '" + $("#txtRtsName").val().replace(reg, "''") + "', '',")
            arrResult.push("       '', '', '" + $("#txtRtsName").val().replace(reg, "''") + "报表');")
            arrResult.push("-- 报表挂接")
            arrResult.push("DELETE FROM [dbo].[P_Rts] WHERE [RtsGuid] = '" + jReturnTwo.Value + "';")
            arrResult.push("INSERT INTO [dbo].[P_Rts]([RtsGuid], [RtsName], [ApplySys], [ApplyFunction], [ApplyAction],")
            arrResult.push("       [HierarchyCode], [IsRts], [IsHttp], [HttpPath])")
            arrResult.push("VALUES ('" + jReturnTwo.Value + "', '" + $("#txtRtsName").val().replace(reg, "''") + "', '" + $("#txtFunctionCode").val().substring(0, 4).replace(reg, "''") + "', '" + $("#txtFunctionCode").val().replace(reg, "''") + "', '" + $("#txtActionCode").val().replace(reg, "''") + "',")
            arrResult.push("       '" + $("#txtHierarchyCode").val().replace(reg, "''") + "', 1, " + $("#selIsPage").val().replace(reg, "''") + ", '" + $("#txtUrl").val().replace(reg, "''") + "');")
            arrResult.push("GO;")

            return arrResult.join("\n");
        }
    </script>

</asp:Content>
