window.DialogBox = window.DialogBox || {};
window.DialogBox.ids = window.top.DialogBox.ids || [];
window.DialogBox.box = window.top.DialogBox.box || [];
window.DialogBox.windows = window.top.DialogBox.windows || [];
window.DialogBox.callBack = window.top.DialogBox.callBack || [];

window.DialogBox.show = function(option) {
    window.DialogBox.callBack.push(option.callBack);
    var id = 'box' + window.DialogBox.ids.length;

    window.DialogBox.ids.push(id);
    var box;
    if (option.html) {
        box = $('<div class="modal fade" id="' + id + '" tabindex="-1" role="dialog" aria-labelledby="' + id + 'Label" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="exampleModalLabel">' + option.title + '</h4></div><div class="modal-body">' + option.html + '</div><div class="modal-footer"><button type="button" class="fa fa-times btn btn-default myClose" data-dismiss="modal">取消</button><button type="button" class="fa fa-check btn btn-primary myOk">确定</button></div></div></div></div>');
        box.find("div.modal-dialog").css("width", option.width + 'px');
        box.find("div.modal-body").css("height", option.height + 'px');
        window.DialogBox.windows.push(window);
    } else {
        box = $('<div class="modal fade" id="' + id + '" tabindex="-1" role="dialog" aria-labelledby="' + id + 'Label" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="exampleModalLabel">' + option.title + '</h4></div><div class="modal-body"><iframe width="100%" height="100%" frameborder="0" style="margin: 0; padding: 0;" scrolling="no"></iframe></div><div class="modal-footer"><button type="button" class="fa fa-times btn btn-default myClose" data-dismiss="modal">取消</button><button type="button" class="fa fa-check btn btn-primary myOk">确定</button></div></div></div></div>');
        box.find("div.modal-body > iframe").attr("src", option.url);
        box.find("div.modal-dialog").css("width", option.width + 'px');
        box.find("div.modal-body").css("height", option.height + 'px');
    }

    box.find("div.modal-footer button.myOk").click(function() {
        var data, func = window.DialogBox.windows[window.DialogBox.windows.length - 1].getReturnDate;
        if (typeof func === "function") {
            data = func();
            if (data === false) { return; }
        }
        window.DialogBox.close({ status: "OK", data: data });
    });
    box.find("div.modal-footer button.myClose").click(function() { window.DialogBox.close({}); });
    box.find("div.modal-header button.close").click(function() { window.DialogBox.close({}); });
    window.DialogBox.box.push(box[0]);
    window.top.$("body").append(box);
    if (option.url) {
        window.DialogBox.windows.push(window.top.$("#" + id + " div.modal-body > iframe")[0].contentWindow);
    } else {
        window.DialogBox.windows.push(window);
    }
    window.top.$('#' + window.DialogBox.ids[window.DialogBox.ids.length - 1]).modal();
}

window.DialogBox.close = function(result) {
    var func = window.top.DialogBox.callBack.pop();
    window.top.DialogBox.windows.pop();
    if (result.status == "OK") {
        func(result.data);
    }
    window.top.$('#' + window.DialogBox.ids[window.DialogBox.ids.length - 1]).modal('hide');
    var id = window.DialogBox.ids.pop();
    setTimeout(function() {
        var box = window.top.document.getElementById(id)
        window.top.document.body.removeChild(box);
    }, 100);
}