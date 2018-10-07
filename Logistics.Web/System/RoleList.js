window.Utility.registerNameSpace('window.System.RoleList');

(function(ns) {
    ns.initial = function() {
        $("#btnAddRole").click(ns.addRole);
        $("#btnEditRole").click(ns.edit);
        $("#btnGrant").click(ns.grant);
        $("#btnGrantPermission").click(ns.grantPermission);
        $("#btnDeleteRole").click(ns.deleteRole);

        $("#btnAdd").click(ns.add);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblRoleList tr, #divTable1 tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })

    }

    ns.addRole = function() {
        window.top.DialogBox.show({ title: "新增角色", url: "/System/RoleDetail.aspx", width: 450, height: 200, callBack: function(data) { if (data) { ns.searchRole(); } } });
    }

    ns.edit = function() {
        var arrItem = $("#divTable1 table tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要编辑记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "编辑角色", url: "/System/RoleDetail.aspx?oid=" + oid, width: 450, height: 200, callBack: function(data) { if (data) { ns.searchRole(); } } });
    }

    ns.grant = function() {
        var arrItem = $("#divTable1 table tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要授权的记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "添加对象", url: "/System/RoleToBusinessList.aspx?oid=" + oid, width: 900, height: 600, callBack: function(data) { if (data) { ns.searchRole(); } } });
    }

    ns.grantPermission = function() {
        var arrItem = $("#divTable1 table tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要授权的记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "添加权限", url: "/System/RoleToPermissionList.aspx?oid=" + oid, width: 900, height: 600, callBack: function(data) { if (data) { ns.searchRole(); } } });
    }
    ns.deleteRole = function() {
        var arrItem = $("#divTable1 tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要删除记录!', function() {
                // 删除记录
                ns.search();
            });
            return;
        }
        var oid = arrItem.data("oid");
        confirmModal('确实要删除记录吗?', function() {
            // 删除记录
            Utility.processAjax({ url: "/AjaxRole/Delete.cspx",
                postData: { RoleGuid: oid },
                async: false,
                callBack: function(data) {
                    ns.searchRole();
                }
            });
        });
    }

    ns.searchRole = function() {
        var pageIndex = $("#divPagination1 input[name=txtPageIndex]").val();
        var pageSize = $("#divPagination1 input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxRole/SearchRole.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code" },
            async: false,
            callBack: function(data) {
                $("#divTable1").html(data.table);
                $("#divPagination1").html(data.pagination);
                $("#divTable1 tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.RoleList);

$(function() {
    window.System.RoleList.initial();
});