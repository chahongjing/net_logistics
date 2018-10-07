window.Utility.registerNameSpace('window.System.SystemList');

(function(ns) {
    ns.initial = function() {
        $("#btnAdd").click(function() {
            window.top.DialogBox.show({ title: "新增系统", url: "/System/SystemDetail.aspx", width: 450, height: 230, callBack: function(data) { if (data) { ns.search(); } } });
        })

        $("#btnEdit").click(ns.edit);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblSystemList tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })

    }

    ns.edit = function() {
        var arrItem = $("#tblSystemList tr.selected");
        if (arrItem.length == 0) {
            alertModal('请选择要编辑记录!', function() {
                // 删除记录
            });
            return;
        }
        var oid = arrItem.data("oid");
        window.top.DialogBox.show({ title: "编辑系统", url: "/System/SystemDetail.aspx?oid=" + oid, width: 450, height: 230, callBack: function(data) { if (data) { ns.search(); } } });
    }

    ns.deleteRecord = function() {
        var arrItem = $("#tblSystemList tr.selected");
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
            Utility.processAjax({ url: "/AjaxSystem/Delete.cspx",
                postData: { SystemGuid: oid },
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
        Utility.processAjax({ url: "/AjaxSystem/Search.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code" },
            async: false,
            callBack: function(data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblSystemList tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.SystemList);

$(function() {
    window.System.SystemList.initial();
});