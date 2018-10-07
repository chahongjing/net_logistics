window.Utility.registerNameSpace('window.System.SelectCompany');

(function (ns) {
    ns.initial = function () {
        $("#btnAdd").click(function () {
            window.top.DialogBox.show({ title: "新增公司", url: "/System/CompanyDetail.aspx", width: 1100, height: 450, callBack: function (data) { if (data) { ns.search(); } } });
        })

        $("#btnEdit").click(ns.edit);
        $("#btnAddRole").click(ns.addRole);

        $("#btnDelete").click(ns.deleteRecord);

        $("#tblCompanyList tr").on("click", function () {
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
        window.top.DialogBox.show({ title: "编辑公司", url: "/System/CompanyDetail.aspx?oid=" + oid, width: 1100, height: 450, callBack: function (data) { if (data) { ns.search(); } } });
    }
    ns.deleteRecord = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest("tr").data("oid");
        confirmModal('确实要删除记录吗?', function () {
            // 删除记录
            Utility.processAjax({
                url: "/AjaxCompany/Delete.cspx",
                postData: { CompanyID: oid },
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
        // 删除记录
        Utility.processAjax({
            url: "/AjaxCompany/SelectSearch.cspx",
            postData: { SearchKey: $('input[name=key]').val(), pageIndex: pageIndex, pageSize: pageSize, orderBy: "Name, CreatedOn" },
            async: false,
            callBack: function (data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#tblList tr").on("click", function () {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.SelectCompany);

$(function () {
    window.System.SelectCompany.initial();
});