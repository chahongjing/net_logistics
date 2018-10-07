<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<object>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" method="post" action="/AjaxUser/TestForm.cspx">
    <input type="text" name="UserName" />
    <input type="text" name="UserCode" />
    <input type="button" value="提交" id="btnSubmit" />
    </form>
    <div>
        下面是列表数据
    </div>
    <table>
        <form>
        <tr>
            <td>
                <input type="text" name="Remark" />
            </td>
            <td>
                <label>
                    <input type="radio" name="Sex" value="1" />男</label>
                <label>
                    <input type="radio" name="Sex" value="2" />女</label>
            </td>
            <td>
                <label>
                    <input type="checkbox" name="Interest" value="书" />书</label>
                <label>
                    <input type="checkbox" name="Interest" value="电影" />电影</label>
                <label>
                    <input type="checkbox" name="Interest" value="游戏" />游戏</label>
            </td>
        </tr>
        </form>
        <form>
        <tr>
            <td>
                <input type="text" name="Remark" />
            </td>
            <td>
                <label>
                    <input type="radio" name="Sex" value="1" />男</label>
                <label>
                    <input type="radio" name="Sex" value="2" />女</label>
            </td>
            <td>
                <label>
                    <input type="checkbox" name="Interest" value="书" />书</label>
                <label>
                    <input type="checkbox" name="Interest" value="电影" />电影</label>
                <label>
                    <input type="checkbox" name="Interest" value="游戏" />游戏</label>
            </td>
        </tr>
        </form>
        <form>
        <tr>
            <td>
                <input type="text" name="Remark" />
            </td>
            <td>
                <label>
                    <input type="radio" name="Sex" value="1" />男</label>
                <label>
                    <input type="radio" name="Sex" value="2" />女</label>
            </td>
            <td>
                <label>
                    <input type="checkbox" name="Interest" value="书" />书</label>
                <label>
                    <input type="checkbox" name="Interest" value="电影" />电影</label>
                <label>
                    <input type="checkbox" name="Interest" value="游戏" />游戏</label>
            </td>
        </tr>
        </form>
    </table>

    <script src="/Front/JQuery/jquery.min.js" type="text/javascript"></script>

    <script src="/Front/JQuery/jquery.form.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            $("#btnSubmit").click(function() {
                $("#form1").ajaxSubmit({
                    data: { dat: JSON.stringify(getFormsObject($("table form"))) }
                });
            });
        });

        function getFormsObject($forms) {
            var arr = [];
            $forms.each(function() {
                arr.push(convertArrayToObject($(this).serializeArray()));
            });
            return arr;
        }
        function convertArrayToObject(arr) {
            var obj = {};
            for (var ind in arr) {
                obj[arr[ind]["name"]] = arr[ind]["value"];
            }
            return obj;
        }
    </script>

</body>
</html>
