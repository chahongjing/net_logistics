window.Utility.registerNameSpace('window.System.OrganizationToRole');
window.Utility.registerNameSpace('window.System.BusinessToRole');

(function(ns) {
    ns.initial = function() {
        $("#divTable tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })
    }
})(window.System.OrganizationToRole);

(function(ns) {
    ns.grantPermission = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToBusiness/Insert.cspx", postData: { BusinessGuid: $("input[name=BusinessGuid]").val(), RoleGuid: oid }, async: false,
            callBack: function(ret) {
                if (ret.Status == Constant.ResultStatus.OK) {
                    ns.search();
                } else {
                    alertModal(jRet.Message);
                }
            }
        });

    }
    ns.revokePermission = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToBusiness/DeleteRoleBusiness.cspx", postData: { BusinessGuid: $("input[name=BusinessGuid]").val(), RoleGuid: oid }, async: false,
            callBack: function(ret) {
                if (ret.Status == Constant.ResultStatus.OK) {
                    ns.search();
                } else {
                    alertModal(jRet.Message);
                }
            }
        });
    }

    ns.search = function() {
        var pageIndex = $("#divPagination input[name=txtPageIndex]").val();
        var pageSize = $("#divPagination input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxRoleToBusiness/SearchOrganizationToRole.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code", BusinessGuid: $("input[name=BusinessGuid]").val() },
            async: false,
            callBack: function(data) {
                $("#divTable").html(data.table);
                $("#divPagination").html(data.pagination);
                $("#divTable tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.BusinessToRole);

$(function() {
    window.System.BusinessToRole.initial();
});