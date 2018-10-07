// 文件清单
// trim()
// leftTrim()
// rightTrim()
// XmlHttp类
// XmlHelper类
// objectToXml
// openFullWindow
// openFullDialog
// setFullWindow
// replaceUrlKey
// initialQuery
// getQueryString
// isArray
// addEvent
// clickCheckBox
// setAllCheck
// setCheck
// htmlEncode
// htmlDncode
// keyPre
// isInArray
// fillForm
// getFormData
// isEmpty
// jsonDateToDate
// format
// processAjax
// objectToParam
// openPostPage


// 函数名称： trim
// 函数功能： 用正则表达式去掉字符串前后空格
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:29:26
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
// 函数名称： leftTrim
// 函数功能： 用正则表达式去掉字符串前面的空格
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:29:40
String.prototype.leftTrim = function() {
    return this.replace(/^\s*/g, "");
}
// 函数名称： rightTrim
// 函数功能： 用正则表达式去掉字符串后面的空格
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:29:54
String.prototype.rightTrim = function() {
    return this.replace(/\s*$/g, "");
}
// 类 名 称： XmlHttp
// 类 功 能： Ajax处理类
// 类 参 数： strUrl:请求的通道页面; strMode: 业务标识; strXml:要发送的Post值
// 返 回 值： Ajax处理完成后的返回值
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:30:06
function XmlHttp(strUrl, strMode, strXml) {
    this.strUrl = "";
    this.strMode = "";
    this.strXml = strXml;
    this.strResponseXML = "";
    this.strResponseText = "";

    this.strUrl = (!strUrl) ? "" : strUrl;
    this.strMode = (!strMode) ? "" : strMode;

    // 函数名称： doXmlHttp
    // 函数功能： 处理Ajax请求
    // 函数参数： 返回处理后的结果
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-09-15 11:42:57
    if (typeof this.doXmlHttp != "function") {
        XmlHttp.prototype.doXmlHttp = function() {
            var xmlHttp;
            //地址中没有参数
            this.strUrl += (this.strUrl.indexOf("?") > -1 ? "&" : "?") + "mode=" + escape(this.strMode) + "&__random=" + Math.random();
            xmlHttp = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");

            if (!this.strXml) {
                xmlHttp.open("GET", encodeURIComponent(this.strUrl), false);
                xmlHttp.send();
            } else {
                xmlHttp.open("POST", encodeURIComponent(this.strUrl), false);
                xmlHttp.send(this.strXml);
            }
            this.strResponseText = xmlHttp.responseText;
            this.strResponseXML = xmlHttp.responseXML;
            return this.strResponseText;
        }
    }
    // 函数名称： toString
    // 函数功能： 返回类信息
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-09-15 11:43:29
    if (typeof this.toString != "function") {
        XmlHttp.prototype.toString = function() {
            var strT = "";
            if (this.strXml !== "") {
                strT = this.strXml;
            }
            return "Url=" + this.strUrl + "\nMode=" + this.strMode + "\nXml=" + strT;
        }
    }
}
// 类 名 称： XmlHelper
// 类 功 能： 创建xml字符串类
// 类 参 数： strTable: 表名; strPk: 主键; strPkValue: 主键值; strType: 类型(1新增, 2修改, 3删除)
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-11-27 22:21:22
function XmlHelper(strTable, strPk, strPkValue, strType) {
    this.xmlDoc;
    this.root;

    // 函数名称： addNode
    // 函数功能： 添加子结点
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-11-27 22:23:26
    if (typeof this.addNode != "function") {
        XmlHelper.prototype.addNode = function(nodeName, nodeValue) {
            var node;
            node = this.xmlDoc.createElement(nodeName);
            node.text = nodeValue;
            this.root.appendChild(node);
        }
    }

    // 函数名称： LoadXml
    // 函数功能： 加载xml
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-12-14 13:41:25
    if (typeof this.LoadXml != "function") {
        XmlHelper.prototype.LoadXml = function(xml) {
            var xmlDoc;
            if (window.ActiveXObject) {
                xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
            } else if (document.implementation && document.implementation.createDocument) {
                xmlDoc = document.implementation.createDocument("", "", null);
            }

            try {
                xmlDoc.loadXML(xml);
            } catch (ex) {
                return null;
            }
            return xmlDoc;
        }
    }

    // 函数名称： getNodeAttribute
    // 函数功能： 获取结点属性
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-12-14 13:42:46
    if (typeof this.getNodeAttribute != "function") {
        XmlHelper.prototype.getNodeAttribute = function(node, attrName) {
            // node.attributes;
            return node.getAttribute(attrName);
        }
    }
    // 函数名称： getNodeName
    // 函数功能： 获取结点名称
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-12-14 13:42:46
    if (typeof this.getNodeName != "function") {
        XmlHelper.prototype.getNodeName = function(node) {
            return node.nodeName;
        }
    }
    // 函数名称： getNodeXml
    // 函数功能： 获取结点xml
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-12-14 13:42:46
    if (typeof this.getNodeXml != "function") {
        XmlHelper.prototype.getNodeXml = function(node) {
            return node.xml;
        }
    }
    // 函数名称： getNodeText
    // 函数功能： 获取结点名称
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-12-14 13:42:46
    if (typeof this.getNodeText != "function") {
        XmlHelper.prototype.getNodeText = function(node) {
            // xmlDoc.getElementsByTagName("title")[0].nodeValue;
            return node.text;
        }
    }

    // 函数名称： toString
    // 函数功能： 获取Xml字符串
    // 函数参数： 无
    // 返 回 值： 无
    // 创 建 人： zengjy01
    // 创建日期： 2013-11-27 22:23:42
    XmlHelper.prototype.toString = function() {
        return this.xmlDoc.xml;
    }

    this.xmlDoc = this.LoadXml("<" + strTable + "></" + strTable + ">");
    // 获取根结点
    this.root = this.xmlDoc.documentElement;
    this.root.setAttribute("Key", strPk);
    this.root.setAttribute("KeyValue", strPkValue);
    this.root.setAttribute("Type", strType ? strType : 1);
}
// 函数名称： objectToXml
// 函数功能： 对象转xml
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-08-05 20:56:54
function objectToXml(obj, nodeName, space) {
    var xml = [];
    var item, itemAttr, itemList, text;

    space = space || [];
    // 普通类型
    if (!(obj instanceof Object)
        || obj instanceof Number
        || obj instanceof String
        || obj instanceof Boolean
        || obj instanceof Date) {
        xml.push(space.join("") + "<" + htmlEncode(nodeName) + ">");
        if (obj instanceof Date) {
            xml.push(htmlEncode(obj.format("yyyy-MM-ddTHH:mm:ss")));
        } else {
            xml.push(htmlEncode(obj.toString()));
        }
        xml.push("</" + htmlEncode(nodeName) + ">" + "\r\n");
        return xml.join("");
    }

    // 添加属性和文本
    if (!(obj instanceof Array)) {
        xml.push(space.join("") + "<" + htmlEncode(nodeName));
        text = "";
        for (item in obj) {
            if (item === "__attr") {
                for (itemAttr in obj[item]) {
                    xml.push(" " + htmlEncode(itemAttr) + "=\"" + htmlEncode(obj[item][itemAttr]) + "\"");
                }
            } else if (item === "__text") {
                text = obj[item].toString();
            }
        }
        xml.push(">" + htmlEncode(text) + "\r\n");
    }
    // 遍历所有属性(除节点属性和文本)
    for (item in obj) {
        if (item === "__attr" || item === "__text" || obj[item] instanceof Function) {
            continue;
        }
        // 属性为数组
        if (obj[item] instanceof Array) {
            for (itemList in obj[item]) {
                space.push("  ");
                xml.push(objectToXml(obj[item][itemList], item, space));
                space.pop();
            }
        } else {
            space.push("  ");
            xml.push(objectToXml(obj[item], item, space));
            space.pop();
        }
    }
    xml.push(space.join("") + "</" + htmlEncode(nodeName) + ">" + "\r\n");
    return xml.join("");
}
// 函数名称： openFullWindow
// 函数功能： 打开全屏页面
// 函数参数： strPath:页面路径; strTyp:打开页面类型本页面还是新页面; strFeature:窗口特征
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:32:21
function openFullWindow(strPath, strType, strFeature) {
    var strXY;
    var intX, intY;

    intX = window.screen.width - 20;
    intY = window.screen.height - 170;

    //fullscreen=1 最大化
    strXY = "left=0, top=0, height=" + intY + ", width=" + intX;

    strFeature = strXY + ", " + (!strFeature ? "resizable=1, menubar=1, status=1, scrollbars=1, toolbar=1, titlebar=1, location=1" : strFeature);
    strType = !strType ? "_blank" : strType;
    window.open(strPath, strType, strFeature);
}
// 函数名称： openFullDialog
// 函数功能： 打开全屏对话框
// 函数参数： strPath:页面路径; strParam:参数; strFeature:窗口特征
// 返 回 值： 窗口返回值
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:33:28
function openFullDialog(strPath, strParam, strFeature) {
    var strXY;
    var intX, intY;

    intX = window.screen.width - 20;
    intY = window.screen.height - 170;

    strXY = "dialogHeight=" + intY + "; dialogWidth=" + intX;

    strFeature = strFeature == "" ? strXY : strFeature + "; " + strXY
    return showModalDialog(strPath, strParam, strFeature);
}
// 函数名称： setFullWindow
// 函数功能： 设置页面全屏
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:34:16
function setFullWindow() {
    var intX, intY;

    intX = window.screen.width;
    intY = window.screen.height;

    window.moveTo(0, 0);
    window.resizeTo(intX, intY);
}
// 函数名称： replaceUrlKey
// 函数功能： 替换URL中的键对应的值
// 函数参数： strKey:键名; strValue:要替换的新值; strUrl:Url
// 返 回 值： 替换后的Url
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:34:38
function replaceUrlKey(strKey, strValue, strUrl) {
    var regQuery;

    regQuery = new RegExp("(\\?|&)(" + strKey + "=[^&]*)(&|$)", "i");

    if (!strUrl) {
        strUrl = window.location.href;
    }
    strUrl = strUrl + "";
    return strUrl.replace(regQuery, "$1" + strKey + "=" + strValue + "$3");
}
// 函数名称： initialQuery
// 函数功能： 初始化查询信息, 添加到window.Query集合中
// 函数参数： url: url字符串
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-20 22:03:33
function initialQuery(url) {
    var reg, regKeyValue;
    var arrQuery, arrKeyValue;

    reg = new RegExp("\\?(.*)$", "i");
    regKeyValue = new RegExp("(.+)=(.*)", "i");

    if (!url) {
        url = window.location.href;
    }

    // 将查询信息放在window.Query集合里
    window.Query = [];
    arrQuery = url.match(reg);
    if (!arrQuery || !arrQuery[1]) {
        return;
    }
    arrQuery = arrQuery[1].split("&");

    for (i = 0; i < arrQuery.length; i++) {
        arrKeyValue = arrQuery[i].match(regKeyValue);
        if (!arrKeyValue) { continue; }
        window.Query[arrKeyValue[1]] = arrKeyValue[2];
    }
}
// 函数名称： getQueryString
// 函数功能： 从地址中获取键值
// 函数参数： strKey: 键名; strUrl: 路径
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:35:49
function getQueryString(strKey, strUrl) {
    var regQuery = new RegExp("(\\?|&)" + strKey + "=([^&]*)(&|$)", "i");
    var arrKeyAndValue;
    if (!strUrl) {
        strUrl = window.location.href;
    }
    strUrl = strUrl + "";
    arrKeyAndValue = strUrl.match(regQuery);
    if (arrKeyAndValue) {
        return arrKeyAndValue[2];
    } else {
        return false;
    }
}
// 函数名称： isArray
// 函数功能： 判断是否是数组
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:36:48
function isArray(value) {
    return Object.prototype.toString.call(value) == "[object Array]";
}
// 函数名称： isInArray
// 函数功能： 是否在数组中
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-25 09:45:20
function isInArray(arr, val) {
    var i;
    if (!isArray(arr)) {
        return false;
    }

    for (i = 0; i < arr.length; i++) {
        if (arr[i] === val) {
            return true;
        }
    }
    return false;
}
// 函数名称： addEvent
// 函数功能： 为复选框添加事件
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:46:05
function addEvent() {
    var i;
    var arrCheck, arrCheckAllGroup;
    var chkAll;

    arrCheckAllGroup = [];
    arrCheck = document.getElementsByTagName("input");
    chkAll = document.getElementById("chkAll");
    for (i = arrCheck.length - 1; i > -1; i--) {
        arrCheck[i].onclick = function() {
            clickCheckBox(chkAll, arrCheck, this);
        }
    }
    chkAll.onclick = function() {
        clickCheckBox(chkAll, arrCheck, this);
    }
}
// 函数名称： clickCheckBox
// 函数功能： 复选框的选择操作
// 函数参数： chkAll: 全选框; arrCheckGroup: 其余复选框; obj: 点击的复选框
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:40:44
function clickCheckBox(chkAll, arrCheckGroup, obj) {
    //全选
    if (chkAll === obj) {
        setAllCheck(chkAll, arrCheckGroup, obj);
    } else {
        //点击单个复选框
        setCheck(chkAll, arrCheckGroup, obj);
    }
}
// 函数名称： setAllCheck
// 函数功能： 全选
// 函数参数： chkAll: 全选框; arrCheckGroup: 其余复选框; obj: 点击的复选框
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:40:55
function setAllCheck(chkAll, arrCheckGroup, obj) {
    var i, j;
    var bolStatus;

    if (chkAll.checked) {
        bolStatus = true;
    } else {
        bolStatus = false;
    }

    for (i = 0, j = arrCheckGroup.length; i < j; i++) {
        arrCheckGroup[i].checked = bolStatus;
    }
}
// 函数名称： setCheck
// 函数功能： 点击单个复选框
// 函数参数： chkAll: 全选框; arrCheckGroup: 其余复选框; obj: 点击的复选框
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-09-12 21:41:05
function setCheck(chkAll, arrCheckGroup, obj) {
    var i, j;

    for (i = 0, j = arrCheckGroup.length; i < j; i++) {
        if (!arrCheckGroup[i].checked) {
            chkAll.checked = false;
            return;
        }
    }
    chkAll.checked = true;
}
// 函数名称： htmlEncode
// 函数功能： html编码
// 函数参数： str: 要编码的字符串
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-19 22:46:14
function htmlEncode(str) {
    // 复制权 &copy; 注册 &reg; 乘号 &times; 除号 &divide; 单引号 &apos; &mdash;
    //return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/'/g, "&apos;").replace(/"/g, "&quot;");
    var regExp = /[<>&'"]/g;

    return str.toString().replace(regExp, function(strChar, intPosition, strOldText) {
        switch (strChar) {
            case "<":
                return "&lt;";
                break;
            case ">":
                return "&gt;";
                break;
            case "&":
                return "&amp;";
                break;
            case "'":
                return "&apos;";
                break;
            case "\"":
                return "&quot;";
                break;
            default:
                return strChar;
                break;
        }
    });
}
// 函数名称： htmlDncode
// 函数功能： html解码
// 函数参数： str: 要解码的字符串
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-19 22:46:14
function htmlDncode(str) {
    return str.replace(/&quot;/g, "\"").replace(/&apos;/g, "'").replace(/&gt;/g, ">").replace(/&lt;/g, "<").replace(/&amp;/g, "&");
}
// 函数名称： keyPre
// 函数功能： 键盘事件
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-25 09:45:20
function keyPre(e) {
    if (window.event) {
        keynum = e.keyCode;
    } else if (e.which) {
        keynum = e.which;
    }
    if (keynum == 13) {
        //initialGrid();
        //onkeypress = "keyPre(event)"
    }
}
// 函数名称： quickSort
// 函数功能： 快速排序
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-25 09:45:20
function quickSort(oldArray, low, high) {
    var i, j, temp;
    i = low;
    j = high;
    temp = oldArray[low];

    while (i < j) {
        while (i < j && oldArray[j] > temp) {
            j--;
        }
        oldArray[i] = oldArray[j];
        while (i < j && oldArray[i] < temp) {
            i++;
        }
        oldArray[j] = oldArray[i];
    }

    if (low < i - 1) {
        quickSort(oldArray, low, i - 1);
    }
    if (high > i - 1) {
        quickSort(oldArray, i - 1, high);
    }
}
// 函数名称： bubbleSort
// 函数功能： 冒泡排序
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2013-12-25 09:45:20
function bubbleSort(oldArray, n) {
    var i, j, temp, flag;

    for (i = 0; i < n - 2; i++) {
        flag = 0;
        for (j = n - 1; j > i; j++) {
            if (oldArray[j] > oldArray[j - 1]) {
                temp = oldArray[j];
                oldArray[j] = oldArray[j - 1];
                oldArray[j - 1] = temp;
            }
        }
        if (flag == 0) {
            break;
        }
    }
}
// 函数名称： isNullOrUndefined
// 函数功能： 判断值是否为空或未定义
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-03-05 22:35:09
function isEmpty(val) {
    return val === "" || val === null || val === undefined;
}

// 函数名称： jsonDateToDate
// 函数功能： 将json格式的日期转为日期对象
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-05-11 11:52:43
function jsonDateToDate(jsonDate) {
    var reg = /^\/Date\((\d+)([+-]\d+)?\)\/$/;
    var arrMatch = reg.exec(jsonDate);
    if (arrMatch.length > 1 && arrMatch[1]) {
        return new Date(parseInt(arrMatch[1], 10));
    } else {
        return null;
    }
}


// 函数名称： processAjax
// 函数功能： 发送ajax请求
// 函数参数： optionData: 要发送的数据. optionData.url: 请求路径; optionData.ywType: 请求业务类型; optionData.postData: post的数据; optionData.getData: get的数据
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-09-01 11:57:24
function processAjax(optionData, isEncode) {
    var strPath, strReturn;
    var startIndex, endIndex;
    var jReturn;
    if (!optionData || typeof (optionData) != "object") {
        return { "Status": "ERROR", "Message": "optionData类型有误!", Value: null }
    }
    if (!optionData.url) {
        return { "Status": "ERROR", "Message": "optionData.url参数未设置!", Value: null }
    }
    if (!optionData.ywType) {
        return { "Status": "ERROR", "Message": "optionData.ywType参数未设置!", Value: null }
    }
    if (!optionData.getDat) {
        strPath = optionData.url;
    } else {
        strPath = optionData.url + (optionData.url.indexOf("?") > -1 ? "&" : "?") + objectToParam(optionData.getData, isEncode);
    }
    strReturn = openXMLHTTP(strPath, optionData.ywType, optionData.postData || null);
    try {
        jReturn = eval("(" + strReturn.replace(/[\r\n]/g, "") + ")");
    } catch (ex) {
        startIndex = strReturn.indexOf("<title>");
        if (startIndex > 0) {
            endIndex = strReturn.indexOf("</title>");
            jReturn = { Status: "ERROR", Message: strReturn.substring(startIndex + 7, endIndex), Value: null };
        } else if (!strReturn) {
            jReturn = { Status: "ERROR", Message: "请求返回数据为空！", Value: null };
        } else {
            jReturn = { Status: "ERROR", Message: "返回Json数据失败！", Value: null };
        }
    }
    return jReturn;
}

// 函数名称： objectToParam
// 函数功能： 实体转化为url参数
// 函数参数： objectData: 实体; isEncode: 是否编码
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-09-01 11:34:24
function objectToParam(objectData, isEncode) {
    var arr = [];
    var val;

    for (var item in objectData) {
        if (typeof (objectData[item]) == "function") {
            val = objectData[item]();
        } else {
            val = objectData[item];
        }

        if (isEncode) {
            arr.push(encodeURIComponent(encodeURIComponent(item)) + "=" + encodeURIComponent(encodeURIComponent(val)))
        } else {
            arr.push(item + "=" + val)
        }
    }
    return arr.join("&");
}
// 函数名称： openPostPage
// 函数功能： 以post方式打开一个页面
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-09-01 21:36:48
function openPostPage(pageInfo) {
    var search;

    if (!pageInfo.url) {
        alert("pageInfo.url参数错误!");
        return;
    }
    if (pageInfo.getDate && typeof (pageInfo.getDate) != "object") {
        alert("pageInfo.getDate参数错误!");
        return;
    }
    if (pageInfo.getDate && typeof (pageInfo.postDate) != "object") {
        alert("pageInfo.postDate参数错误!");
        return;
    }

    var form = document.createElement("form");
    form.style.display = "none";
    form.setAttribute("method", pageInfo.method ? pageInfo.method : "post");
    form.setAttribute("target", pageInfo.target ? pageInfo.target : "_blank");

    search = [];
    for (var item in pageInfo.getData) {
        search.push(item + "=" + encodeURIComponent(pageInfo.getData[item]));
    }
    form.setAttribute("action", pageInfo.url + (pageInfo.url.indexOf("?") > -1 ? "&" : "?") + search.join("&"));

    for (var item in pageInfo.postData) {
        var child = document.createElement("input");
        child.setAttribute("type", "hidden");
        child.setAttribute("id", item);
        child.setAttribute("name", item);
        child.setAttribute("value", pageInfo.postData[item]);
        form.appendChild(child);
    }

    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
}