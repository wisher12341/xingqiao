<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>${(type=="award")?string("奖励荣誉",(type=="certificate")?string("相关证书","其他资料"))}</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="http://www.163css.com/myweb/hihilinxuan/template/hihilinxuan/cssjs/2012/12/ifengtouch/js/jquery.touchSwipe.min.js"></script>
    <style>
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            /*border-bottom: 1px solid #ccc;*/
            border-top: 1px solid #ccc;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 40px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
            color: dimgrey;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
        .text_detail{
            color: #a0a0a0;
            font-size: 35px;
            margin-left: 40px;
            margin-right: 100px;
            margin-top: 20px;
        }
        .foot{
            position: fixed;
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 0 auto;
            border-radius: 15px;
            height:6%
        }
        .addimg{
            width: 200px;
            height: 200px;
            margin-right: 20px;
            margin-bottom: 30px;
        }
        .row{
            margin: 0 !important;
        }
        .glyphicon-trash{
            font-size: 45px;
            background-color: white;
            border-radius: 100%;
            padding: 20px;
            color: orange;
            position: absolute;
            right: 10%;
            /*left: 0;*/
            top: 50%;
            transform: translateY(-50%);
            display: none;
            /*bottom: 0;*/
            /*margin:auto;*/
        }
        /*.swap{*/
        /*position: relative;*/
        /*}*/

        ul{
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
            text-align: left;
        }
        .sl-content {
            overflow: hidden;
        }
        .sl-li {
            height: 24%;
            position: relative;
            background-color: #f5f5f5;
            transform: translateZ(0);
            -webkit-transform: translateZ(0);
            padding-bottom: 4px;
            margin: 0;
        }
        .sl-li .sl-content {
            height: 100%;
            overflow: hidden;
            /*padding: 10px;*/
            position: relative;
            z-index: 10;
            /*background-color: #fff;*/
        }
        .sl-li .sl-content.animated {
            -webkit-transition: -webkit-transform .2s ease-out;
            transition: transform .2s ease-out;
        }
        .sl-li .sl-opts {
            height: 100%;
            width: 25%;
            display: -webkit-box;
            -webkit-box-pack: center;
            -webkit-box-align: center;
            position: absolute;
            top: 0;
            right: 3%;
            z-index: 0;
        }
        .sl-li .sl-opts i {
            padding: 30px;
            display: -webkit-box;
            -webkit-box-pack: center;
            -webkit-box-align: center;
        }
    </style>
</head>
<body>


<div id="main">
    <div class="buttonDiv_info" style="margin-bottom: 20%">
        <ul>
        <#list ((data!)?split("#"))! as a>
            <li class="sl-li ui-border-b" >
                <div class="sl-content" style="background-color: white" onclick=location.href="${path}/wx/teacherCenter/info/${uid}/${type}/${a_index}/edit">
                    <div index="${a_index}"  style="background: white">
                        <div class="row" style="height: 7%;padding-top:3.5% ">
                            <div class="col-xs-9">
                                <p class="text_p"> ${a?split("@")[0]}</p>
                            </div>
                            <div class="col-xs-2">
                                <p class="text_ppp"> 编辑</p>
                            </div>
                            <div class="col-xs-1">
                                <i class="fa fa-angle-right fa-4x icon_fa"></i>
                            </div>
                        </div>
                        <div class="row" style="height: 17% ">
                            <div class="col-xs-12">
                                <#--<p class="text_detail">-->
                                    <#if (a?split("@")[1])??&& (a?split("@")[1])!=''>
                                        <#list (a?split("@")[1])?split("!") as pic>
                                            <img src="/${pic}" class="addimg">
                                        </#list>
                                    </#if>

                            </div>
                        </div>
                    </div>
                <#--<div align="center" class="delete">-->
                <#--<i class="glyphicon glyphicon-trash" onclick="location.href='/wx/teacherCenter/info/${uid}/${type}/${a_index}/del'"></i>-->
                <#--</div>-->
                </div>
                <div class="sl-opts">
                    <i class="glyphicon glyphicon-trash" onclick="location.href='/wx/teacherCenter/info/${uid}/${type}/${a_index}/del'"></i>
                </div>
            </li>
        </#list>
        </ul>
    </div>
</div>
<div class="foot" align="center">
    <button onclick="location.href='${path}/wx/teacherCenter/info/${uid}/award/0'" style="width: 49% !important;">新增</button>
    <button onclick="location.href='${path}/wx/teacherCenter/${uid}/myInfo_authentication'" style="width: 49% !important;">返回</button>
</div>
</body>
<script src="/static/common/zepto.min.js"></script>
<script>
    <#--$(".swap").swipe( {-->
    <#--swipeStatus:function(event, phase, direction, distance, duration,fingerCount) {-->
    <#--if(duration>110 &&  direction=="left" && phase=="end"){-->
    <#--$(this).animate({right:"30%"},function () {-->
    <#--$(this).next().fadeIn(100);-->
    <#--});-->
    <#--$(".left").next().fadeOut(100);-->
    <#--$(".left").animate({right:"0%"});-->
    <#--$(".left").removeClass("left");-->
    <#--$(this).addClass("left");-->
    <#--}-->
    <#--if(duration<110 && (phase=="end" || phase=="cancel")){-->
    <#--location.href="${path}/wx/teacherCenter/info/${uid}/${type}/"+$(this).attr("index")+"/edit"-->
    <#--}-->
    <#--if(direction=="right" && duration>110){-->
    <#--$(this).next().hide();-->
    <#--$(this).animate({right:"0%"});-->
    <#--$(this).removeClass("left");-->
    <#--}-->
    <#--//            $(this).find(".text_p").text("你用"+fingerCount+"个手指以"+duration+"秒的速度向" + direction + "滑动了" +distance+ "像素 " +"你在"+phase+"中");-->
    <#--},-->
    <#--});-->
    window.slideUtil = (function($) {

        var listItem = $('.sl-content'),
                listOpts = $('.sl-opts');

        var onthel = false, // 是否处于最左端
                isScroll = false, // 列表是否滚动状态
                initX = 0, // 初始X坐标
                initY = 0, // 初始Y坐标
                endX = 0, // 结束时X坐标
                endY = 0, // 结束时Y坐标
                moveX = 0, // listItem 移动的距离
                expandLi = null; // 是否存在展开的list

        var slideMaxWid = listOpts.width();

        var handleSlide = (function() {

            listItem.on('touchstart',function(e){
                // 判断有无已经展开的li，如果有，是否是当前的li，如果不是，将展开的li收起
                if( expandLi ){
                    if( expandLi.parent().index()!==$(this).parent().index() ){
                        // 判断当前list是左滑还是上下滑
                        if( Math.abs(endY-initY) < Math.abs(endX-initX) ){
                            e.preventDefault();
                        }
                        expandLi.css('-webkit-transform','translateX('+0+'px)');
                    }
                }

                initX = e.targetTouches[0].pageX;
                initY = e.targetTouches[0].pageY;

                moveX = $(this).offset().left;

                $(this).on('touchmove',function(e){

                    var curY = e.targetTouches[0].pageY;
                    var curX = e.targetTouches[0].pageX;
                    var X = curX - initX; // 不断获取移动的距离

                    $(this).removeClass('animated');

                    if( Math.abs(endY-initY)<Math.abs(endX-initX) ){

                        e.preventDefault();
                        if( moveX==0 ){
                            if( X>0 ) {
                                $(this).css('-webkit-transform','translateX('+0+'px)');
                            }else if( X<0 ){
                                if( X<-slideMaxWid ) X=-slideMaxWid;
                                $(this).css('-webkit-transform','translateX('+X+'px)');
                            }
                        }
                        // 已经处于最左
                        else if( moveX < 0 ){
                            onthel = true;
                            if( X>0 ) { // 向右滑
                                if( X-slideMaxWid>0 ){
                                    $(this).css('-webkit-transform','translateX('+0+'px)');
                                }else{
                                    $(this).css('-webkit-transform','translateX('+(X-slideMaxWid)+'px)');
                                }
                            }else { // 左滑
                                $(this).addClass('animated');
                                $(this).css('-webkit-transform','translateX('+0+'px)');

                            }
                        }
                    }else{
                        isScroll = true;
                    }

                })
            })

            listItem.on('touchend',function(e){

                endX = e.changedTouches[0].pageX;
                endY = e.changedTouches[0].pageY;
                var X = endX - initX;

                $(this).addClass('animated');
                //Slide to right or the distance of slide to left less than 20;
                if( X>-20||onthel||isScroll ){
                    $(this).css('-webkit-transform','translateX('+0+'px)');
                    onthel = false;
                    isScroll = false;
                }else{
                    $(this).css('-webkit-transform','translateX('+(-slideMaxWid)+'px)');
                    expandLi = $(this);
                }
            })

        })();

    })(Zepto);
</script>
</html>

