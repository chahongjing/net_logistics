window.Utility.registerNameSpace('window.System.UserDetail');

(function(ns) {
    ns.initial = function() {
    }
})(window.System.UserDetail);

$(function() {
    window.System.UserDetail.initial();
});

function getReturnDate() {
    var ret;
    //验证
    if ($('#formOrganization').valid()) {
        //提交
        $("#formOrganization").ajaxSubmit({
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