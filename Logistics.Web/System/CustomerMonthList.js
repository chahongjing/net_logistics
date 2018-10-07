window.Utility.registerNameSpace('window.System.CustomerMonthList');

(function(ns) {
    ns.initial = function() {
        $("#btnAdd").click(function() {
            window.top.DialogBox.show({ title: "新增客户", url: "/System/CustomerDetail.aspx", width: 1100, height: 600, callBack: function(data) { if (data) { ns.search(); } } });
        })

        $("#btnEdit").click(ns.edit);
        $("#btnAddRole").click(ns.addRole);

        $("#btnDelete").click(ns.deleteRecord);

        $('#btnExport').click(ns.export);

        $("#tblCustomerList tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })
        $('input[name=from],input[name=to]').datepicker({ autoclose: true,todayHighlight:true }).next().on(ace.click_event, function () {
            $(this).prev().focus();
        });
        $("#btnSearch").click(function () {
            $("#divPagination input[name=txtPageIndex]").val(1);
            ns.search();
        });
        ns.showTotal();
    }

    ns.edit = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest('tr').data("oid");
        window.top.DialogBox.show({ title: "编辑客户", url: "/System/CustomerDetail.aspx?oid=" + oid, width: 1100, height: 600, callBack: function (data) { if (data) { ns.search(); } } });
    }
    ns.deleteRecord = function (obj) {
        $(obj).closest("tr").addClass('selected');
        var oid = $(obj).closest('tr').data("oid");
        confirmModal('确实要删除记录吗?', function() {
            // 删除记录
            Utility.processAjax({ url: "/AjaxCustomer/Delete.cspx",
                postData: { CustomerId: oid },
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
        $("#formSearch").find('input[name=pageIndex]').val(pageIndex);
        $("#formSearch").find('input[name=pageSize]').val(pageSize);
        $("#formSearch").find('input[name=orderBy]').val("Code");
        $("#formSearch").ajaxSubmit({
            dataType:"json",
            success: function (data) {
                $("#divTbl").html(data.table);
                $("#divPagination").html(data.pagination);
                ns.showTotal();
                $("#tblCustomerList tr").on("click", function () {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }

    ns.export = function () {
        var form = $('#formSearch');
        form.attr("target", "ifmExport");
        var url = form.attr("action");
        form.attr("action", "/System/CustomerMonthListExport.aspx");
        form.find('input[name=orderBy]').val("CreatedOn DESC, Name");
        form[0].submit();
        form.attr("target", "");
        form.attr("action", url);
    }
    ns.showTotal = function () {
        $('#spnBid').text($('#tblCustomerList').data('totalbidcost'));
        $('#spnSale').text($('#tblCustomerList').data('totalsaleamount'));
        $('#spnCost').text($('#tblCustomerList').data('totalfactcost'));
        $('#spnProfit').text($('#tblCustomerList').data('totalprofit'));
    }
})(window.System.CustomerMonthList);

$(function() {
    window.System.CustomerMonthList.initial();
});