/**
 * Created by netlab606 on 2017/11/7.
 */

function addName() {
    var teacher_name=$(".select_teacher option:selected").html();
    $("input[name='teacher.name']").val(teacher_name);
    var demand_name=$(".select_demand option:selected").html();
    $("input[name='demand.name']").val(demand_name);
}

function ob_select(obj) {
    if($(obj).attr("class").indexOf("selectOb")!=-1) {
        $(obj).removeClass("selectOb");
    }else{
        $(obj).addClass("selectOb");
    }
}
function selectObs() {
    $("#ob_div").html("");
    $('.selectOb').each(function () {
        var $input=$('<input  type="hidden" value="'+$(this).find(".ob").html()+'" name="ob">');
        var $span=$('<span class="search_label">'+$(this).find(".ob").html()+'</span>');
        $("#ob_div").append($input);
        $("#ob_div").append($span);
    });
    $('#selectOb').hide();
    $('#main').slideDown();
    // $("#obSelect").modal("hide");
}

$(function () {
    // $('#calendarMultiday-demo').mobiscroll().calendar({
    //     theme: "bootstrap",                                                                          // Specify theme like: theme: 'ios' or omit setting to use default
    //     lang: 'zh',                                                                        // Specify language like: lang: 'pl' or omit setting to use default
    //     display: "bottom",                                                                      // Specify display mode like: display: 'bottom' or omit setting to use default
    //     mode: 'scroller',                                                                            // More info about mode: http://docs.mobiscroll.com/2-17-1/calendar#!opt-mode
    //     counter: true,                                                                                     // More info about counter: http://docs.mobiscroll.com/2-17-1/calendar#!opt-counter
    //     multiSelect: true
    // });
    $('#calendarMultiday-demo').mobiscroll().range({
        theme: 'mobiscroll',
        lang: 'zh',
        display: 'bottom',
        controls: ['calendar'],
        defaultValue: [ new Date(), new Date()],
        startInput: '#startDate',
        endInput: '#endDate',
        endYear:(new Date()).getFullYear()
    });

});

function selectTime() {
    $('#calendarMultiday-demo').mobiscroll('show');
    $(".dw-cal-prev").append($('<i class="glyphicon glyphicon-chevron-left" style="font-size: 40px;color: grey;margin-top: -30px;"></i>'));
    $(".dw-cal-next").append($('<i class="glyphicon glyphicon-chevron-right" style="font-size: 40px;color: grey;margin-top: -30px;"></i>'));
    $(".dwbc").eq(-1).html($('<div class="dwbw dwb-c"><div tabindex="0" role="button" class="dwb2 dwb-e dwb" onclick="selectTimeCancel()">取消</div></div><div class="dwbw dwb-c"><div tabindex="0" role="button" class="dwb1 dwb-e dwb" onclick="selectTimeNoLimit()">不限</div></div><div class="dwbw dwb-s"><div tabindex="0" role="button" class="dwb0 dwb-e dwb" onclick="selectTimeAffirm()">确定</div></div>'));
}

function selectTimeCancel() {
    $('#calendarMultiday-demo').mobiscroll('hide');
}
function selectTimeAffirm() {
    var time=$('.dw-drv0').html()+"—"+$('.dw-drv1').html();
    $(".search_exact_time").html(time);
    $('input[name="startTime"]').val($('.dw-drv0').html());
    $('input[name="endTime"]').val($('.dw-drv1').html());
    $('#calendarMultiday-demo').mobiscroll('hide');
}
function selectTimeNoLimit() {
    $(".search_exact_time").html("不限");
    $('input[name="startTime"]').val("");
    $('input[name="endTime"]').val("");
    $('#calendarMultiday-demo').mobiscroll('hide');
}