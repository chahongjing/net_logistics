﻿window.Utility.registerNameSpace('window.System.BusinessTypeDetail');

(function(ns) {
    ns.initial = function() {
        // 选择父级
        $('#lnkSelectParent').on('click', function() {
            if ($(this).attr("disabled") === undefined) {
                DialogBox.show({ title: "选择一级分类", url: "/System/FirstMenuTree.aspx", width: 300, height: 500, callBack: function(data) {
                    if (data[0]) {
                        $("input[name=ParentName]").val($('<div>' + data[0].text + '</div>').text());
                        $("input[name=ParentID]").val(data[0].id);
                    }
                }
                });
            }
        });
    }

    //    $("#formNavigation").validate({
    //    errorPlacement: function(error, element) {
    //        //window.top.bootbox.alert("1");
    //            //Append error within linked label
    //            $(element)
    //		        .closest("form")
    //			        .find("label[for='" + element.attr("id") + "']").find("span")
    //				        .prepend(error);
    //        }
    //    });

    ns.valid = function() {
        if ($("#lnkSelectParent").attr("disabled") === undefined && $("input[name=ParentGuid]").val() == "") {
            window.parent.alertModal('请选择父级分类!', function() {
                // 删除记录
            });
            return false;
        }
        return true;
    }
})(window.System.BusinessTypeDetail);

$(function() {
    window.System.BusinessTypeDetail.initial();
    var option = { errorElement: "em",
        errorContainer: null,
        errorPlacement: function(error, element) {
            bootbox.alert("1");
        }
    };
    $("#formBusinessType").validate(option);
});
function getReturnDate() {
    var ret = false;
    if (!window.System.BusinessTypeDetail.valid()) {
        return false;
    }
    //提交
    $("#formBusinessType").ajaxSubmit({
        async: false,
        success: function (data) {
            ret = true;
        }
    });
    return ret;
}