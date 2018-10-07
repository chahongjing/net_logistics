window.Utility.registerNameSpace('window.System.UserDetail');

(function(ns) {
    ns.initial = function() {
    }
    // 获取公司
    $('#btnGetCompany').on('click', function() {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({ title: "选择公司", url: "/System/CompanyTree.aspx", width: 300, height: 500, callBack: function(data) {
                if (data[0]) {
                    $("input[name=CompanyName]").val($('<div>' + data[0].text + '</div>').text());
                    $("input[name=CompanyGuid]").val(data[0].id);
                }
            }
            });
        }
    });
    // 获取部门
    $('#btnGetDepartment').on('click', function() {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({ title: "选择部门", url: "/System/DepartmentTree.aspx", width: 300, height: 500, callBack: function(data) {
                if (data[0]) {
                    $("input[name=DepartmentName]").val($('<div>' + data[0].text + '</div>').text());
                    $("input[name=DepartmentGuid]").val(data[0].id);
                }
            }
            });
        }
    });
})(window.System.UserDetail);

$(function() {
    window.System.UserDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#form').valid()) {
        //提交
        $("#form").ajaxSubmit({
            async: false,
            success: function(data) {
                ret = true;
            }
        });
    } else {
        ret = false;
    }
    return ret;
}