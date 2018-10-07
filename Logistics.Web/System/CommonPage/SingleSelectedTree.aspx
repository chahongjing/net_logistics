<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<TreeViewData>" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>选择<%= this.Model.Title %></title>
    <meta name="description" content="top menu &amp; navigation">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/Front/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Front/dist/css/font-awesome.min.css">
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/Front/dist/css/datepicker.min.css">
    <link rel="stylesheet" href="/Front/dist/css/daterangepicker.min.css">
    <!-- ace styles -->
    <link rel="stylesheet" href="/Front/dist/css/ace.min.css" class="ace-main-stylesheet"
        id="main-ace-style">
    <link rel="stylesheet" href="/Front/dist/css/fix.css">
    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="/Front/dist/css/ace-ie.min.css" />
		<![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->

    <script src="/Front/dist/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
		<script src="/Front/dist/js/html5shiv.min.js"></script>
		<script src="/Front/dist/js/respond.min.js"></script>
		<![endif]-->
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/Front/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Front/dist/css/font-awesome.min.css">
    <!-- page specific plugin styles -->
    <!-- ace styles -->
    <link rel="stylesheet" href="/Front/dist/css/ace.min.css" class="ace-main-stylesheet"
        id="Link1">
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/Front/dist/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="/Front/dist/css/ace-ie.min.css" />
		<![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->

    <script src="/Front/dist/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
		<script src="/Front/dist/js/html5shiv.min.js"></script>
		<script src="/Front/dist/js/respond.min.js"></script>
		<![endif]-->
</head>
<body class="no-skin">
    <div class="main-container" id="main-container">
        <div class="main-content">
            <div class="main-content-inner">
                <div class="col-sm-12 no-padding-right no-padding-left">
                    <div class="widget-box">
                        <div class="widget-header header-color-green2">
                            <h4 class="lighter smaller">
                                <%= this.Model.Title %></h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main padding-8">
                                <div id="treeOne" class="tree tree-folder-select" role="tree">
         
         
         
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<script src="/Front/Controls/DialogBox1.js" type="text/javascript"></script>

<!-- basic scripts -->
<!--[if !IE]> -->

<script src="/Front/dist/js/jquery/2.1.3/jquery.min.js"></script>

<!-- <![endif]-->
<!--[if IE]>
		<script src="/Front/dist/js/jquery/1.11.2/jquery.min.js"></script>
		<![endif]-->
<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='/Front/dist/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->
<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='/Front/dist/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/Front/dist/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<script src="/Front/dist/js/bootstrap.js"></script>

<!-- ace scripts -->

<script src="/Front/dist/js/ace-elements.min.js"></script>

<script src="/Front/dist/js/ace.min.js"></script>

<!-- basic scripts -->
<!--[if !IE]> -->

<script src="/Front/dist/js/jquery/2.1.3/jquery.min.js"></script>

<!-- <![endif]-->
<!--[if IE]>
		<script src="/Front/dist/js/jquery/1.11.2/jquery.min.js"></script>
		<![endif]-->
<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='/Front/dist/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/Front/dist/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/Front/dist/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<script src="/Front/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<script src="/Front/dist/js/fuelux/fuelux.tree.min.js"></script>

<!-- ace scripts -->

<script src="/Front/dist/js/ace-elements.min.js"></script>

<script src="/Front/dist/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function($) {
        var list = <%= this.Model.List %> || [];
        var treeDataSource = function(options, callback) {
            var $data = null
            if (!("text" in options) && !("type" in options)) {
                $data = listToTreeData(list); //the root tree
                callback({ data: $data });
                return;
            }
            else if ("type" in options && options.type == "folder") {
                if ("additionalParameters" in options && "children" in options.additionalParameters)
                    $data = options.additionalParameters.children || {};
                else $data = {}//no data
            }
            if ($data != null)//this setTimeout is only for mimicking some random delay
                setTimeout(function() { callback({ data: $data }); }, parseInt(Math.random() * 500) + 200);
            //we have used static data here
            //but you can retrieve your data dynamically from a server using ajax call
            //checkout examples/treeview.html and examples/treeview.js for more info
        }

        // http://getfuelux.com/javascript.html#tree
//        $('#treeOne').ace_tree({
//            dataSource: treeDataSource,
//            loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
//            'open-icon': 'ace-icon fa fa-folder-open',
//            'close-icon': 'ace-icon fa fa-folder',
//            'selectable': true,
//            multiSelect: false,
//            'selected-icon': null,
//            'unselected-icon': null,
//            folderSelect: true
//        });
        
        $('#treeOne').ace_tree({
            dataSource: treeDataSource,
		    folderSelect: true,
            multiSelect: false,
		    cacheItems: true,
		    'open-icon' : 'ace-icon tree-minus',
		    'close-icon' : 'ace-icon tree-plus',
		    'selectable' : true,
		    'selected-icon' : 'ace-icon fa fa-check',
		    'unselected-icon' : 'ace-icon fa fa-times',
		    loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'

        });


        $('#treeOne').on('selected.fu.tree', function() {
            var t = $('#treeOne').tree('selectedItems');
        });
        $('#treeOne').on('opened.fu.tree', function() {
            var t = $('#treeOne').tree('selectedItems');
            alert(t[0].text);
        });
        $('#treeOne').on('closed.fu.tree', function() {
            var t = $('#treeOne').tree('selectedItems');
            alert(t[0].text);
        });
        function getSelected() {
            return $('#treeOne').tree('selectedItems');
        }

        function listToTreeData(list) {
            var treeData = {};
            var parentLength = 0;
            for (var i = 0; i < list.length; i++) {
                list[i].type = "item";
                if (!list[i].parentID) {
                    treeData[list[i].text] = list[i];
                    setChildren(list[i], list);
                    if (list[i].additionalParameters.children.length > 0) {
                        list[i].type = "folder";
                    } else {
                    }
                    parentLength++;
                }
            }
            return treeData;
        }

        function setChildren(parent, list) {
            for (var i = 0; i < list.length; i++) {
                if (parent.id == list[i].parentID) {
                    parent.additionalParameters.children.push(list[i]);
                    setChildren(list[i], list);
                    if (list[i].additionalParameters.children.length > 0) {
                        list[i].type = "folder";
                    } else {
                        list[i].text = list[i].icon + list[i].text;
                    }
                }
            }
        }
    });

    function getReturnDate() {
        return $('#treeOne').tree('selectedItems');
    }
</script>

