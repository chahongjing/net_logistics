
window.Utility.registerNameSpace('window.System.SystemDetail');


(function(ns) {
    ns.initial = function() {
    }
})(window.System.SystemDetail);

$(function() {
window.System.SystemDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#formSystem').valid()) {
        //提交
        $("#formSystem").ajaxSubmit({
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