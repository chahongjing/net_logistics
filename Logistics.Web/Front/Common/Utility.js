window.Utility = window.Utility || {};
window.Utility.Controls = window.Utility.Controls || {};
(function(ns) {
    // 函数名称： registerNameSpace
    // 函数功能： 注册命名空间
    // 函数参数： nameSpace    命名空间: a.b.c
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2014-02-22 21:01:54
    ns.registerNameSpace = function(nameSpace) {
        var arrNameSpace;
        var ns;

        if (!nameSpace) {
            return window;
        }
        arrNameSpace = nameSpace.split(".");
        ns = window;
        for (var i = 0; i < arrNameSpace.length; i++) {
            if (i == 0 && arrNameSpace[i] == "window") {
                continue;
            }

            ns[arrNameSpace[i]] = ns[arrNameSpace[i]] || {};
            ns = ns[arrNameSpace[i]];
        }
        return ns;
    }
    // 函数名称： processAjax
    // 函数功能： JQuery Ajax操作
    // 函数参数： optionData.url: ajax请求地址; optionData.getData: 用户数据(Json); optionData.postData: 用户数据(Json)
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2014-02-22 21:01:54
    ns.processAjax = function(optionData) {
        var url, ret;
        var startIndex, endIndex;
        var jReturn;

        if (!optionData.url) {
            return { "Status": "ERROR", "Message": "optionData.url参数未设置!", Value: null }
        }
        if (optionData.getData && typeof (optionData.getData) != "object") {
            return { "Status": "ERROR", "Message": "optionData.getData类型不匹配或参数未设置!", Value: null }
        }
        if (optionData.postData && typeof (optionData.postData) != "object") {
            return { "Status": "ERROR", "Message": "optionData.postData类型不匹配或参数未设置!", Value: null }
        }

        if (!optionData.getData) {
            url = optionData.url;
        } else {
            url = optionData.url + (optionData.url.indexOf("?") > -1 ? "&" : "?") + $.param(optionData.getData);
        }

        $.ajax({
            url: url,
            type: "post",
            async: (optionData.async === false ? false : true),
            dataType: "text",
            data: optionData.postData,
            success: function(data) {
                try {
                    jReturn = eval("(" + data + ")");
                } catch (ex) {
                    startIndex = data.indexOf("<title>");
                    if (startIndex > 0) {
                        endIndex = data.indexOf("</title>");
                        jReturn = { Status: "ERROR", Message: data.substring(startIndex + 7, endIndex), Value: null };
                    } else if (!data) {
                        jReturn = { Status: "ERROR", Message: "请求返回数据为空！", Value: null };
                    } else {
                        jReturn = { Status: "ERROR", Message: "返回Json数据失败！", Value: data };
                    }
                }
                if (optionData.callBack && typeof optionData.callBack === "function") {
                    ret = optionData.callBack(jReturn);
                } else {
                    ret = jReturn;
                }
            }
        });

        return ret;
    }

    // 函数名称： format
    // 函数功能： 用日期格式化(yyyy-MM-dd HH:mm:ss)
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2014-05-11 11:57:24
    Date.prototype.format = function(format) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "H+": this.getHours(),
            "h+": this.getHours() - 12,
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        }

        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }

        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }
})(window.Utility);

// 函数名称： ajaxSetup
// 函数功能： JQuery Ajax全局错误处理函数
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-02-22 21:01:54
$.ajaxSetup({ error: function(data) {
    try {
        jReturn = eval("(" + data.responseText.replace(/[\r\n]/g, "") + ")");
    } catch (ex) {
        startIndex = data.indexOf("<title>");
        if (startIndex > 0) {
            endIndex = data.indexOf("</title>");
            jReturn = { Status: "ERROR", Message: data.substring(startIndex + 7, endIndex), Value: null };
        } else if (!data) {
            jReturn = { Status: "ERROR", Message: "请求返回数据为空！", Value: null };
        } else {
            jReturn = { Status: "ERROR", Message: "返回Json数据失败！", Value: data };
        }
    }
    if (typeof alertModal === "function") {
        alertModal(jReturn.Message, function() {
        });
    } else {
        alert(jReturn.Message);
    }
},
    beforeSend: function () { return;if (typeof showMask === "function") { showMask(); } },
    complete: function () { return;if (typeof showMask === "function") { hideMask(); } }
});

/// 系统常量
window.Constant = {
    ResultStatus: { OK: "OK", NO: "NO", ERROR: "ERROR" },
    EmptyGuid: "00000000-0000-0000-0000-000000000000"
}