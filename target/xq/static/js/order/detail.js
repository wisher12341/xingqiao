/**
 * Created by netlab606 on 2017/11/10.
 */
//图片放大
function picAdd(obj) {

    $(".tishi").append($('<img src="'+$(obj).attr("src")+'" width="90%">'));

    $(".ts_mask").fadeIn(500);

}
$(".ts_mask").click(function () {
    $(".ts_mask").fadeOut(500);
    $('.tishi').html("");
});

$("#input-22a").rating({
    showClear: false
});

function allLogConfirm(orderId) {
    $.ajax({
        type: "POST",
        url: "/wx/log/allConfirm",
        data:{
            orderId:orderId
        },
        dataType: "json",
        success: function (data) {
            if(data.success==true){
                location.reload();
            }
        }
    });
}

function logConfirm(rid,oid) {
    $.ajax({
        type: "POST",
        url: "/wx/log/confirm",
        data:{
            id:rid,
            oid:oid
        },
        dataType: "json",
        success: function (data) {
            if(data.success==true){
                location.reload();
            }
        }
    });
}