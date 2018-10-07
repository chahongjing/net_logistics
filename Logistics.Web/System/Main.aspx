<%@ Page Language="C#" MasterPageFile="/System/Main.Master" Inherits="BasePageView<object>"
    Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="/Front/Css/public.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
		  <link rel="stylesheet" href="/Front/dist/css/font-awesome-ie7.min.css" />
		<![endif]-->
    <!-- page specific plugin styles -->
    <!-- fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
    <!-- ace styles -->
    <link rel="stylesheet" href="/Front/dist/css/ace.min.css" />
    <link rel="stylesheet" href="/Front/dist/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="/Front/dist/css/ace-skins.min.css" />
    <!--[if lte IE 8]>
		  <link rel="stylesheet" href="/Front/dist/css/ace-ie.min.css" />
		<![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->

    <script src="/Front/dist/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
		<script src="/Front/dist/js/html5shiv.js"></script>
		<script src="/Front/dist/js/respond.min.js"></script>
		<![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

<script src="/Front/dist/js/jquery/2.1.3/jquery.min.js"></script>
    <div class="page-header">
        <h1 class="center">
            欢迎使用后台管理系统, 在这里, 您可以:
        </h1>
    </div>
    <div class="row">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">
            <ol class="dd-list">
                <li class="dd-item dd2-item" data-id="13">
                    <div class="dd-handle dd2-handle">
                        <i class="normal-icon ace-icon fa fa-bars blue bigger-130"></i><i class="drag-icon ace-icon fa fa-arrows bigger-125">
                        </i>
                    </div>
                    <div class="dd2-content">
                        后台系统基本管理, 如导航菜单管理</div>
                </li>
                <li class="dd-item dd2-item" data-id="14">
                    <div class="dd-handle dd2-handle">
                        <i class="normal-icon ace-icon fa fa-sitemap pink bigger-130"></i><i class="drag-icon ace-icon fa fa-arrows bigger-125">
                        </i>
                    </div>
                    <div class="dd2-content">
                        系统基本设置, 如用户, 组织架构, 角色, 权限</div>
                </li>
                <li class="dd-item dd2-item" data-id="14">
                    <div class="dd-handle dd2-handle">
                        <i class="normal-icon ace-icon fa fa-bug red bigger-130"></i><i class="drag-icon ace-icon fa fa-arrows bigger-125">
                        </i>
                    </div>
                    <div class="dd2-content">
                        产品信息跟踪, 如产品缺陷, 用户操作记录</div>
                </li>
                <li class="dd-item dd2-item" data-id="14">
                    <div class="dd-handle dd2-handle">
                        <i class="normal-icon ace-icon fa fa-gavel purple bigger-130"></i><i class="drag-icon ace-icon fa fa-arrows bigger-125">
                        </i>
                    </div>
                    <div class="dd2-content">
                        参数配置, 如标准参数配置, 个性化参数配置</div>
                </li>
                <li class="dd-item dd2-item" data-id="14">
                    <div class="dd-handle dd2-handle">
                        <i class="normal-icon ace-icon fa fa-eye green bigger-130"></i><i class="drag-icon ace-icon fa fa-arrows bigger-125">
                        </i>
                    </div>
                    <div class="dd2-content">
                        其它功能, 期待你的发现...</div>
                </li>
            </ol>
        </div>
        <div class="col-sm-3">
        </div>
    </div>
    <div class="space-12">
    </div>
    <div class="row">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">
            <div class="widget-box transparent">
                <div class="widget-header widget-header-flat">
                    <h4 class="lighter">
                        <i class="icon-signal"></i>一周访问量统计
                    </h4>
                </div>
                <div class="widget-body">
                    <div class="widget-main padding-4">
                        <div id="sales-charts">
                        </div>
                    </div>
                    <!-- /widget-main -->
                </div>
                <!-- /widget-body -->
            </div>
        </div>
        <div class="col-sm-3">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
    <script src="/Front/dist/js/jquery-ui-1.10.3.custom.min.js"></script>

    <script src="/Front/dist/js/jquery.ui.touch-punch.min.js"></script>

    <script src="/Front/dist/js/jquery.slimscroll.min.js"></script>

    <script src="/Front/dist/js/jquery.easy-pie-chart.min.js"></script>

    <script src="/Front/dist/js/jquery.sparkline.min.js"></script>

    <script src="/Front/dist/js/flot/jquery.flot.min.js"></script>

    <script src="/Front/dist/js/flot/jquery.flot.pie.min.js"></script>

    <script src="/Front/dist/js/flot/jquery.flot.resize.min.js"></script>

    <!-- ace scripts -->

    <script src="/Front/dist/js/ace-elements.min.js"></script>

    <script src="/Front/dist/js/ace.min.js"></script>

    <!-- inline scripts related to this page -->

    <script type="text/javascript">

        Date.prototype.Format = function(fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        };

        var label = [], labelD, maxV, minV;
        for (var i = 7; i > 0; i--) {
            labelD = new Date();
            labelD.setDate(labelD.getDate() - i + 1);
            label.push([7 - i, labelD.Format("yyyy-MM-dd")]);
        }

        var arr = [<%= Application[DateTime.Now.AddDays(-6).ToString("yyyy-MM-dd")] %>, <%= Application[DateTime.Now.AddDays(-5).ToString("yyyy-MM-dd")] %>,
            <%= Application[DateTime.Now.AddDays(-4).ToString("yyyy-MM-dd")] %>, <%= Application[DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd")] %>,
            <%= Application[DateTime.Now.AddDays(-2).ToString("yyyy-MM-dd")] %>, <%= Application[DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd")] %>,
            <%= Application[DateTime.Now.ToString("yyyy-MM-dd")] %>];
        maxV = 0;
        minV = 0;
        var d = [];
        for (var i = 0; i < arr.length; i++) {
            if (maxV < arr[i]) {
                maxV = arr[i];
            }
            if (minV > arr[i]) {
                minV = arr[i];
            }
            d.push([i, arr[i]])
        }

        jQuery(function($) {
            var sales_charts = $('#sales-charts').css({ 'width': '100%', 'height': '250px' });
            $.plot("#sales-charts", [{ label: "一周访问量", data: d}],
            {
                hoverable: true,
                shadowSize: 0,
                series: {
                    lines: { show: true },
                    points: { show: true }
                },
                xaxis: {
                    ticks: label
                },
                yaxis: {
                    min: minV,
                    max: maxV,
                    tickDecimals: 0
                },
                grid: {
                    backgroundColor: { colors: ["#fff", "#fff"] },
                    borderWidth: 1,
                    borderColor: '#555',
                    hoverable: true
                }
            });

        })
        
        // 节点提示  
        function showTooltip(x, y, contents) {  
            $('<div id="tooltip">' + contents + '</div>').css( {  
                position: 'absolute',  
                display: 'none',  
                top: y + 10,  
                left: x + 10,  
                border: '1px solid #fdd',  
                padding: '2px',  
                'background-color': '#dfeffc',  
                opacity: 0.80  
            }).appendTo("body").fadeIn(200);  
        }  
  
        var previousPoint = null;  
        // 绑定提示事件  
        $("#sales-charts").bind("plothover", function (event, pos, item) {  
            if (item) {  
                if (previousPoint != item.dataIndex) {  
                    previousPoint = item.dataIndex;  
                    $("#tooltip").remove();  
                    var y = item.datapoint[1].toFixed(0);  
  
                    var tip = "访问量：";  
                    showTooltip(item.pageX, item.pageY,tip+y);  
                }  
            }  
            else {  
                $("#tooltip").remove();  
                previousPoint = null;  
            }  
        });  
    </script>

</asp:Content>
