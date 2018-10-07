window.Utility.registerNameSpace('window.System.KeyValuePList');

(function(ns) {
    ns.initial = function() {
        $("#btnAdd").click(function() {
            window.top.DialogBox.show({ title: "新增业务参数", url: "/System/KeyValuePDetail.aspx?code=" + $("input[name=Group]").val(), width: 450, height: 230, callBack: function(data) { if (data) { ns.search(); } } });
        })

        $("#btnEdit").click(ns.edit);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblKeyValuePList tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })

    }

    ns.edit = function() {
        var arrItem = $("#tblKeyValuePList tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要编辑记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "编辑业务参数", url: "/System/KeyValuePDetail.aspx?oid=" + oid + "&code=" + $("input[name=Group]").val(), width: 450, height: 230, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.deleteRecord = function() {
        var arrItem = $("#tblKeyValuePList tr.selected");
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
            Utility.processAjax({ url: "/AjaxKeyValueP/Delete.cspx",
                postData: { ID: oid },
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
        Utility.processAjax({ url: "/AjaxKeyValueP/Search.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code", code: $("input[name=Group]").val() },
            async: false,
            callBack: function(data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblKeyValuePList tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.KeyValuePList);

$(function() {
    window.System.KeyValuePList.initial();
});