window.Utility.registerNameSpace('window.System.ActionDetail');

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
    // 获取模块
    $('#btnGetFunction').on('click', function() {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({ title: "选择模块", url: "/System/FunctionTree.aspx?systemGuid=" + $("input[name=SystemGuid]").val(), width: 300, height: 500, callBack: function(data) {
                if (data[0]) {
                    $("input[name=FunctionName]").val($('<div>' + data[0].text + '</div>').text());
                    $("input[name=FunctionGuid]").val(data[0].id);
                }
            }
            });
        }
    });
})(window.System.ActionDetail);

$(function() {
    window.System.ActionDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#formAction').valid()) {
        //提交
        $("#formAction").ajaxSubmit({
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