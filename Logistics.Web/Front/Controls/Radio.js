window.Utility.registerNameSpace("window.Utility.Controls.Radio");

(function(ns, undefined) {
    //radio点击事件
    ns.click = function(o, callback) {
        var _label = $(o);
        var _radio = $(o).find("input[type=radio]");
        _label.addClass("active").siblings().removeClass("active");
        _radio.prop("checked", true);
        if (callback) {
            setTimeout(function() {
                callback();
            }, 100);
        }
    }

    //radio禁用
})(window.Utility.Controls.Radio);