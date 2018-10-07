window.Utility.registerNameSpace('window.System.OrganizationList');

(function(ns) {
    ns.initial = function() {
        $("#btnAdd").click(ns.add);

        $("#btnEdit").click(ns.edit);
        $("#btnAddRole").click(ns.addRole);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblOrganizationList tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })

    }

    ns.add = function() {
        var arrItem = getReturnDate();
        if (arrItem.length == 0) {
            alertModal('请先选择父级!', function() {
            });
            return;
        }
        window.top.DialogBox.show({ title: "新增组织架构", url: "/System/OrganizationDetail.aspx?parentGuid=" + arrItem[0].id, width: 450, height: 230, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.edit = function() {
        var arrItem = $("#tblOrganizationList tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要编辑记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "编辑组织架构", url: "/System/OrganizationDetail.aspx?oid=" + oid, width: 450, height: 230, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.addRole = function() {
        var arrItem = $("#tblOrganizationList tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要操作的记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "添加角色", url: "/System/OrganizationToRole.aspx?oid=" + oid, width: 900, height: 600, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.deleteRecord = function() {
        var arrItem = $("#tblOrganizationList tr.selected");
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
            Utility.processAjax({ url: "/AjaxOrganization/Delete.cspx",
                postData: { UnitGuid: oid },
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
        Utility.processAjax({ url: "/AjaxOrganization/Search.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code" },
            async: false,
            callBack: function(data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblOrganizationList tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.OrganizationList);

$(function() {
    window.System.OrganizationList.initial();
});