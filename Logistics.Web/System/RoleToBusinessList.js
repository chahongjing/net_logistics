window.Utility.registerNameSpace('window.System.RoleToBusinessList');

(function(ns) {
    ns.initial = function() {
        $("#divTable tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
            ns.secondSearch();
        })

        //行单击选中
        $("#divTable1 tr").on('click', function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        });
    }

    ns.grantBusiness = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToBusiness/Insert.cspx", postData: { RoleGuid: $("input[name=RoleGuid]").val(), BusinessGuid: oid }, async: false,
            callBack: function(ret) {
                if (ret.Status == Constant.ResultStatus.OK) {
                    ns.searchRoleBusiness();
                } else {
                    alertModal(jRet.Message);
                }
            }
        });

    }

    ns.grantUser = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToBusiness/Insert.cspx", postData: { RoleGuid: $("input[name=RoleGuid]").val(), BusinessGuid: oid }, async: false,
            callBack: function(ret) {
                if (ret.Status == Constant.ResultStatus.OK) {
                    ns.searchRoleUser();
                } else {
                    alertModal(jRet.Message);
                }
            }
        });
    }
    ns.revokeBusiness = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToBusiness/DeleteRoleBusiness.cspx", postData: { RoleGuid: $("input[name=RoleGuid]").val(), BusinessGuid: oid }, async: false,
            callBack: function(ret) {
                if (ret.Status == "OK") {
                    ns.searchRoleBusiness();
                } else {
                    alertModal(jRet.Message);
                }
            }
        });
    }

    ns.revokeUser = function(oid) {
        Utility.processAjax({ url: "/AjaxRoleToBusiness/DeleteRoleBusiness.cspx", postData: { RoleGuid: $("input[name=RoleGuid]").val(), BusinessGuid: oid }, async: false,
            callBack: function(ret) {
                if (ret.Status == Constant.ResultStatus.OK) {
                    ns.searchRoleUser();
                } else {
                    alertModal(jRet.Message);
                }
            }
        });
    }

    ns.searchRoleBusiness = function() {
        var pageIndex = $("#divPagination input[name=txtPageIndex]").val();
        var pageSize = $("#divPagination input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxRoleToBusiness/SearchRoleBusiness.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "Code", RoleGuid: $("input[name=RoleGuid]").val() },
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

    ns.searchRoleUser = function() {
        var pageIndex = $("#divPagination1 input[name=txtPageIndex]").val();
        var pageSize = $("#divPagination1 input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxRoleToBusiness/SearchRoleUser.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "UserCode", RoleGuid: $("input[name=RoleGuid]").val() },
            async: false,
            callBack: function(data) {
                $("#divTable1").html(data.table);
                $("#divPagination1").html(data.pagination);
                $("#divTable1 tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
            }
        });
    }
})(window.System.RoleToBusinessList);

$(function() {
    window.System.RoleToBusinessList.initial();
});