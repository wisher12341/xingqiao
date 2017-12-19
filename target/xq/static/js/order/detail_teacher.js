/**
 * Created by netlab606 on 2017/11/13.
 */
function remind(lid,obj,oid) {
    $.ajax({
        type: "POST",
        url: "/wx/teacherCenter/log/remind",
        data:{
            lid:lid,
            oid:oid
        },
        dataType: "json",
        success: function (data) {
            if(data.success==true){
                $(obj).html("已提醒");
            }
        }
    });
}
//图片放大
function picAdd(obj) {

    $(".tishi").append($('<img src="'+$(obj).attr("src")+'" width="90%">'));

    $(".ts_mask").fadeIn(500);

}
$(".ts_mask").click(function () {
    $(".ts_mask").fadeOut(500);
    $('.tishi').html("");
});

