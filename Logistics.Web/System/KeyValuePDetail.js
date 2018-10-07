window.Utility.registerNameSpace('window.System.KeyValuePDetail');

(function(ns) {
    ns.initial = function() {
    }
    // 获取系统
    $('#btnGetParent').on('click', function() {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({ title: "选择父级", url: "/System/ParentKeyValuePairTree.aspx", width: 300, height: 500, callBack: function(data) {
                if (data[0]) {
                    $("input[name=ParentName]").val($('<div>' + data[0].text + '</div>').text());
                    $("input[name=ParentGuid]").val(data[0].id);
                }
            }
            });
        }
    });
})(window.System.KeyValuePDetail);

$(function() {
    window.System.KeyValuePDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#formKeyValueP').valid()) {
        //提交
        $("#formKeyValueP").ajaxSubmit({
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