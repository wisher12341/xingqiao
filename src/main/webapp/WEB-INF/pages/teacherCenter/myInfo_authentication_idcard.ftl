<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>证件照</title>
<#include "common/head.ftl" />

    <style>
        .foot{
            /*position: fixed;*/
            /*width: 100%;*/
            /*bottom: 0;*/
            background-color: #f5f5f5;
        }
        .foot button{
            /*background-color:#94e6c8 ;*/
            background-color: #20b49a;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 3% auto;
            border-radius: 15px;
            height:6%;
            opacity:0.5;
            border: none;
        }

        .card{
            background-color: #20b49a;
            /*background:rgba(32,180,173,1);*/
            height: 40%;
            position: relative;
        }
        .idcard{
            padding-top: 10%;
            height: 75%;
        }
        .text{
            font-size: 35px;
            color: white;
            padding-top: 5%;
        }
        .addimg{
            height: 70%;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
        .picdiv{
            height: 100%;
            width: 65%;
            background:rgba(255,255,255,0.4);
            border-radius: 3%;
            position: relative;
        }
        .camera{
            position: absolute;
            z-index: 99;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin:auto;
            width:400px;
            height: 300px;
        }
        .sf{
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            width: 300px;
            height: 200px;
            opacity: 0.5;
        }
        .sf3{
            position: relative;
            top: 45%;
            transform: translateY(-50%);
            width: 400px;
            height: 300px;
            opacity: 0.5;
        }
    </style>
</head>
<body style="background-color: #f5f5f5">
<div id="main">
   <div class="card" align="center" style="margin-top: 10px">
       <div class="idcard" id="front" align="center" onclick=$("input[name=pidUrlFront]").trigger('click')>
           <div class="picdiv">
           <#if (teacher.pidUrlFront)?? && (teacher.pidUrlFront)!="">
               <img class="addimg" src="/${teacher.pidUrlFront}"  onerror='this.src="/static/img/touxiang.svg";this.onerror=null'>
           <#elseif (parent.pidFrontUrl)?? && (parent.pidFrontUrl)!="">
               <img class="addimg" src="/${parent.pidFrontUrl}"  onerror='this.src="/static/img/touxiang.svg";this.onerror=null'>
           <#else >
               <img src="/static/img/sf1.png" class="sf">
               <img src="/static/img/camera.png" class="camera">
           </#if>
           </div>
       </div>
       <div align="center">
           <p class="text"><span style="opacity: 0.6">请上传身份证</span>正面照片</p>
       </div>
   </div>
    <div class="card" align="center" style="margin-top: 2px">
        <div class="idcard" id="back" align="center" onclick=$("input[name=pidUrlBack]").trigger('click')>
            <div class="picdiv">
        <#if (teacher.pidUrlBack)?? && (teacher.pidUrlBack)!="">
            <img class="addimg" src="/${teacher.pidUrlBack}"  onerror='this.src="/static/img/touxiang.svg";this.onerror=null'>
        <#elseif (parent.pidBackUrl)?? && (parent.pidBackUrl)!="">
            <img class="addimg" src="/${parent.pidBackUrl}"  onerror='this.src="/static/img/touxiang.svg";this.onerror=null'>
        <#else >
            <img src="/static/img/sf2.png" class="sf">
            <img src="/static/img/camera.png" class="camera">
        </#if>
            </div>
        </div>
        <div align="center">
            <p class="text"><span style="opacity: 0.6">请上传身份证</span>背面照片</p>
        </div>
    </div>
    <div class="card" align="center" style="margin-top: 2px">
        <div class="idcard" id="people" align="center" onclick=$("input[name=peoplePidUrl]").trigger('click')>
        <div class="picdiv">
        <#if (teacher.peoplePidUrl)?? && (teacher.peoplePidUrl)!="">
                <img class="addimg" src="/${teacher.peoplePidUrl}"  onerror='this.src="/static/img/touxiang.svg";this.onerror=null'>
            <#elseif (parent.peoplePidUrl)?? && (parent.peoplePidUrl)!="">
                <img class="addimg" src="/${parent.peoplePidUrl}"  onerror='this.src="/static/img/touxiang.svg";this.onerror=null'>
        <#else >
            <img src="/static/img/sf3.png" class="sf3">
            <img src="/static/img/camera.png" class="camera">
        </#if>
        </div>
        </div>
        <div align="center">
            <p class="text"><span style="opacity: 0.6">请上传身份证</span>手持照片</p>
        </div>
    </div>
</div>



<div class="foot" align="center">
    <form action="/wx/${(teacher??)?string("teacherCenter","parentCenter")}/info/${user.id}/idcard" method="post" enctype="multipart/form-data">
        <input type="file" name="pidUrlFront" style="display: none">
        <input type="file" name="pidUrlBack" style="display: none">
        <input type="file" name="peoplePidUrl" style="display: none">
        <button style="width: 95% !important;">${(user.userStatus!=0)?string("保存并提交审核","保存")}</button>
    </form>
</div>
</body>

<script>
    if($(".addimg").size()==3){
        $(".foot button").css("opacity",1);
    }
    $("input[name='pidUrlFront']").change(function () {
            var $div=$('<div class="picdiv"></div>');
            var $img=$('<img class="addimg">');
            $($img).attr("src",getObjectURL(this.files[0]));
            $div.append($img);
            $("#front").html($div);
        if($(".addimg").size()==3){
            $(".foot button").css("opacity",1);
        }
    });
    $("input[name='pidUrlBack']").change(function () {
        var $div=$('<div class="picdiv"></div>');
        var $img=$('<img class="addimg">');
        $($img).attr("src",getObjectURL(this.files[0]));
        $div.append($img);
        $("#back").html($div);
        if($(".addimg").size()==3){
            $(".foot button").css("opacity",1);
        }
    });
    $("input[name='peoplePidUrl']").change(function () {
        var $div=$('<div class="picdiv"></div>');
        var $img=$('<img class="addimg">');
        $($img).attr("src",getObjectURL(this.files[0]));
        $div.append($img);
        $("#people").html($div);
        if($(".addimg").size()==3){
            $(".foot button").css("opacity",1);
        }
    });

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
