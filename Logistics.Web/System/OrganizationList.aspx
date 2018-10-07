<%@ Page Language="C#" MasterPageFile="/System/Main.Master" Inherits="BasePageView<OrganizationListViewData>"
    Title="组织架构" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetCSSLink("/Front/Controls/DialogBox.css")%>
    <style>
        #tblOrganizationList tr.selected
        {
            background-color: #dbfee6;
        }
        .selected
        {
            background-color: Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="space-6">
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-2 col-xs-2 no-padding-right">
            <div class="widget-box no-margin-top">
                <div class="widget-header header-color-green2">
                    <h4 class="lighter smaller">
                        <%= this.Model.treeTitle %>
                    </h4>
                </div>
                <div class="widget-body">
                    <div class="widget-main padding-8">
                        <div id="treeOne" class="tree">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <div class="modal-content">
                <div class="modal-header no-padding" id="tblFirstHead">
                    <div class="table-header">
                        <div class="btn-group pull-right" style="padding-top: 4px;">
                            <button type="button" id="btnAdd" class="btn btn-warning btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-plus align-top bigger-110" style="margin-top: 2px"></i>
                                新增</button>
                            <button type="button" id="btnEdit" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                编辑</button>
                            <button type="button" id="btnAddRole" class="btn btn-success btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-pencil align-top bigger-110" style="margin-top: 2px"></i>
                                添加角色</button>
                            <button type="button" id="btnDelete" class="btn btn-info btn-sm btn-primary no-border">
                                <i class="ace-icon fa fa-trash align-top bigger-110" style="margin-top: 2px"></i>
                                删除</button>
                        </div>
                        组织架构列表
                    </div>
                </div>
                <div id="divTbl">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/UserControl/OrganizationList.ascx", this.Model)%>
                </div>
                <div class="no-margin-top" id="divPagination">
                    <%= BaseFrameWork.MVC.UserControlExcutor.RenderUserControl("/System/CommonUserControl/Pagination.ascx", this.Model.PageData)%>
                </div>
            </div>
        </div>
    </div>
    <div class="space-12">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Bottom" runat="server">
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/JQuery/jquery.form.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/dist/js/bootbox.min.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Common/Utility.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/Front/Controls/DialogBox1.js")%>
    <%= BaseFrameWork.Tool.WebHelper.GetJSLink("/System/OrganizationList.js")%>

    <script src="/Front/dist/js/fuelux/fuelux.tree.min.js"></script>

    <script src="/Front/dist/js/tools.js" type="text/javascript"></script>

    <script type="text/javascript">
    jQuery(function($) {
        var list = <%= this.Model.treeList %> || [];
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
        $('#treeOne').ace_tree({
            dataSource: treeDataSource,
            loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
            'open-icon': 'ace-icon fa fa-folder-open',
            'close-icon': 'ace-icon fa fa-folder',
            'selectable': true,
            multiSelect: false,
            'selected-icon': null,
            'unselected-icon': null
        });


        $('#treeOne').on('selected.fu.tree', function() {
            var t = $('#treeOne').tree('selectedItems');
        });
        function getSelected() {
            return $('#treeOne').tree('selectedItems');
        }

        function listToTreeData(list) {
            var treeData = {};
            var parentLength = 0;
            for (var i = 0; i < list.length; i++) {
                if (!list[i].parentID) {
                    treeData[list[i].text] = list[i];
                    setChildren(list[i], list);
                    if (list[i].additionalParameters.children.length > 0) {
                        list[i].type = "folder";
                    } else {
                        list[i].type = "item";
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
                        list[i].type = "item";
                    }
                }
            }
        }
    });

    function getReturnDate() {
        return $('#treeOne').tree('selectedItems');
    }
    </script>

</asp:Content>
