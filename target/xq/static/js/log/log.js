/**
 * Created by netlab606 on 2017/11/7.
 */
$(function () {
    $("#logUl li").eq(0).addClass("first");
    $(".first span").eq(0).css("color","red");
});

function addName() {
    var teacher_name=$(".select_teacher option:selected").html();
    $("input[name='teacher.name']").val(teacher_name);
    var demand_name=$(".select_demand option:selected").html();
    $("input[name='demand.name']").val(demand_name);
}

function exact() {
    $('.search_exact').show();
    $('input[name="isExactSearch"]').val(1);
}

function ob_select(obj) {
    if($(obj).attr("class").indexOf("ob_select")!=-1) {
        $(obj).find("input").removeAttr("checked");
        $(obj).removeClass("ob_select");
        $(obj).addClass("ob_no_select");
    }else{
        $(obj).find("input").prop("checked","true");
        $(obj).removeClass("ob_no_select");
        $(obj).addClass("ob_select");
    }
}