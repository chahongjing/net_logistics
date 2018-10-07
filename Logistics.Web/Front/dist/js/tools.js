//Jquery serializeArray()方法扩充，将FORM内容拼成json字符串
//用法：var formJson = $("#"+formId).serializeObject();
(function ($) {
    $.fn.serializeObject = function (strSplit) {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (strSplit != null) {
                var nameArr = this.name.split(strSplit);
                if (nameArr.length > 1) {
                    this.name = nameArr[1];
                }
            }
            //if ($.trim(this.value) != '') {//空值也需要收集
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            //}

        });
        return o;
    };
})(jQuery);

//Jquery 异步请求
(function ($) {
    $.fn.ajaxRequest = function (param, url) {
        var o = '';

		$.ajax({
            url: url,
            data: param,
            success: function (data) {
                o = data;
            }
        });
        
        return o;
    };
})(jQuery);

//Confirm对话框
(function ($) {
    confirmModal = function (content, successCallback, cancelCallback) {
		var confirmModalObj = $('<div class="modal fade">' +
									'<div class="modal-dialog modal-sm">' +
										'<div class="modal-content">' +
											'<div class="modal-header">' +
												'<button type="button" class="close" data-dismiss="modal">&times;</button>' +
												'<h6 class="blue bigger">温馨提示</h6>' +
											'</div>' +
											'<div class="modal-body">' + 
												content +		
											'</div>' +
											'<div class="modal-footer">' + 
												'<button class="btn btn-xs" id="cancel" data-dismiss="modal">' + 
													'<i class="ace-icon fa fa-times"></i>取消</button>' + 
												'<button class="btn btn-xs btn-primary" id="confirm">' +
													'<i class="ace-icon fa fa-check"></i>确定</button>' +
											'</div>' +
										'</div>' +
									'</div>' +
								'</div>');

		confirmModalObj.modal('show');

		confirmModalObj.find('button#confirm').on('click', function(){
			if (successCallback) {
				successCallback();
			}
			confirmModalObj.modal('hide');
		});

		confirmModalObj.find('button#cancel').on('click', function(){
			if (cancelCallback) {
				cancelCallback();
			}
		});
    };
})(jQuery);

//Alert对话框
(function ($) {
    alertModal = function (content, callback) {
    var confirmModalObj = $('<div class="modal fade">' +
									'<div class="modal-dialog modal-sm">' +
										'<div class="modal-content">' +
											'<div class="modal-header">' +
												'<button type="button" class="close" data-dismiss="modal">&times;</button>' +
												'<h6 class="blue bigger">温馨提示</h6>' +
											'</div>' +
											'<div class="modal-body">' + 
												content +		
											'</div>' +
											'<div class="modal-footer">' + 
												'<button class="btn btn-xs btn-primary" id="confirm">' +
													'<i class="ace-icon fa fa-check"></i>确定</button>' +
											'</div>' +
										'</div>' +
									'</div>' +
								'</div>');

		confirmModalObj.modal('show');

		confirmModalObj.find('button#confirm').on('click', function(){
			if (callback) {
				callback();
			}
			confirmModalObj.modal('hide');
		});
    };
})(jQuery);