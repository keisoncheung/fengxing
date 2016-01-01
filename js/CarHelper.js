
function goCar(pid) {

    if ($("#calOneResult").val() == "") {
        alert("请选择出发日期！");
        return;
    }

    if ($("#zjiage").text() == "0") {
        alert("您还未选择任何一项项目！请选择后再提交购买！");
        return;
    }
    var godate = $("#calOneResult").val();
    var str_child1 = '{"ProId":"' + pid + '","GoDate":"' + godate + '","CarChilds":[';
    var str_child2 = "";
    for (var i = 1; i < 5; i++) {
        var _child = '';
        var gg = $(".ggpro" + i);
        var td_len = $(gg).find("#t" + i + "");

        if ($(td_len).length > 0 && $(td_len).val() != "0") {

            _child = _child + '{';
            _child = _child + '"CId":"' + $(td_len).attr("name") + '",';
            _child = _child + '"Cnum":"' + $(td_len).val() + '",';
            _child = _child + '"Price":"' + $(gg).find("#xzjg" + i + "").text() + '"';
            _child = _child + '},';
        }
        str_child2 = str_child2 + _child;
    }
    if (str_child2.length > 0) {
        str_child2 = str_child2.substring(0, str_child2.length - 1);
    }
    str_child1 = str_child1 + str_child2 + ']}';
    //var js_obj = JSON.parse(str_child1);

    $.get("ajaxclass.ashx", { "ntype": "addcar", "carinfo": str_child1 }, function (data) {

        window.location.href = "cart.aspx";
    }, "json");
}


function AddFavorite() {
    var url = window.location.href;
    $.get("ajaxclass.ashx", { "ntype": "AddMyFavorite", "pid": $("#inp_pid").val(), "url": url }, function (data) {

        var res = data.data[0];
        if (res.result == "0") {
            alert("未登录！");
            window.location.href = "login.aspx";
        }
        else if (res.result == "1") {
            alert("收藏成功！");
            $("#div_shoucang").text("已有" + res.num + "人收藏");
        }
        else if (res.result == "2")
            alert("您已收藏！");
        else if (res.result == "-1")
            alert("收藏失败！");
    }, "json");
}
