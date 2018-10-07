window.Utility.registerNameSpace('window.System.ActionList');

(function(ns) {
    ns.initial = function() {
        $("#btnAdd").click(function() {
        window.top.DialogBox.show({ title: "新增功能点", url: "/System/ActionDetail.aspx", width: 450, height: 275, callBack: function(data) { if (data) { ns.search(); } } });
        })

        $("#btnEdit").click(ns.edit);
        $("#btnAddRole").click(ns.addRole);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblActionList tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })

    }

    ns.edit = function() {
        var arrItem = $("#tblActionList tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要编辑记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "编辑功能点", url: "/System/ActionDetail.aspx?oid=" + oid, width: 450, height: 275, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.addRole = function() {
        var arrItem = $("#divTbl tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要操作的记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "添加角色", url: "/System/PermissionToRoleList.aspx?oid=" + oid, width: 900, height: 600, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.deleteRecord = function() {
        var arrItem = $("#tblActionList tr.selected");
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
            Utility.processAjax({ url: "/AjaxAction/Delete.cspx",
                postData: { ActionGuid: oid },
                async: false,
                callBack: function(data) {
                    ns.search();
                }
            });
        });
    }

    ns.search = function() {
        var pageIndex = $("#divPagination input[name=txtPageIndex]").val();
        var pageSize = $("#divPagination input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxAction/Search.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code" },
            async: false,
            callBack: function(data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblActionList tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.ActionList);

$(function() {
    window.System.ActionList.initial();
});