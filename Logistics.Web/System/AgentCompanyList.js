window.Utility.registerNameSpace('window.System.AgentCompanyList');

(function (ns) {
    ns.initial = function () {
        $("#btnAdd").click(function () {
            window.top.DialogBox.show({ title: "新增代理公司", url: "/System/AgentCompanyDetail.aspx", width: 1100, height: 450, callBack: function (data) { if (data) { ns.search(); } } });
        })
        $("#btnDelete").click(ns.deleteRecord);

        $("#tblAgentCompanyList tr").on("click", function () {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })
        $("#btnSearch").click(function () {
            $("#divPagination input[name=txtPageIndex]").val(1);
            ns.search();
        });
    }

    ns.edit = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest("tr").data("oid");
        window.top.DialogBox.show({ title: "编辑代理公司", url: "/System/AgentCompanyDetail.aspx?oid=" + oid, width: 1100, height: 450, callBack: function (data) { if (data) { ns.search(); } } });
    }
    ns.deleteRecord = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest("tr").data("oid");
        confirmModal('确实要删除记录吗?', function () {
            // 删除记录
            Utility.processAjax({
                url: "/AjaxAgentCompany/Delete.cspx",
                postData: { AgentID: oid },
                async: false,
                callBack: function (data) {
                    ns.search();
                }
            });
        });
    }

    ns.search = function () {
        var pageIndex = $("#divPagination input[name=txtPageIndex]").val();
        var pageSize = $("#divPagination input[name=txtPageSize]").val();
        var val = $('input[name=key]').val();
        // 删除记录
        Utility.processAjax({
            url: "/AjaxAgentCompany/Search.cspx",
            postData: { SearchKey: val, pageIndex: pageIndex, pageSize: pageSize, orderBy: "Name, CreatedOn" },
            async: false,
            callBack: function (data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblAgentCompanyList tr").on("click", function () {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.AgentCompanyList);

$(function () {
    window.System.AgentCompanyList.initial();
});