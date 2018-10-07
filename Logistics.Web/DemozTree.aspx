<%@ Page Language="C#" AutoEventWireup="true"  Inherits="BasePageView<String>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" href="/Front/Plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
        .ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/1_open.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/1_close.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.icon02_ico_docu{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.icon03_ico_docu{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.icon04_ico_docu{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.icon05_ico_docu{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
        .ztree li span.button.icon06_ico_docu{margin-right:2px; background: url(/Front/Plugins/zTree_v3/css/zTreeStyle/img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
    </style>

    <script type="text/javascript" src="/Front/Plugins/zTree_v3/js/jquery-1.4.4.min.js"></script>

    <script type="text/javascript" src="/Front/Plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>

    <script type="text/javascript">
		<!--
        var setting = {

            callback: {
                beforeExpand: function() {

                },
                beforeClick: function() {

                },
                onClick: function() {
                    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                    var nodes = treeObj.getSelectedNodes();

                    alert(nodes[0].uid);

                    if (nodes.length > 0) {
                        if (nodes[0].open) {
                            treeObj.expandNode(nodes[0], false, false, true);
                        } else {
                            treeObj.expandNode(nodes[0], true, false, true);
                        }
                    }
                },
                onDblClick: null
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "code",
                    pIdKey: "parentCode",
                    rootPId: 0
                }
            }
        };

        var zNodes = [
			{ name: "父节点1 - 展开", open: true, uid: '12',
			    children: [
					{ name: "父节点11 - 折叠",
					    children: [
							{ name: "叶子节点111" },
							{ name: "叶子节点112" },
							{ name: "叶子节点113" },
							{ name: "叶子节点114" }
						]
					},
					{ name: "父节点12 - 折叠",
					    children: [
							{ name: "叶子节点121" },
							{ name: "叶子节点122" },
							{ name: "叶子节点123" },
							{ name: "叶子节点124" }
						]
					},
					{ name: "父节点13 - 没有子节点", isParent: true }
				]
			},
			{ name: "父节点2 - 折叠",
			    children: [
					{ name: "父节点21 - 展开", open: true,
					    children: [
							{ name: "叶子节点211" },
							{ name: "叶子节点212" },
							{ name: "叶子节点213" },
							{ name: "叶子节点214" }
						]
					},
					{ name: "父节点22 - 折叠",
					    children: [
							{ name: "叶子节点221" },
							{ name: "叶子节点222" },
							{ name: "叶子节点223" },
							{ name: "叶子节点224" }
						]
					},
					{ name: "父节点23 - 折叠",
					    children: [
							{ name: "叶子节点231" },
							{ name: "叶子节点232" },
							{ name: "叶子节点233" },
							{ name: "叶子节点234" }
						]
					}
				]
			},
			{ name: "父节点3 - 没有子节点", isParent: true }
		];

        myNodes = [
		    { code: "1", parentCode: "", uid: "23", name: "父节点1 - 展开", open: true, iconSkin: "pIcon01" },
		    { code: "1.1", parentCode: "1", uid: "23", name: "父节点11 - 折叠", iconSkin: "pIcon01" },
		    { code: "1.1.1", parentCode: "1.1", uid: "23", name: "父节点11 - 折叠", iconSkin: "icon02" },
		    { code: "1.1.2", parentCode: "1.1", uid: "23", name: "父节点11 - 折叠", iconSkin: "icon02" },
	        { code: "1.2", parentCode: "1", uid: "23", name: "叶子节点111", iconSkin: "icon03" },
	        { code: "2", parentCode: "2", uid: "23", name: "叶子节点112", iconSkin: "pIcon02" },
	        { code: "2.1", parentCode: "2", uid: "23", name: "父节点12 - 折叠", iconSkin: "icon05" },
	        { code: "3", parentCode: "", uid: "23", name: "父节点13 - 没有子节点", isParent: true, iconSkin: "pIcon02" }
			]
        $(document).ready(function() {
            $.fn.zTree.init($("#treeDemo"), setting, myNodes);
        });
		//-->
    </script>

</head>
<body style="background-color:#FFFFFF;">
    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree">
        </ul>
    </div>
</body>
</html>
