<#include "common/const.ftl" />
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>${title!}</title>
<#include "common/head.ftl" />

    <link type="text/css" href="/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="/static/js/order/star-rating.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link type="text/css" href="/static/common/box/build.css" rel="stylesheet" />

    <script src="http://twemoji.maxcdn.com/twemoji.min.js"></script>

    <style>
        #foot{
            width: 100%;
        }
        #foot_function{
            background-color: whitesmoke;
            border-top: 1px solid #e5e5e5;
            border-bottom: 1px solid #e5e5e5;
            height: 8%;
        }
        #textDiv{
            width: 95%;
            border-style: none;
            padding-top: 10px;
            font-size: 18px;
        }
        /*实现div的placeholder*/
        #textDiv:empty:before{content: attr(placeholder);color:#bbb;}
        #textDiv:focus{content:none;}
        #body{
            height: 86%;
            overflow-y: scroll;
        }
        #foot_play{
            height: 6%;
        }
        .pic{
            margin-top: 10%;
        }
        .nm{
            position: absolute;
            right: 10px;
            bottom: 9%;
            background-color: whitesmoke;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            padding:0 5px 3px;
        }
        .nm_span{
            color:#1296db ;
            font-size: 18px;
            position: relative;
            top:3px;
        }
        .addimg{
            width: 30%;
            height: 100px;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .picdiv{
            position: relative;
            display: inline;
        }
        .picrm{
            position: absolute;
            z-index: 999;
            margin-left: -25px;
            color: white;
            background-color: gray;
            margin-top: -46px;
        }
        #pics{
            width: 95%;
            margin-left: 5%;
            margin-top: 20px;
        }
        .openSpan{
            font-size: 18px;
            color: darkgrey;
        }
        #addImg{
            display: none;
        }

        #emojiDiv{
            width: 100%;
            background-color:whitesmoke ;
        }
        #emoji-list-0,#emoji-list-1{
            list-style:none ;
            position: relative;
            left: -20px;
        }
        #emoji-list-0 li,#emoji-list-1 li{
            float: left;
            margin: 8px;
        }
        #textDiv .emoji{
            width: 30px;
            padding: 2px;
        }

    </style>

    <style type="text/css">
        .item{-webkit-transition:-webkit-transform .3s ease-out}
        .touchmove{-webkit-transition:none}
        .mod_control {
            position: absolute;
            z-index: 90;
            bottom: 20px;
            left: 55%;
            margin-left: -30px;
        }
        .mod_tag {
            margin: 0;
            padding: 0;
        }
        .mod_tag li span {
            display: none;
        }
        .mod_tag li{
            float: left;
            width: 7px;
            height: 7px;
            -webkit-border-radius: 50%;
            background-color: darkgrey;
            margin-right: 9px;
            list-style: none;
            margin-top: 0;
            padding: 0;
        }
        .mod_tag .current{
            background-color: #20b49a;
        }

    </style>
</head>
<body>

    <div id="main">
        <div id="body" onclick="cancelEmoji()">
            <div align="center">
                <form action="${submit!}" method="post" id="formComment">
                    <div id="textDiv" contenteditable="true" style="text-align: left" placeholder="填写内容..."></div>
                    <#if type=="order">
                    <#--订单评论-->
                        <textarea style="display: none" name="detail" ></textarea>
                        <input name="picUrls" type="hidden">
                        <input name="isOpen" type="hidden">
                        <input name="level" type="hidden">
                    <#elseif type=="organ_comment">
                    <#--机构评论-->
                        <textarea style="display: none" name="detail" ></textarea>
                        <input name="isOpen" type="hidden">
                        <input name="picurls" type="hidden">
                        <input type="hidden" name="pid" value="0">
                        <input type="hidden" name="oid" value="${orgId!}">
                        <input type="hidden" name="type" value="1">
                    <#elseif type=="log">
                    <#--更新康复日志-->
                        <textarea style="display: none" name="content" ></textarea>
                        <input name="orderId" type="hidden" value="${oid!}">
                        <input name="picUrls" type="hidden">
                    <#elseif type=="order_reply">
                    <#--治疗师回复订单-->
                        <textarea style="display: none" name="detail" ></textarea>
                        <input name="pid" type="hidden" value="${cid!}">
                    <#elseif type=="organ_reply">
                    <#--机构评论回复-->
                        <textarea style="display: none" name="detail" ></textarea>
                        <input name="isOpen" type="hidden">
                        <input type="hidden" name="pid" value="${pid}">
                        <input type="hidden" name="oid" value="${commOid}">
                        <input type="hidden" name="type" value="0">
                    <#elseif type=="teacher_reply">
                    <#--治疗师评论回复-->
                        <textarea style="display: none" name="detail" ></textarea>
                        <input name="isOpen" type="hidden">
                        <input type="hidden" name="pid" value="${pid!}">
                        <input type="hidden" name="tid" value="${teacherId!}">
                        <input type="hidden" name="type" value="0">
                    <#else >
                    <#--订单终止、拒绝-->
                        <textarea style="display: none" name="reason" ></textarea>
                    </#if>

                </form>

            </div>
            <#if type=="order" || type=="organ_comment" || type=="log">
                <div id="pics">
                    <div class="ps" style="display: inline">
                    </div>
                    <img src="/static/img/add.png" id="addImg" style="border: 2px dashed lightgray;width: 100px" onclick="$('#mulP').trigger('click');">
                </div>
            </#if>
        </div>


        <div id="foot">
            <div id="foot_play">
                <#if type=="order">
                <div style="display: inline">
                    <input id="input-22a" type="number" class="rating" min=0 max=5 step=1 data-size="xs"  value="0" >
                </div>
                </#if>
                <#if type?index_of("report")==-1 && type?index_of("log")==-1 && type!="order_reply" && type!="order_stop" && type!="order_reject">
                <div class="nm">
                    <img src="/static/img/earth_s.png" ><span class="nm_span">公开</span>
                </div>
                </#if>
            </div>
            <div id="foot_function">
                <div class="container">
                    <div class="row">
                        <#--评论-->
                        <#if type=="order" || type=="organ_comment">
                            <div class="col-xs-3">
                                <img src="/static/img/pic.png" class="pic" style="margin-left: 15px" onclick="$('#mulP').trigger('click');">
                            </div>
                            <div class="col-xs-3">
                                <img src="/static/img/Smile.png" class="pic" style="margin-left: 15px" onclick="selectEmoji()">
                            </div>
                            <div class="col-xs-3" onclick="selectOpen()">
                                <img src="/static/img/earth.png" class="pic" style="margin-left: 15px">
                            </div>
                            <div class="col-xs-3">
                                <input type="button" onclick="submit('comment')" class="pic" style="padding: 5px 8px; font-size: 18px;background-color: #20b49a;color: white;border-radius: 5px;border: none" value="评论">
                            </div>
                        <#--更新康复日志-->
                        <#elseif type=="log">
                            <div class="col-xs-4">
                                <img src="/static/img/pic.png" class="pic" style="margin-left: 15px" onclick="$('#mulP').trigger('click');">
                            </div>
                            <div class="col-xs-4">
                                <img src="/static/img/Smile.png" class="pic" style="margin-left: 15px" onclick="selectEmoji()">
                            </div>
                            <div class="col-xs-4">
                                <input type="button" onclick="submit('comment')" class="pic" style="padding: 5px 8px; font-size: 18px;background-color: #20b49a;color: white;border-radius: 5px;border: none" value="更新">
                            </div>
                        <#--回复-->
                        <#elseif (type?index_of("reply")!=-1) && type!="order_reply">
                            <div class="col-xs-4">
                                <img src="/static/img/Smile.png" class="pic" style="margin-left: 15px" onclick="selectEmoji()">
                            </div>
                            <div class="col-xs-4" onclick="selectOpen()">
                                <img src="/static/img/earth.png" class="pic" style="margin-left: 15px">
                            </div>
                            <div class="col-xs-4">
                                <input type="button" onclick="submit('reply')" class="pic" style="padding: 5px 8px; font-size: 18px;background-color: #20b49a;color: white;border-radius: 5px;border: none" value="回复">
                            </div>
                        <#--治疗师回复订单-->
                        <#elseif type=="order_reply">
                            <div class="col-xs-6">
                                <img src="/static/img/Smile.png" class="pic" style="margin-left: 15px" onclick="selectEmoji()">
                            </div>
                            <div class="col-xs-6">
                                <input type="button" onclick="submit('reply')" class="pic" style="padding: 5px 8px; font-size: 18px;background-color: #20b49a;color: white;border-radius: 5px;border: none" value="回复">
                            </div>
                        <#--订单终止、拒绝-->
                        <#else>
                        <#--<div class="col-xs-12" style="clear: left">-->
                                <input type="button" onclick="submit('reply')" style="height:100%;width:100%;padding: 5px 8px; font-size: 18px;background-color: #20b49a;color: white;border-radius: 5px;border: none" value="提交">
                        <#--</div>-->
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input id="mulP" type="file" class="upfile"  multiple style="display: none">
    <div id="openSelect" style="display: none">
        <div class="checkbox checkbox-success" onclick="selectOpenEnd('公开')">
            <input type="radio" name="open" class="radio3" id="radio3" value="1" checked>
            <label for="radio3" class="openSpan">
                公开
            </label>
        </div>
        <div class="checkbox checkbox-success" onclick="selectOpenEnd('匿名')">
            <input type="radio" name="open" class="radio3" id="radio4" value="0" >
            <label for="radio4" class="openSpan">
                匿名
            </label>
        </div>
    </div>

    <div id="emojiDiv" class="wrap" style="display: none">
        <div class="item item-0 play">
            <div class="content">
                <div class="m_animate_box">
                    <div class="inner">
                        <div class="inn_box">

                            <ul id="emoji-list-0">
                                <li>&#x1F601;</li>
                                <li>&#x1F602;</li>
                                <li>&#x1F603;</li>
                                <li>&#x1F604;</li>
                                <li>&#x1F605;</li>
                                <li>&#x1F606;</li>
                                <li>&#x1F607;</li>
                                <li>&#x1F608;</li>
                                <li>&#x1F609;</li>
                                <li>&#x1F60A;</li>
                                <li>&#x1F60B;</li>
                                <li>&#x1F60C;</li>
                                <li>&#x1F60D;</li>
                                <li>&#x1F60E;</li>
                                <li>&#x1F60F;</li>
                                <li>&#x1F610;</li>
                                <li>&#x1F611;</li>
                                <li>&#x1F612;</li>
                                <li>&#x1F613;</li>
                                <li>&#x1F614;</li>
                                <li>&#x1F615;</li>
                                <li>&#x1F616;</li>
                                <li>&#x1F617;</li>
                                <li>&#x1F618;</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item item-1">
            <div class="content">
                <div class="m_animate_box">
                    <div class="inner">
                        <div class="inn_box">
                            <ul id="emoji-list-1">
                                <li>&#x1F619;</li>
                                <li>&#x1F61A;</li>
                                <li>&#x1F61B;</li>
                                <li>&#x1F61C;</li>
                                <li>&#x1F61D;</li>
                                <li>&#x1F61F;</li>
                                <li>&#x1F620;</li>
                                <li>&#x1F621;</li>
                                <li>&#x1F622;</li>
                                <li>&#x1F623;</li>
                                <li>&#x1F624;</li>
                                <li>&#x1F625;</li>
                                <li>&#x1F626;</li>
                                <li>&#x1F627;</li>
                                <li>&#x1F628;</li>
                                <li>&#x1F629;</li>
                                <li>&#x1F62A;</li>
                                <li>&#x1F62B;</li>
                                <li>&#x1F62C;</li>
                                <li>&#x1F62D;</li>
                                <li>&#x1F62E;</li>
                                <li>&#x1F62F;</li>
                                <li>&#x1F630;</li>
                                <li>&#x1F631;</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="wrap" style="display: none" id="wraps">
        <div class="mod_control">
            <ul class="mod_tag">
                <li class="current"><span>1</span></li>
                <li><span>2</span></li>
            </ul>
        </div>
    </div>
</body>
<script type="text/javascript" src="/static/common/iSlider.js"></script>
<script>

    //demo
    //用法
    var myslider=new iSlider({
        wrap:'#emojiDiv',
        item:'.item',
        isVertical:false,
        speed:500,
        onslide:function (index) {

            document.querySelector('.mod_tag .current').className=''
            document.querySelectorAll('.mod_tag li')[index].className='current';
            document.getElementById('logo_contain').className='logo_contain step-' + (index + 1);
        }
    });

</script>
<script>

    var num=1;//图片顺序

    //由于手机端浏览器 不能执行formData的delete方法 改用set方法进行覆盖 也不支持  那就创建一个变量用于存储要删除的img的ID 提交时放到cookie供后台进行判断
    var fd=new FormData();//存放全部图片信息
    var deleteImg="";


    $("#input-22a").rating({
        showClear: false
    });


    function selectEmoji() {
        $('#body').css('height','46%');
        $('.nm').css('bottom','49%');
        $('#emojiDiv').show();
        $('#wraps').show();
    }

    function cancelEmoji() {
        $('#emojiDiv').hide();
        $('#wraps').hide();
        $('#body').css('height','86%');
        $('.nm').css('bottom','9%');
    }

    $(function(){

        twemoji.parse(document.getElementById('textDiv'), {size: 36});
        twemoji.parse(document.getElementById('emoji-list-0'), {size: 36});
        twemoji.parse(document.getElementById('emoji-list-1'), {size: 36});
        $('#emoji-list-0 li').on('click',function(){

            $("#textDiv").html($("#textDiv").html() +  $(this).html() );
        });
        $('#emoji-list-1 li').on('click',function(){

            $("#textDiv").html($("#textDiv").html() +  $(this).html() );
        });

        $("#mulP").change(function () {
            for(var i=0;i<this.files.length;i++){
                fd.append("img"+num,this.files[i]);
                var $div=$('<div class="picdiv"></div>');
                var $span=$('<span class="glyphicon glyphicon-remove picrm" onclick="cancelImg(this)"></span>');
                var $img;
                if(i==this.files.length-1 && $("#addImg").is(":hidden")){
                    $img=$('<img class="addimg" id="img'+num+'" onload=$("#addImg").show()>');
                }else{
                    $img=$('<img class="addimg" id="img'+num+'">');
                }
                $($img).attr("src",getObjectURL(this.files[i]));
                $div.append($img);
                $div.append($span);
                var $target=$('#pics .ps');
                $target.append($div);
                num++;
            }
            //由于 添加的图片 是每行开头的话  样式会变 所以要判断是不是每行的开头
            if($('.addimg').size()%3==0){
                $("#addImg").css("margin-top","0px");
            }else{
                $("#addImg").css("margin-top","-10px");
            }
        });

//        obj = document.getElementById('fileImg');
//        ALi = obj.getElementsByTagName('li');
//        addFn();
    });

    function cancelImg(obj) {
        $(obj).parent().remove();
        var img=$(obj).prev().attr("id");
//        fd.set(img+"","");//浏览器不能用
//        fd.delete(img+"");//浏览器不能用
        deleteImg+="#"+img;

        if($('.addimg').size()%3==0){
            $("#addImg").css("margin-top","0px");
        }else{
            $("#addImg").css("margin-top","-10px");
        }
        if($('.addimg').size()==0){
            $("#addImg").hide();
        }
    }

function selectOpen() {
    $('.nm').hide();
    $('#emojiDiv').hide();
    $('#wraps').hide();
    $('#main').slideUp();
    $('#body').css('height','86%');
    $('.nm').css('bottom','9%');
    $('#openSelect').show();
    if($('.nm_span').html()=='公开'){
        $("#radio3").prop("checked","true");
    }else{
        $("#radio4").prop("checked","true");
    }
}
    function selectOpenEnd(select) {
        $('#main').slideDown();
        $('.nm').show();
        $('.nm_span').html(select);
        $('#openSelect').hide();
    }

    function submit(t) {
        if(t=="comment") {
            deleteImg += "#";  //保证形式 #id#id#
            setCookie("deleteImg", deleteImg, '0.001');//存到cookie中
            //先上传图片
            $.ajax({
                type: "POST",
                url:"/wx/comment/img",
                data: fd,
                //下面的一定要加
                // 告诉jQuery不要去处理发送的数据
                processData : false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType : false,
                success: function (data) {
                    if('${type}'=="order"){
                        $('textarea[name="detail"]').val($("#textDiv").html());
                        $('input[name="picUrls"]').val(data.data);
                        $('input[name="isOpen"]').val($('input[name="open"]').val());
                        $('input[name="level"]').val($('#input-22a').val());
                    }else if('${type}'=="organ_comment"){
                        $('textarea[name="detail"]').val($("#textDiv").html());
                        $('input[name="picurls"]').val(data.data);
                        $('input[name="isOpen"]').val($('input[name="open"]').val());
                    }else{
                        $('textarea[name="content"]').val($("#textDiv").html());
                        $('input[name="picUrls"]').val(data.data);
                    }
                    $("#formComment").submit();
                },error:function () {

                }});
        }else if(t=="reply"){
            $('textarea[name="detail"]').val($("#textDiv").html());
            if("${type}"!="order_reply"){
                $('input[name="isOpen"]').val($('input[name="open"]').val());
            }
            $("#formComment").submit();
        }else{
            $('textarea[name="reason"]').val($("#textDiv").html());
        }


    }

    function setCookie(c_name,value,expiredays)
    {
        var exdate=new Date()
        exdate.setDate(exdate.getDate()+expiredays)
        document.cookie=c_name+ "=" +escape(value)+
                ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
    }

    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }




</script>

</html>
