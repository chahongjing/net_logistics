//Confirm对话框
(function($) {
    window.top.__MaskLayer = window.top.__MaskLayer || [];


    showMask = function(type, info) {
        window.top.__MaskLayer.push(1);
        var confirmModalObj = window.top.$('<div id="__MaskLayer' + window.top.__MaskLayer.length + '" class="modal fade">' +
									'<div class="modal-dialog modal-sm" style="width:150px;">' +
										'<div class="modal-content">' +
											'<div class="modal-body"><img src="/Image/System/loading.gif" />&nbsp;<span style="vertical-align:middle;display:inline-block">' +
												(info || "处理中...") +
											'</span></div>' +
										'</div>' +
									'</div>' +
								'</div>');
        window.top.$("body").append(confirmModalObj);
        confirmModalObj.modal({ show: true, backdrop: "static" });
    };

    hideMask = function() {
        window.top.$('#__MaskLayer' + window.top.__MaskLayer.length).remove();
        window.top.__MaskLayer.pop();
    }
})(jQuery);