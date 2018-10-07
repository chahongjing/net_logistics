window.Utility.registerNameSpace('window.System.NavigationList');

(function(ns) {
    ns.initial = function() {
        $("#btnAddFirst").click(function() {
            window.top.DialogBox.show({ title: "新增一级分类", url: "/System/NavigationDetail.aspx?type=1", width: 650, height: 190, callBack: function(data) { if (data) { window.location.reload(); /*ns.firstSearch();*/ } } });
        })
        $("#btnAddSecond").click(function() {
            var arrItem = $("#tblFirst tr.selected");
            if (arrItem.length == 0) {
                alertModal('请选择一级分类!', function() {
                });
                return;
            }
            var oid = arrItem.data("oid");
            var name = arrItem.data("name");
            window.top.DialogBox.show({ title: "新增二级分类", url: "/System/NavigationDetail.aspx?type=2&id=" + oid + "&name=" + encodeURIComponent(name), width: 650, height: 190, callBack: function(data) { if (data) { window.location.reload(); /*ns.secondSearch();*/ } } });
        })

        $("#btnEditFirst").click(function() {
            var arrItem = $("#tblFirst tr.selected");
            if (arrItem.length == 0) {
                alertModal('请选择要编辑记录!', function() {
                    // 删除记录
                });
                return;
            }
            var oid = arrItem.data("oid");
            window.top.DialogBox.show({ title: "编辑一级分类", url: "/System/NavigationDetail.aspx?oid=" + oid + "&type=1", width: 650, height: 190, callBack: function(data) { window.location.reload(); /*ns.firstSearch();*/ } });
        });
        $("#btnEditSecond").click(function() {
            var arrItem = $("#tblSecond tr.selected");
            if (arrItem.length == 0) {
                alertModal('请选择要编辑记录!', function() {
                    // 删除记录
                });
                return;
            }
            var oid = arrItem.data("oid");
            window.top.DialogBox.show({ title: "编辑二级分类", url: "/System/NavigationDetail.aspx?oid=" + oid + "&type=2", width: 650, height: 190, callBack: function(data) { window.location.reload(); /*ns.secondSearch();*/ } });
        });

        $("#btnDeleteFirst").click(function() {
            var arrItem = $("#tblFirst tr.selected");
            if (arrItem.length == 0) {
                alertModal('请选择要删除记录!', function() {
                });
                return;
            }
            var oid = arrItem.data("oid");
            confirmModal('确实要删除记录吗?', function() {
                // 删除记录
                Utility.processAjax({ url: "/AjaxMenu/Delete.cspx",
                    postData: { MenuGuid: oid },
                    async: false,
                    callBack: function(data) {
                        window.location.reload();
                        // ns.secondSearch();
                    }
                });
            });
        });
        $("#btnDeleteSecond").click(function() {
            var arrItem = $("#tblSecond tr.selected");
            if (arrItem.length == 0) {
                alertModal('请选择要删除记录!', function() {
                    // 删除记录
                });
                return;
            }
            var oid = arrItem.data("oid");
            confirmModal('确实要删除记录吗?', function() {
                // 删除记录
                Utility.processAjax({ url: "/AjaxMenu/Delete.cspx",
                    postData: { MenuGuid: oid },
                    async: false,
                    callBack: function(data) {
                        window.location.reload();
                        //ns.secondSearch();
                    }
                });
            });
        });

        $("#tblFirst tr").on("click", function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
            ns.secondSearch();
        })

        //行单击选中
        $("#tblSecond tr").on('click', function() {
            var _this = $(this);
            _this.addClass('selected');
            _this.siblings().removeClass('selected');
        });
    }

    ns.firstSearch = function() {
        var pageIndex = $("#divPaginationFirst input[name=txtPageIndex]").val();
        var pageSize = $("#divPaginationFirst input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxMenu/FirstSearch.cspx",
            postData: { pageIndex: pageIndex, pageSize: pageSize, orderBy: "OrderCode" },
            async: false,
            callBack: function(data) {
                $("#divTblFirst").html(data.table);
                $("#divPaginationFirst").html(data.pagination);
                $("#tblFirst tr").on("click", function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                })
                ns.secondSearch();
            }
        });
    }
    ns.secondSearch = function() {
        var pageIndex = $("#divPaginationSecond input[name=txtPageIndex]").val();
        var pageSize = $("#divPaginationSecond input[name=txtPageSize]").val();
        // 删除记录
        Utility.processAjax({ url: "/AjaxMenu/SecondSearch.cspx",
            postData: { parentGuid: $("#tblFirst tr.selected").data("oid"), pageIndex: pageIndex, pageSize: pageSize, orderBy: "OrderCode" },
            async: false,
            callBack: function(data) {
                $("#divTblSecond").html(data.table);
                $("#divPaginationSecond").html(data.pagination);
                //行单击选中
                $("#tblSecond tr").on('click', function() {
                    var _this = $(this);
                    _this.addClass('selected');
                    _this.siblings().removeClass('selected');
                });
            }
        });
    }
})(window.System.NavigationList);

$(function() {
    window.System.NavigationList.initial();
});