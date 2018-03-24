<#include "../order/common/const.ftl" />
<!DOCTYPE html>
<html>
<head>
<#include "../order/common/head.ftl" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <#--<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">-->
    <#--<meta name="apple-mobile-web-app-capable" content="yes">-->
    <#--<meta name="apple-mobile-web-app-status-bar-style" content="black">-->
    <title>消息中心</title>
    <script type="text/javascript" src="/static/common/iscroll.js"></script>
    <script type="text/javascript">

        var myScroll,
                pullDownEl,
                pullDownOffset,
                pullUpEl,
                pullUpOffset,
                generatedCount = 0,
                page=2;

        function pullDownAction () {
            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
                var el, li, i;
                el = document.getElementById('thelist');

                for (i=0; i<5; i++) {
                    li = document.createElement('li');
                    li.innerText = 'Generated row ' + (++generatedCount);
                    el.insertBefore(li, el.childNodes[0]);
                }
                document.getElementById("pullUp").style.display="";
                myScroll.refresh();
            }, 1000);
        }

        function pullUpAction () {
            setTimeout(function () {
                var el, li, i;
                el = document.getElementById('thelist');
                $.ajax({
                    type: 'get',
                    url: '/wx/teacherCenter/getInformMessageByPage/'+(page++),
                    dataType: 'json',
                    success: function(data){
                        for (i=0; i<data.length; i++) {
                            li = document.createElement('li');
                            li.className="sl-li ui-border-b";
                            li.innerHTML ='<div class="read sl-content" onclick=getInform('+data[i].id+',this,"read")>\n' +
                                    '                        <div class="row">\n' +
                                    '                            <div class="col-xs-3" style="width: 22%!important;">\n' +
                                    '                                <img src="/static/img/logo.jpg" width="200" style="padding-top: 10px;padding-left: 20px;border-radius: 100%">\n' +
                                    '                            </div>\n' +
                                    '                            <div class="col-xs-9" style="margin-top: 20px">\n' +
                                    '                                <div class="row">\n' +
                                    '                                    <div class="col-xs-8">\n' +
                                    '                                        <span style="font-weight: bold;color: dimgrey;font-size: 45px;">星桥康复</span>\n' +
                                    '                                    </div>\n' +
                                    '                                    <div class="col-xs-4">\n' +
                                    '                                        <span style="color: grey;font-size: 38px">'+data[i].time+'</span>\n' +
                                    '                                    </div>\n' +
                                    '                                </div>\n' +
                                    '                                <div class="row" style="margin-top: 15px">\n' +
                                    '                                    <div class="col-xs-12">\n' +
                                    '                                        <span style="color: grey;font-size: 40px">'+data[i].message+'</span>\n' +
                                    '                                    </div>\n' +
                                    '                                </div>\n' +
                                    '                            </div>\n' +
                                    '                        </div>\n' +
                                    '                    </div>\n' +
                                    '                    <div class="sl-opts">\n' +
                                    '                        <i class="glyphicon glyphicon-trash" onclick="location.href=\'l\'"></i>\n' +
                                    '                    </div>';
                            el.appendChild(li, el.childNodes[0]);
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
                        }
                        myScroll.refresh();
                    }
                });

            }, 20);
        }

        function loaded() {
            pullDownEl = document.getElementById('pullDown');
            pullDownOffset = pullDownEl.offsetHeight;
            pullUpEl = document.getElementById('pullUp');
            pullUpOffset = 10;
            //pullUpOffset = pullUpEl.offsetHeight;
            myScroll = new iScroll('wrapper', {
                useTransition: true,
                topOffset: pullDownOffset,
                onRefresh: function () {
                    //that.maxScrollY = that.wrapperH - that.scrollerH + that.minScrollY;
                    //that.minScrollY = -that.options.topOffset || 0;
                    //alert(this.wrapperH);
                    //alert(this.scrollerH);
                    if (pullDownEl.className.match('loading')) {
                        pullDownEl.className = '';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Pull down to refresh...';}
                    if (pullUpEl.className.match('loading')) {
                        pullUpEl.className = '';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = 'Pull up to load more...';
                    }

                    document.getElementById("pullUp").style.display="none";
                    document.getElementById("show").innerHTML="onRefresh: up["+pullUpEl.className+"],down["+pullDownEl.className+"],Y["+this.y+"],maxScrollY["+this.maxScrollY+"],minScrollY["+this.minScrollY+"],scrollerH["+this.scrollerH+"],wrapperH["+this.wrapperH+"]";
                },
                onScrollMove: function () {
                    document.getElementById("show").innerHTML="onScrollMove: up["+pullUpEl.className+"],down["+pullDownEl.className+"],Y["+this.y+"],maxScrollY["+this.maxScrollY+"],minScrollY["+this.minScrollY+"],scrollerH["+this.scrollerH+"],wrapperH["+this.wrapperH+"]";
                    if (this.y > 0) {
                        pullDownEl.className = 'flip';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Release to refresh...';
                        this.minScrollY = 0;
                    }
                    if (this.y < 0 && pullDownEl.className.match('flip')) {
                        pullDownEl.className = '';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Pull down to refresh...';
                        this.minScrollY = -pullDownOffset;
                    }

                    if ( this.scrollerH < this.wrapperH && this.y < (this.minScrollY-pullUpOffset) || this.scrollerH > this.wrapperH && this.y < (this.maxScrollY - pullUpOffset) ) {
                        document.getElementById("pullUp").style.display="";
                        pullUpEl.className = 'flip';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = '';
                    }
                    if (this.scrollerH < this.wrapperH && this.y > (this.minScrollY-pullUpOffset) && pullUpEl.className.match('flip') || this.scrollerH > this.wrapperH && this.y > (this.maxScrollY - pullUpOffset) && pullUpEl.className.match('flip')) {
                        document.getElementById("pullUp").style.display="none";
                        pullUpEl.className = '';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = 'Pull up to load more...';
                    }
                },
                onScrollEnd: function () {
                    document.getElementById("show").innerHTML="onScrollEnd: up["+pullUpEl.className+"],down["+pullDownEl.className+"],Y["+this.y+"],maxScrollY["+this.maxScrollY+"],minScrollY["+this.minScrollY+"],scrollerH["+this.scrollerH+"],wrapperH["+this.wrapperH+"]";
                    if (pullDownEl.className.match('flip')) {
                        pullDownEl.className = 'loading';
                        pullDownEl.querySelector('.pullDownLabel').innerHTML = '';
                        pullDownAction();	// Execute custom function (ajax call?)
                    }
                    if (pullUpEl.className.match('flip')) {
                        pullUpEl.className = 'loading';
                        pullUpEl.querySelector('.pullUpLabel').innerHTML = '';
                        pullUpAction();	// Execute custom function (ajax call?)
                    }
                }
            });

            //setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
        }

        document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);

        document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);
    </script>

    <style type="text/css" media="all">
        #show{
            display:none;
        }
        #wrapper {
            position:absolute;
            z-index:1;
            height:90%;
            width:100%;
            background: white;
            overflow-y: scroll;
        }

        #scroller {
            position:absolute; z-index:1;
            /*	-webkit-touch-callout:none;*/
            -webkit-tap-highlight-color:rgba(0,0,0,0);
            width:100%;
            padding:0;
        }

        #scroller ul {
            list-style:none;
            padding:0;
            margin:0;
            width:100%;
            text-align:left;
        }

        #scroller li {
            height:230px;
            border-bottom:1px solid #ccc;
            border-top:1px solid #fff;
            background-color:#fafafa;
            font-size:40px;
        }


        /**
         *
         * Pull down styles
         *
         */
        #pullDown, #pullUp {
            background:#fff;
            height:150px;
            line-height:60px;
            padding:15px 30px;
            border-bottom:1px solid #ccc;
            font-weight:bold;
            font-size:40px;
            color:#888;
        }
        #pullDown .pullDownIcon, #pullUp .pullUpIcon  {
            display:block; float:left;
            width:100px; height:100px;
            background:url("/static/img/pull-icon@2x.png") 0 0 no-repeat;
            -webkit-background-size:100px 200px; background-size:100px 200px;
            -webkit-transition-property:-webkit-transform;
            -webkit-transition-duration:250ms;
        }
        #pullDown .pullDownIcon {
            -webkit-transform:rotate(0deg) translateZ(0);
        }
        #pullUp .pullUpIcon  {
            -webkit-transform:rotate(-180deg) translateZ(0);
        }

        #pullDown.flip .pullDownIcon {
            -webkit-transform:rotate(-180deg) translateZ(0);
        }

        #pullUp.flip .pullUpIcon {
            -webkit-transform:rotate(0deg) translateZ(0);
        }

        #pullDown.loading .pullDownIcon, #pullUp.loading .pullUpIcon {
            background-position:0 100%;
            -webkit-transform:rotate(0deg) translateZ(0);
            -webkit-transition-duration:0ms;

            -webkit-animation-name:loading;
            -webkit-animation-duration:2s;
            -webkit-animation-iteration-count:infinite;
            -webkit-animation-timing-function:linear;
        }

        @-webkit-keyframes loading {
            from { -webkit-transform:rotate(0deg) translateZ(0); }
            to { -webkit-transform:rotate(360deg) translateZ(0); }
        }
        body{
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        #top{
            background-color: white;
            height: 5%;
            padding: 30px 0;
            border-bottom: 1px solid #ccc;
            font-size:0;
        }
        .left{
            background-color: #20b49a;
            color: white;
            border: none;
            border-radius: 50px;
        }
        .right{
            background-color: #e1e1e1;
            color: grey;
            border: none;
            border-bottom-right-radius: 50px;
            border-top-right-radius: 50px;
            opacity: 0.8;
        }
        .left,.right{
            padding: 15px 60px;
            font-size: 43px;
            width: 50%;
        }
        .bu{
            border-radius: 50px;
            width: 60%;
            background-color: #e1e1e1;
            border: 1px solid #aaa;
        }
        .noRead{
            background-color: #f5f5f5;
            font-size: 40px;
            height: 100%;
            border-bottom: 1px solid #ddd;
            border-right: 1px solid #ccc;
        }
        .read{
            background-color: white;font-size: 40px;
            height: 100%;
            border-bottom: 1px solid #ddd;
            border-right: 1px solid #ccc;
        }
        html{
            height: 100%;
        }
        .more{
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            padding-top: 10px;
            color: dimgrey;
        }


        .sl-content {
            overflow: hidden;
        }
        .sl-li {
            height: 100%;
            position: relative;
            /*background-color: #fff;*/
            transform: translateZ(0);
            -webkit-transform: translateZ(0);
        }
        .sl-li .sl-content {
            height: 100%;
            overflow: hidden;
            padding: 10px;
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
            right: 0;
            z-index: 0;
        }
        .sl-li .sl-opts i {
            padding: 30px;
            display: -webkit-box;
            -webkit-box-pack: center;
            -webkit-box-align: center;
        }


        .glyphicon-trash{
            font-size: 45px;
            background-color: white;
            border-radius: 100%;
            padding: 20px;
            color: orange;
            border: 1px solid #ddd;
        }


        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .foot{
            position: fixed;
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot button{
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 0 auto;
            border-radius: 15px;
            height:6%
        }
        .textarea{
            height: 500px;
            font-size: 45px;
            border-style: none;
            padding: 35px;
            resize: none;
            color: dimgrey;
        }
        p{
            margin:20px 35px!important;
        }
        #message .title{
            font-weight: bold;
            color: dimgrey;
            font-size: 45px;
        }
        #message .time{
            color: grey;
            font-size: 38px;
            float: right;
        }
        .number{
            background-color: red;
            color: white;
            padding:2px 17px;
            font-size: 38px;
            font-weight: bold;
            border-radius: 100%;
            position: absolute;
            border: 2px solid white;
            top:-25%;
            right: 10%;
        }
    </style>
</head>
<body>

<div id="top" align="center">
    <div class="bu">
        <button class="left" style="position: relative">通&nbsp;&nbsp;知<span class="number">${(messages.noReadInform)?size}</span></button>
        <button class="right">私&nbsp;&nbsp;信<span></span></button>
    </div>

</div>
<#if (messages.isNoneInform)==0>
<p id="show"></p>
<div id="wrapper">
    <div id="scroller">
        <div id="pullDown">
            <#--<span class="pullDownIcon"></span><span class="pullDownLabel">Pull down to refresh...</span>-->
        </div>
        <ul id="thelist">
            <#list messages.noReadInform as m>
                <li class="sl-li ui-border-b">
                    <div class="noRead sl-content" onclick="getInform('${m.id}',this,'no')">
                        <div class="row">
                            <div class="col-xs-3" style="width: 22%!important;">
                                <img src="/static/img/logo.jpg" width="200" style="padding-top: 10px;padding-left: 20px;border-radius: 100%">
                            </div>
                            <div class="col-xs-9" style="margin-top: 20px">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <span style="font-weight: bold;color: dimgrey;font-size: 45px;">星桥康复</span>
                                    </div>
                                    <div class="col-xs-4">
                                        <span style="color: grey;font-size: 38px">${m.time}</span>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px">
                                    <div class="col-xs-12">
                                        <span style="color: grey;font-size: 40px">
                                            <#if (m.message)?length &gt; 20>
                                            ${(m.message)?substring(0,20)}...
                                            <#else >
                                            ${(m.message)!}
                                            </#if>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sl-opts">
                        <i class="glyphicon glyphicon-trash" onclick="location.href='/wx/teacherCenter/${user.id}/message/${m.id}/del'"></i>
                        <#--<span style="background-color: #F95F61; color: #fff;">删除</span>-->
                        <#--<span style="background-color: #ff9c00; color: #fff;">分享</span>-->
                    </div>
                </li>
            </#list>
            <#list messages.readInform as m>
                <li class="sl-li ui-border-b">
                    <div class="read sl-content" onclick="getInform('${m.id}',this,'read')">
                        <div class="row">
                            <div class="col-xs-3" style="width: 22%!important;">
                                <img src="/static/img/logo.jpg" width="200" style="padding-top: 10px;padding-left: 20px;border-radius: 100%">
                            </div>
                            <div class="col-xs-9" style="margin-top: 20px">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <span style="font-weight: bold;color: dimgrey;font-size: 45px;">星桥康复</span>
                                    </div>
                                    <div class="col-xs-4">
                                        <span style="color: grey;font-size: 38px">${m.time}</span>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px">
                                    <div class="col-xs-12">
                                        <span style="color: grey;font-size: 40px">${(m.message)!}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sl-opts">
                        <i class="glyphicon glyphicon-trash" onclick="location.href='/wx/teacherCenter/${user.id}/message/${m.id}/del'"></i>
                    <#--<span style="background-color: #F95F61; color: #fff;">删除</span>-->
                    <#--<span style="background-color: #ff9c00; color: #fff;">分享</span>-->
                    </div>
                </li>
            </#list>

        </ul>
        <p class="more">下拉加载更多</p>
        <div id="pullUp" style="display:none;" align="center">
            <span class="pullUpIcon" style="margin-left: 44%"></span><span class="pullUpLabel">Pull up to refresh...</span>
        </div>
    </div>
<#else >
    <div class="row" style="margin-top: 30%!important;width: 100%">
        <div class="col-xs-2">
        </div>
        <div class="col-xs-2">
            <img src="/static/img/kong.png" width="150">
        </div>
        <div class="col-xs-6">
            <p style="font-size: 45px;color: dimgrey;font-weight: bold">抱歉</p>
            <p style="font-size: 38px;color: grey;font-weight: bold">您还没有通知消息</p>
        </div>
    </div>
</#if>
</div>

<div id="message" style="display: none;height:100%;width: 100%; position: absolute;z-index: 99;top:100%;background-color: #f5f5f5">
    <div class="buttonDiv_info" style="background-color: white">
        <p>
            <span class="title"></span>
            <span class="time" ></span>
        </p>
        <p class="textarea" ></p>
    </div>
    <div class="foot" align="center">
        <button style="width: 100% !important;" onclick="back()">返回</button>
    </div>
</div>
</body>
<script src="/static/common/zepto.min.js"></script>
<script>
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


    $(function () {
        //加载完成后 将所有消息换成已读
        $.ajax({
            type: 'post',
            url: '/wx/teacherCenter/allInformRead',
            dataType: 'json',
            success: function(){}
        });

    });

    function getInform(id,obj,type) {
        $.ajax({
            type: 'get',
            url: '/wx/teacherCenter/getInfromById/'+id,
            dataType: 'json',
            success: function(data){
                $('#message  .title').html('星桥康复：');
                $('#message  .time').html(data.data.time);
                $('#message .textarea').html(data.data.message);
                $('#message').show();
                $('#message').animate({top:"0"},function () {
                    $('#main').hide();
                });

                if(type=='no'){
                    $(obj).removeClass("noRead").addClass("read");
                }
            }
        });
    }
    
    function back() {
        $('#main').show();
        $('#message').animate({top:"100%"},function () {
            $('#message').hide();
        });
    }
</script>
</html>