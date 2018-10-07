window.Utility.registerNameSpace('window.System.CompanyDetail');

(function (ns) {
    ns.initial = function () {
        $('input[name=Japanese]').blur(function () {
            if (isNaN($(this).val())) {
                $(this).val($(this).data("old"));
                return;
            }
            $(this).data("old", ($(this).val() - 0).toFixed(0));
            $(this).val(($(this).val() - 0).toFixed(0));
        });
        $('input[name=AirLuggageLimit],input[name=ShippingLuggageLimit]').blur(function () {
            if (isNaN($(this).val())) {
                $(this).val($(this).data("old"));
                return;
            }
            $(this).data("old", ($(this).val() - 0).toFixed(2));
            $(this).val(($(this).val() - 0).toFixed(2));
        });
    }
    // 获取公司
    $('#btnGetCompany').on('click', function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择公司", url: "/System/CompanyTree.aspx", width: 300, height: 500, callBack: function (data) {
                    if (data[0]) {
                        $("input[name=CompanyName]").val($('<div>' + data[0].text + '</div>').text());
                        $("input[name=CompanyGuid]").val(data[0].id);
                    }
                }
            });
        }
    });
    // 获取部门
    $('#btnGetDepartment').on('click', function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择部门", url: "/System/DepartmentTree.aspx", width: 300, height: 500, callBack: function (data) {
                    if (data[0]) {
                        $("input[name=DepartmentName]").val($('<div>' + data[0].text + '</div>').text());
                        $("input[name=DepartmentGuid]").val(data[0].id);
                    }
                }
            });
        }
    });

    ns.beforeCheck = function (){
        var regInt = /^[0-9]+$/;
        var regFloat = /^[+|-]*[0-9]+(\.[0-9]+)?$/;

        if ($("input[name=AirLuggageLimit]").val().length > 0 && !regFloat.test($("input[name=AirLuggageLimit]").val())) {
            if (typeof alertModal === "function") {
                alertModal("空运行李限制必须是数字!", function () {
                });
            } else {
                alert("空运行李限制必须是数字!");
            }
            return false;
        }
        if ($("input[name=ShippingLuggageLimit]").val().length > 0 && !regFloat.test($("input[name=ShippingLuggageLimit]").val())) {
            if (typeof alertModal === "function") {
                alertModal("海运行李限制必须是数字!", function () {
                });
            } else {
                alert("海运行李限制必须是数字!");
            }
            return false;
        }
        if ($("input[name=Japanese]").val().length > 0 && !regInt.test($("input[name=Japanese]").val())) {
            if (typeof alertModal === "function") {
                alertModal("现有日本人数必须是整数!", function () {
                });
            } else {
                alert("现有日本人数必须是整数!");
            }
            return false;
        }
        return true;
    }
})(window.System.CompanyDetail);

$(function () {
    window.System.CompanyDetail.initial();
});

function getReturnDate() {
    var ret = false;
    if (!window.System.CompanyDetail.beforeCheck()) {
        return false;
    }
    //提交
    $("#formUser").ajaxSubmit({
        async: false,
        success: function (data) {
            ret = true;
        }
    });
    return ret;
}

