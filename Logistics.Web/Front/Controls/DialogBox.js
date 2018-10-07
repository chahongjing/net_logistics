window.DialogBox = window.DialogBox || {};
window.DialogBox.box_window = window.top.DialogBox.box_window || [];
window.DialogBox.box_mask = window.top.DialogBox.box_mask || [];
window.DialogBox.box_modle = window.top.DialogBox.box_modle || [];
window.DialogBox.box_callBack = window.top.DialogBox.box_callBack || [];

window.DialogBox.showDialog = function(option) {
    var mask = window.top.document.createElement("div-mask");
    mask.className = "box-mask";
    mask.setAttribute("z-index", 1000 + window.top.DialogBox.box_window.length * 10);
    mask.setAttribute("id", "box-mask" + window.top.DialogBox.box_window.length);
    window.top.document.body.appendChild(mask);

    var modle = window.top.document.createElement("div-box");
    modle.className = "box-modle";
    modle.setAttribute("z-index", 1001 + window.top.DialogBox.box_window.length * 10);
    modle.setAttribute("id", "box-modle" + window.top.DialogBox.box_window.length);
    modle.style.width = option.width + "px";
    modle.style.height = option.height + "px";
    modle.style.marginTop = "-" + option.height / 2 + "px";
    modle.style.marginLeft = "-" + option.width / 2 + "px";
    window.top.document.body.appendChild(modle);

    var head = window.top.document.createElement("div");
    head.setAttribute("id", "box-head" + window.top.DialogBox.box_window.length);
    head.className = "box-head";
    window.top.document.getElementById("box-modle" + window.top.DialogBox.box_window.length).appendChild(head);
    window.top.document.getElementById("box-head" + window.top.DialogBox.box_window.length).innerHTML = option.title;

    var closeIcon = window.top.document.createElement("img");
    closeIcon.setAttribute("id", "box-head-icon-close" + window.top.DialogBox.box_window.length);
    closeIcon.className = "icon-close";
    window.top.document.getElementById("box-head" + window.top.DialogBox.box_window.length).appendChild(closeIcon);
    window.top.document.getElementById("box-head-icon-close" + window.top.DialogBox.box_window.length).src = "/_frontend/css/images/laoliuc.ico";
    window.top.document.getElementById("box-head-icon-close" + window.top.DialogBox.box_window.length).click = function() { alert(); window.DialogBox.closeDialog({ status: 'Cancel' }); }

    var body;
    if (option.html) {
        body = window.top.document.createElement("div");
        body.setAttribute("id", "box-body" + window.top.DialogBox.box_window.length);
        body.className = "box-body";
        body.style.height = (option.height - 30) + "px";
        window.top.document.getElementById("box-modle" + window.top.DialogBox.box_window.length).appendChild(body);
        window.top.document.getElementById("box-body" + window.top.DialogBox.box_window.length).innerHTML = option.html;
    } else {
        body = window.top.document.createElement("iframe");
        body.setAttribute("id", "box-body" + window.top.DialogBox.box_window.length);
        body.className = "box-body";
        body.style.height = (option.height - 30) + "px";
        window.top.document.getElementById("box-modle" + window.top.DialogBox.box_window.length).appendChild(body);
        window.top.document.getElementById("box-body" + window.top.DialogBox.box_window.length).src = option.url;
    }

    window.top.DialogBox.box_mask.push(window.top.document.getElementById("box-mask" + window.top.DialogBox.box_window.length));
    window.top.DialogBox.box_modle.push(window.top.document.getElementById("box-modle" + window.top.DialogBox.box_window.length));
    window.top.DialogBox.box_window.push(window);
    window.top.DialogBox.box_callBack.push(option.closing);
}

window.DialogBox.closeDialog = function(result) {
    if (result.status == "OK") {
        window.top.DialogBox.box_callBack.pop()(result.data);
    }
    window.top.document.body.removeChild(window.DialogBox.box_mask.pop());
    window.top.document.body.removeChild(window.DialogBox.box_modle.pop());
    window.DialogBox.box_window.pop();
}