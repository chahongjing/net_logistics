window.Utility.registerNameSpace('window.System.PriceList');

(function(ns) {
    ns.initial = function() {
        $("#btnAdd").click(function() {
            window.top.DialogBox.show({ title: "新增报价", url: "/System/PriceDetail.aspx", width: 850, height: 280, callBack: function (data) { if (data) { ns.search(); } } });
        })

        $("#btnEdit").click(ns.edit);
        $("#btnAddRole").click(ns.addRole);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblList tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })

    }

    ns.edit = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest('tr').data("oid");
        window.top.DialogBox.show({ title: "编辑报价", url: "/System/PriceDetail.aspx?oid=" + oid, width: 850, height: 280, callBack: function (data) { if (data) { ns.search(); } } });
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
        window.top.DialogBox.show({ title: "添加角色", url: "/System/UserToRole.aspx?oid=" + oid, width: 900, height: 600, callBack: function(data) { if (data) { ns.search(); } } });
    }
    ns.deleteRecord = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest('tr').data("oid");
        confirmModal('确实要删除记录吗?', function() {
            // 删除记录
            Utility.processAjax({
                url: "/AjaxPrice/Delete.cspx",
                postData: { ListID: oid },
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
        Utility.processAjax({
            url: "/AjaxPrice/Search.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "StartPlace, DestinationPlace, InterimPlace, Type, LuggageAmount" },
            async: false,
            callBack: function(data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblList tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.PriceList);

$(function() {
    window.System.PriceList.initial();
});