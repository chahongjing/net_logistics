window.Utility.registerNameSpace('window.System.FunctionDetail');

(function(ns) {
    ns.initial = function() {
    }
    // 获取系统
    $('#btnGetSystem').on('click', function() {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({ title: "选择系统", url: "/System/SystemTree.aspx", width: 300, height: 500, callBack: function(data) {
                if (data[0]) {
                    $("input[name=SystemName]").val($('<div>' + data[0].text + '</div>').text());
                    $("input[name=SystemGuid]").val(data[0].id);
                }
            }
            });
        }
    });
})(window.System.FunctionDetail);

$(function() {
    window.System.FunctionDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#formFunction').valid()) {
        //提交
        $("#formFunction").ajaxSubmit({
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