window.Utility.registerNameSpace('window.System.RoleDetail');

(function(ns) {
    ns.initial = function() {
    }
})(window.System.RoleDetail);

$(function() {
window.System.RoleDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#formRole').valid()) {
        //提交
        $("#formRole").ajaxSubmit({
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