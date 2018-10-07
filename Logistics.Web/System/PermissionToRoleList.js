window.Utility.registerNameSpace('window.System.PermissionToRoleList');
window.Utility.registerNameSpace('window.System.BusinessToRole');

(function(ns) {
    ns.initial = function() {
        $("#divTable tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        })
    }

})(window.System.PermissionToRoleList);


(function(ns) {
    ns.grantPermission = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToPermission/Insert.cspx", postData: { ActionGuid: $("input[name=ActionGuid]").val(), RoleGuid: oid }, async: false,
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
        Utility.processAjax({ url: "/AjaxRoleToPermission/DeleteRolePermission.cspx", postData: { ActionGuid: $("input[name=ActionGuid]").val(), RoleGuid: oid }, async: false,
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
        Utility.processAjax({ url: "/AjaxRoleToBusiness/SearchPermissionToRole.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code", ActionGuid: $("input[name=ActionGuid]").val() },
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
    window.System.PermissionToRoleList.initial();
});