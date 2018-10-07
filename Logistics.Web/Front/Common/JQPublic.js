// 文件清单
// ajaxSetup
// fillForm
// getFormData
// setValue
// setText
// setAttr

// 函数名称： setValue
// 函数功能： 设置值
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-03-05 22:36:20
function setValue(id, val, pre, aft) {
    pre = pre || "";
    aft = aft || "";
    val = val || "";
    $("#" + id).val(pre + val + aft);
}
// 函数名称： setText
// 函数功能： 设置文本
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-03-05 22:36:29
function setText(id, val, pre, aft) {
    pre = pre || "";
    aft = aft || "";
    val = val || "";
    $("#" + id).text(pre + val + aft);
}
// 函数名称： setAttr
// 函数功能： 设置属性
// 函数参数： 无
// 返 回 值： 无
// 创 建 人： zengjy01
// 创建日期： 2014-03-05 22:36:39
function setAttr(id, attr, val, pre, aft) {
    pre = pre || "";
    aft = aft || "";
    val = val || "";
    $("#" + id).attr(attr, pre + val + aft);
}