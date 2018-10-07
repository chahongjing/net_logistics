window.Utility.registerNameSpace('window.System.CustomerDetail');

(function (ns) {
    ns.initial = function () {
        // 获取公司
        $('#btnGetCompany').on('click', ns.getCompany);
        // 获取业务类型
        $('#btnGetBusinessType').on('click', ns.getBusinessType);
        // 获取出发地
        $('#btnGetStartPlace').on('click', ns.getStartPlace);
        // 获取代理公司1
        $('#btnGetAgentOne').on('click', ns.getAgentOne);
        // 获取代理公司2
        $('#btnGetAgentTwo').on('click', ns.getAgentTwo);
        // 获取代理公司3
        $('#btnGetAgentThree').on('click', ns.getAgentThree);

        $('#btnAdd').on('click', ns.addStep);

        $('#tblList tbody tr').on('click', ns.rowClick);

        $('input[name=AgentOnePayment],input[name=AgentTwoPayment],input[name=AgentThreePayment]').blur(function () {
            if (isNaN($(this).val())) {
                $(this).val($(this).data("old"));
                return;
            }
            $(this).data("old", ($(this).val() - 0).toFixed(2));
            $(this).val(($(this).val() - 0).toFixed(2));
            ns.calcFactCost();
            ns.calcProfit();
        });
        $('input[name=SaleAmount]').blur(function () {
            if (isNaN($(this).val())) {
                $(this).val($(this).data("old"));
                return;
            }
            $(this).data("old", ($(this).val() - 0).toFixed(2));
            $(this).val(($(this).val() - 0).toFixed(2));
            ns.calcProfit();
        });
        $('input[name=LuggageAmount]').blur(function () {
            if (isNaN($(this).val())) {
                $(this).val($(this).data("old"));
                return;
            }
            $(this).data("old", ($(this).val() - 0).toFixed(2));
            $(this).val(($(this).val() - 0).toFixed(2));
        });

        $('input[name=CompanyName]').click(function () {
            var oid = $('input[name=CompanyID]').val();
            if (!oid) {
                return;
            }
            window.top.DialogBox.show({ title: "查看公司", url: "/System/CompanyDetail.aspx?mode=3&oid=" + oid, width: 1100, height: 450, callBack: function (data) {  } });
        });

        $('input[name=LuggageAmount],select[name=LuggageUnit]').change(ns.resetStarPlace);

        $('#tblList tbody tr:gt(0)').each(function (i, item) {
            $(item).find('input[name=EstimateDate],input[name=FinishDate]').change(function () { ns.setColor($(item)) });
        });
    }

    ns.getCompany = function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择公司", url: "/System/SelectCompany.aspx", width: 900, height: 570, callBack: function (data) {
                    if (data) {
                        $("input[name=CompanyName]").val(data.data("name"));
                        $("input[name=CompanyID]").val(data.data("oid"));
                    }
                }
            });
        }
    }
    ns.getBusinessType = function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择业务类型", url: "/System/SelectBusinessType.aspx", width: 900, height: 570, callBack: function (data) {
                    if (data) {
                        $("input[name=BusinessTypeName]").val(data.data("name"));
                        $("input[name=BusinessType]").val(data.data("oid"));
                        ns.getStep(data.data("oid"));
                    }
                }
            });
        }
    }
    ns.getStartPlace = function () {
        if ($(this).attr("disabled") === undefined) {
            var val = $.trim($('input[name=LuggageAmount]').val());
            if (val == "") {
                alertModal("请先输入行李量, 亲!", function () {
                    $('input[name=LuggageAmount]')[0].select();
                });
                return false;
            }
            DialogBox.show({
                title: "选择起运地", url: "/System/SelectPrice.aspx?amount=" + encodeURIComponent(val) + "&type=" + encodeURIComponent($('select[name=LuggageUnit]').val()), width: 900, height: 570, callBack: function (data) {
                    if (data) {
                        $("input[name=StartPlace]").val(data.data("startplace"));
                        $("input[name=DestinationPlace]").val(data.data("destinationplace"));
                        $("input[name=InterimPlace]").val(data.data("interimplace"));
                        $("input[name=AgentOneCost]").val(data.data("costone"));
                        $("input[name=AgentTwoCost]").val(data.data("costtwo"));
                        $("input[name=AgentThreeCost]").val(data.data("costthree"));
                        ns.calcCost();
                    }
                }
            });
        }
    }
    ns.getAgentOne = function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择代理店1", url: "/System/SelectAgentCompany.aspx", width: 900, height: 570, callBack: function (data) {
                    if (data) {
                        $("input[name=AgentOneName]").val(data.data("name"));
                        $("input[name=AgentOne]").val(data.data("oid"));
                    }
                }
            });
        }
    }
    ns.getAgentTwo = function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择代理店2", url: "/System/SelectAgentCompany.aspx", width: 900, height: 570, callBack: function (data) {
                    if (data) {
                        $("input[name=AgentTwoName]").val(data.data("name"));
                        $("input[name=AgentTwo]").val(data.data("oid"));
                    }
                }
            });
        }
    }
    ns.getAgentThree = function () {
        if ($(this).attr("disabled") === undefined) {
            DialogBox.show({
                title: "选择代理店3", url: "/System/SelectAgentCompany.aspx", width: 900, height: 570, callBack: function (data) {
                    if (data) {
                        $("input[name=AgentThreeName]").val(data.data("name"));
                        $("input[name=AgentThree]").val(data.data("oid"));
                    }
                }
            });
        }
    }

    ns.getStep = function (parentID) {
        Utility.processAjax({
            url: "/AjaxBusinessType/RetrieveList.cspx",
            postData: { parentID: parentID },
            async: false,
            callBack: function (data) {
                if (data.Status == window.Constant.ResultStatus.OK) {
                    for (var i = 0; i < data.Value.length; i++) {
                        ns.addRows(data.Value[i]);
                    }
                }
            }
        });
    }

    ns.addRows = function (data) {
        var tr = $('#tblList tbody tr:last');
        var trNew = tr.clone();
        var seq = tr.find('td:eq(0)').text();
        if (isNaN(seq)) {
            seq = $('#tblList tbody tr').length;
        } else {
            seq = seq - 0 + 1;
        }

        trNew.find('input[name=EstimateDate],input[name=FinishDate]').datepicker({ autoclose: true,todayHighlight:true }).next().on(ace.click_event, function () {
            $(this).prev().focus();
        });
        trNew.find('td:eq(0)').text(seq);
        trNew.find('input[name=StepName]').val(data.Name);
        trNew.find('input[name=EstimateDate]').val("");
        trNew.find('input[name=FinishDate]').val("");
        trNew.find('input[name=Memo]').val(data.Memo);
        trNew.removeClass('hide');
        trNew.data('oid', window.Constant.EmptyGuid);
        trNew.click(ns.rowClick);
        trNew.find('input[name=EstimateDate],input[name=FinishDate]').change(function () { ns.setColor(trNew) });
        $('#tblList').append(trNew);
    }

    ns.addStep = function () {
        ns.addRows({Name: "", Memo: ""});
    }

    ns.setColor = function (tr) {
        var begin = tr.find('input[name=EstimateDate]').val(), end = tr.find('input[name=FinishDate]').val();
        var now = new Date().format('yyyy-MM-dd');
        var status = {}; 
        // 过去
        if ((begin < now && begin) || end) {
            // 提前完成 绿色勾
            if (begin >= end && end) {
                status.status = "fa fa-check-circle green";
                status.statusTips = "顺利完成!";
            }
                // 超时完成 红色叉
            else if (begin < end && end) {
                status.status = "fa fa-times-circle red";
                status.statusTips = "超时未完成!";
            }
                // 时间未填写 灰色问号
            else {
                status.status = "fa fa-question grey";
                status.statusTips = "超时未填写!";
            }
        }
            // 未来
        else {
            // 如果填写的完成日期
            if(end) {
                if (begin >= end) {
                    status.status = "fa fa-check-circle green";
                    status.statusTips = "顺利完成!";
                } else {
                    status.status = "fa fa-times-circle red";
                    status.statusTips = "超时未完成!";
                }
            }
            // 指定天数之内
            else if (begin <= $('input[name=limitDate]').val() && begin) {
                status.status = "fa fa-bell red";
                status.statusTips = "待办事项, 请注意提前准备!";
            }
            else {
                status.status = "fa fa-circle blue";
                status.statusTips = "将来处理事项!";
            }
            // 指定天数之外
        }
        tr.find('td:eq(1)').find('i').attr({ 'class': status.status, 'title': status.statusTips });
    }

    ns.rowClick = function() {
        $(this).addClass('selected').siblings().removeClass('selected');
    }

    ns.deleteRecord = function (obj) {
        confirmModal('确实要删除记录吗?', function () {
            // 删除记录
            $(obj).closest("tr").remove();
            $('#tblList tbody tr:gt(0)').each(function () {
                $(this).find('td:eq(0)').text($(this).index());
            });
        });
    }

    ns.beforeCheck = function () {
        var arr = $('#tblList tbody tr:gt(0)');
        var tr;
        for (var i = 0; i < arr.length; i++) {
            tr = $(arr[i]);
            if ($.trim(tr.find('input[name=StepName]').val()) == "") {
                alertModal("流程步骤中第" + tr.find('td:eq(0)').text() + "行 步骤名称 必填!", function () {
                });
                return false;
            }
            if ($.trim(tr.find('input[name=EstimateDate]').val()) == "") {
                alertModal("流程步骤中第" + tr.find('td:eq(0)').text() + "行 预计完成日期 必填!", function () {
                });
                return false;
            }
            //if (tr.find('input[name=FinishDate]').val() != "" && tr.find('input[name=FinishDate]').val() < tr.find('input[name=EstimateDate]').val()) {
            //    alertModal("流程步骤中第" + tr.find('td:eq(0)').text() + "行 实际完成日期 不能小于 预计完成日期!", function () {
            //    });
            //    return false;
            //}
        }

        return true;
    }

    ns.resetStarPlace = function () {
        $('input[name=StartPlace],input[name=DestinationPlace],input[name=InterimPlace]').val('');
        $('input[name=AgentOneCost],input[name=AgentTwoCost],input[name=AgentThreeCost],input[name=BidCost]').data('old', '0.00').val('0.00');
    }

    ns.calcCost = function () {
        var val = ($('input[name=AgentOneCost]').val() - 0) + ($('input[name=AgentTwoCost]').val() - 0) + ($('input[name=AgentThreeCost]').val() - 0);
        $('input[name=BidCost]').val(val.toFixed(2));
    }
    ns.calcFactCost = function () {
        var val = ($('input[name=AgentOnePayment]').val() - 0) + ($('input[name=AgentTwoPayment]').val() - 0) + ($('input[name=AgentThreePayment]').val() - 0);
        $('input[name=FactCost]').val(val.toFixed(2));
    }
    ns.calcProfit = function () {
        var val = ($('input[name=SaleAmount]').val() - 0) - ($('input[name=FactCost]').val() - 0);
        $('input[name=Profit]').val(val.toFixed(2));
    }
})(window.System.CustomerDetail);

$(function () {
    window.System.CustomerDetail.initial();
});

function getReturnDate() {
    var ret = false;
    if (!window.System.CustomerDetail.beforeCheck()) {
        return false;
    }
    var arr = [];
    $('#tblList tbody tr:gt(0)').each(function () {
        arr.push(getRowData(this));
    });
    //提交
    $("#form").ajaxSubmit({
        async: false,
        data: { stepList: JSON.stringify(arr) },
        success: function (data) {
            ret = true;
        }
    });
    return ret;
}

function getRowData(row) {
    var o = {};
    $row = $(row);
    o.ID = $row.data('oid');
    o.Seq = $row.find('td:eq(0)').text();
    o.StepName = $row.find('input[name=StepName]').val();
    o.EstimateDate = $row.find('input[name=EstimateDate]').val();
    o.FinishDate = $row.find('input[name=FinishDate]').val();
    o.Memo = $row.find('input[name=Memo]').val();
    return o;
}