// 高级搜索JS

//关闭显示高级搜索
$(".advanceSearchBtn").on("click",function(){
    if($(this).hasClass("active")){
        $(this).removeClass("active").attr("title","展开高级搜索");
		$(this).find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
        $(".advanceSearch").slideUp("fast");
        
    }else{
        $(this).addClass("active").attr("title","收起高级搜索");
		$(this).find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
        $(".advanceSearch").slideDown("fast");
    }
});

function getChooseSerUL(objs){
	var str = "",arr = [];
	for(var i=0;i<objs.length;i++){
	    arr.push($(objs[i]).attr("oid") + '|' + $(objs[i]).text());
	}
	return str = arr.join(",");
}


//筛选条件单个选择 
$(document).on("click", "ul.advanceSerUL a", function () {
    if (!$(this).hasClass('icon-search')) {
        var id = $(this).attr("oid");
        var name = $.trim($(this).text());
        var pBox = $(this).parents(".advanceSerUL");
        var allSpan = pBox.find("span.all");
        allSpan.removeClass("active");

        if ($(this).closest('ul').hasClass('single')) {
            $(this).closest('ul').find('a').removeClass('active');
        }
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
        } else {
            $(this).addClass("active");
        }
        refreshAdSChoosed(pBox, true);
    }
});

//全选
$(document).on("click", "ul.advanceSerUL span.all", function () {
	if($(this).hasClass("active")){
		return false;
	}else{
		//$(this).addClass("active");
		var pBox = $(this).parents(".advanceSerUL");
		pBox.find("a.active").removeClass("active");
		refreshAdSChoosed(pBox, true);
	}
});

//删除
$(document).on("click", "#searchChoosed dl i", function () {
    var id = $(this).parents("dl").attr("id");
    if (id.indexOf('Date') == -1) {//不是删除时间
        var target = $("ul.advanceSerUL#" + id);
        target.find("a.active").removeClass("active");
		$(this).parents("dl").remove();
    } else {
        $(".date-picker-search").val("");
        $(this).parents("dl").remove();
    }
});

//将登记时间加入筛选项
function writeTimes(timeObj){
    var pBox = $(timeObj).parents(".advanceSerUL");
    var pdata = pBox.attr("data").split("|");
    var id = pdata[0];
    var text = pdata[1];
    var showDL = $("#searchChoosed #" + pdata[0]);
    var begin_time_input = pBox.find('input.start-time');
    var begin_time = begin_time_input.val();
    var end_time_input = pBox.find('input.end-time');
    var end_time = end_time_input.val();

    if (!begin_time || !end_time) {
        showDL.remove();
        return false;
    }else{
        if (showDL.length == 0) {
            showDL = $('<dl id="' + id + '"><span class="title">' + text + '：</span><span class="detail"></span><i class="ace-icon glyphicon glyphicon-remove" title="删除"></i></dl>');
            $("#searchChoosed").prepend(showDL);
        }
        var showSpan = showDL.find("span.detail");
        showSpan.text(begin_time + " - " + end_time);
    }
}


//更新指定选中项
function refreshAdSChoosed(obj, reload) {
	var obj = $(obj);
	var allSpan = obj.find("span.all");
	var choosedA = obj.find("a.active");
	var advanceSerHidden = obj.find(".advanceSerHidden");
	if(obj.find("li").hasClass("custom")){
		choosedA = obj.find("dl.active");
	}
	var pdata = obj.attr("data").split("|");
	var showDL = $("#searchChoosed #"+pdata[0]);
	if(showDL.length==0){
		showDL = $('<dl id="'+pdata[0]+'"><span class="title">'+pdata[1]+'：</span><span class="detail"></span><i class="ace-icon glyphicon glyphicon-remove" title="删除"></i></dl>');
		$("#searchChoosed").prepend(showDL);
	}
	
	var showSpan = showDL.find("span.detail");
	if(choosedA.length==0){
		allSpan.addClass("active");
		showDL.remove();
		advanceSerHidden.val("");
	}else{
		allSpan.removeClass("active");
		var choosedId = [], choosed = [], choosedT = [], choosedOid=[];
		for (var i = 0; i < choosedA.length; i++) {
		    choosedId.push($(choosedA[i]).attr("oid"));
		    choosedOid.push($(choosedA[i]).attr("oid"));
		    choosed.push($(choosedA[i]).attr("oid") + "|" + $.trim($(choosedA[i]).text()));
			choosedT.push($.trim($(choosedA[i]).text()));
		}
		advanceSerHidden.val(choosedId.join(","));
		obj.attr("choosed",choosed.join(","));
		showSpan.text(choosedT.join("、"));
		showSpan.attr('title',choosedT.join("、"));
	}

	var input = obj.find("input[name='Source']");
	if (input.length > 0 && reload) {
	    AdvanceSearch.getTypeBySource();
	}

}

//提交搜索
$("#confirmSearch").on("click", function () {

    var param = $("#advanceSearchForm").serializeObject();
    var url = $("#advanceSearchForm").attr("url");

	data = ajaxRequest(param, url);

	//加载


});

//重置筛选
function resetSearch(reload) {
	$("ul.advanceSerUL a,ul.advanceSerUL .custom dl").removeClass("active");
	$("ul.advanceSerUL span.all").addClass("active");
	var uls = $("ul.advanceSerUL");
	for(var i = 0;i<uls.length;i++){//更新所有选择项
	    refreshAdSChoosed(uls[i], reload);
	}

    //清空关键字
	$("#search_key").val("");
	//清空时间选择
	$(".formDateInput").val("");
	if (reload) {
	    AdvanceSearch.BaseSearch();
	}
};

//更新输入内容
function refreshAdSInput(obj) {
    var pBox = $(obj).parents(".advanceSerUL");
    var choosed_text = $.trim($(obj).val());
    var pdata = pBox.attr("data").split("|");
    var showDL = $("#searchChoosed #" + pdata[0]);
    if (choosed_text == "") {
        showDL.remove();
    } else if (showDL.length == 0) {
        showDL = $('<dl id="' + pdata[0] + '"><span class="title">' + pdata[1] + '：</span><span class="detail"></span><i class="ace-icon glyphicon glyphicon-remove" title="删除" class="input_delete"></i></dl>');
        $("#searchChoosed").prepend(showDL);
    }
    var showSpan = showDL.find("span.detail");
    showSpan.text(choosed_text);
    showSpan.attr('title', choosed_text);
}


//AJAX
var ajaxFun = function () {
	
}
