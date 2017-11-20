<#include "../order/common/const.ftl" />
<html>
<head>
    <title>评论</title>
<#include "../order/common/head.ftl" />
    <link type="text/css" rel="stylesheet" href="${path}/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/order/star-rating.js"></script>
    <style>
        .rating-xl{
            font-size: 8em !important;
        }
        .start{
            margin-top: 50px;
        }
        .foot{
            position: fixed;
            width: 100%;
            bottom: 0;
            background-color: #f5f5f5;
        }
        .foot input{
            /*background-color:#94e6c8 ;*/
            background-color: #56c078;
            color: white !important;
            font-size: 45px;
            font-weight: bold;
            padding: 20px;
            margin: 0 auto;
            border-radius: 15px;
            height:6%
        }
        .ts_mask{
            width:100%;
            height:100%;
            background:rgba(0,0,0,0.8);
            position:fixed;
            z-index:99;
            top:0;
            display:none;
        }
        .tishi{
            width:100%;
            height:auto;
            float:left;
            background-size:100% auto;
            margin:0 auto;
        }
        .teacher_reply{
            font-size: 40px;
            font-weight: bold;
        }
        .teacher_reply_detail{
            font-size: 40px;
        }
    </style>
    <style type="text/css">
        *{margin:0;padding:0;}
        .fileImg{padding:20px;}
        .fileImg ul li{position:relative;border:1px solid #c5c5c5;width:150px;height:150px;float:left;margin-right:50px;list-style-type:none;background:#f4f5f7;border-radius:5px;}
        .fileImg ul li input{position:absolute;z-index:3;top:0;left:0;width:100%;height:100%;opacity:0;-webkit-tap-highlight-color:rgba(0,0,0,0);}
        .fileImg ul li:after{position:absolute;content:' ';display:block;width:2px;height:30px;background:#cdcdcd;left:50%;margin-left:-1px;top:50%;margin-top:-15px;z-index:2;}
        .fileImg ul li:before{position:absolute;content:' ';display:block;top:50%;margin-top:-1px;z-index:2;width:30px;height:2px;background:#cdcdcd;left:50%;margin-left:-15px;}
        .fileImg ul li span:nth-child(2){display:none;width:150px;height:150px;position:absolute;left:0;top:0;background:#f4f5f7;cursor:pointer;border-radius:5px;overflow:hidden;z-index:3;}
        .fileImg ul li span:nth-child(2):after{content:'x';display:block;z-index:4;width:20px;height:20px;line-height:16px;color:#fff;background:red;border-radius:50%;position:absolute;left:50%;top:50%;margin-left:-10px;margin-top:-10px;text-align:center;}
        .fileImg ul li span:nth-child(2) img{width:100%;position:absolute;left:0;top:50%;}
    </style>
</head>
<body>


<form action="${path}/wx/organization/comment" method="post" enctype="multipart/form-data">
    <input type="hidden" name="pid" value="0">
    <input type="hidden" name="oid" value="${orgId}">
    <input type="hidden" name="type" value="1">

    <div style="margin-top:20px;vertical-align: middle;font-size: 40px;" align="center">
        <textarea style="width:95%;height:50%;border: 1px solid black" placeholder="请填写您的评价" id="comment_text" name="detail" ></textarea>
    </div>
    <div style="font-size: 50px;margin-top: 20px" align="center">
        <input type="radio" name="isOpen"  id="open" checked value="1" style="width:50px;height:50px;margin: 13px;">公开&nbsp;&nbsp;&nbsp;
        <input type="radio" name="isOpen"  id="anonymi" value="0" style="width:50px;height:50px;margin: 13px">匿名
    </div>

    <div class="fileImg" id="fileImg">
        <ul class="file_ul">
            <li>
                <input type="file" class="upfile" name="pics">
                <span></span>
            </li>
        </ul>
    </div>
    <div align="center" class="foot">
        <input type="submit" style="width:90%;padding: 20px; font-size: 40px;background-color: #56c078;color: white;border-radius: 10px" value="发表评论">
    </div>


</form>
<div class="ts_mask">
    <div class="tishi" align="center">

    </div>
</div>
</body>
<script>


    //    上传图片
    var obj;
    var	ALi;

    var isIos;//判断手机是不是苹果手机


    //图片放大
    function picAdd(obj) {

        $(".tishi").append($('<img src="'+$(obj).attr("src")+'" width="90%">'));

        $(".ts_mask").fadeIn(500);

    }


    $(function(){
        if('${comment!"no"}'=='no'){
            //获取浏览器的userAgent,并转化为小写
            var ua = navigator.userAgent.toLowerCase();
            //判断是否是苹果手机，是则是true
            isIos = (ua.indexOf('iphone') != -1) || (ua.indexOf('ipad') != -1);
            $("#input-21a").rating();
            comment();
        }


        $(".ts_mask").click(function () {
            $(".ts_mask").fadeOut(500);
            $('.tishi').html("");
        });

    });


    //进行评价
    function comment() {


        if(isIos) {
            $(".file_ul").html('<li><input type="file" class="upfile" name="pics"><span></span> </li>');
        }else{
            $(".file_ul").html('<li><input type="file" class="upfile" name="pics" accept="image/*" capture="camera" multiple><span></span> </li>');
        }
        obj = document.getElementById('fileImg');
        ALi = obj.getElementsByTagName('li');
        addFn();
//        $("input[name='orgId']").val(oid);
    }
    function addFn(){
        for(var i=0;i<ALi.length;i++){
            ALi[i].getElementsByTagName('input')[0].index=i;
            ALi[i].getElementsByTagName('span')[0].index=i;
            // 文件域改变后执行
            ALi[i].getElementsByTagName('input')[0].onchange=function(){
                ALi[this.index].getElementsByTagName('span')[0].style.display='block'; //删除按钮显示
                var oImg = document.createElement('img'); // 创建img元素
                ALi[this.index].getElementsByTagName('span')[0].appendChild(oImg);
                oImg.src=getFileUrl(this);  //地址增加
//                oImg.src=pathJs+"/static/img/wechat/share.png";
                setTimeout(function(){  //图片高度居中
                    oImg.style.marginTop=-oImg.offsetHeight/2+'px';
                }, 100);
            };
            // 删除按钮事件
            ALi[i].getElementsByTagName('span')[0].onclick=function(){
                if(isIos) {
                    //苹果
                    ALi[this.index].innerHTML = '<input type="file" class="upfile" name="pics"><span></span>';
                }else{
                    //安卓
                    ALi[this.index].innerHTML = '<input type="file" class="upfile" name="pics" accept="image/*" capture="camera" multiple><span></span>';
                }
                addFn();
            };
        }

    }


    // 创建本地地址
    function getFileUrl(sourceId) {
        var url;
        if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
            url = sourceId.value;
        } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
            url = window.URL.createObjectURL(sourceId.files.item(0));
        } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
            url = window.URL.createObjectURL(sourceId.files.item(0));
        }
        if(isIos) {
            $(".file_ul").append('<li><input type="file" class="upfile" name="pics"><span></span> </li>');
        }else{
            $(".file_ul").append('<li><input type="file" class="upfile" name="pics" accept="image/*" capture="camera" multiple><span></span> </li>');
        }
        addFn();
        return url;
    }

</script>
</html>
