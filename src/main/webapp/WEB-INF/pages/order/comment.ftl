<#include "common/const.ftl" />
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>评论</title>
<#include "common/head.ftl" />
    <link href="/static/css/teacherCenter/updateLog.css">
    <link type="text/css" href="${path}/static/css/order/star-rating.css" media="all" rel="stylesheet" />
    <script type="text/javascript" src="${path}/static/js/order/star-rating.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link type="text/css" href="${path}/static/common/box/build.css" rel="stylesheet" />
    <style>
        #foot{
            width: 100%;
        }
        #foot_function{
            background-color: whitesmoke;
            border-top: 1px solid #e5e5e5;
            height: 8%;
        }
        #target{
            width: 95%;
            border-style: none;
            padding-top: 10px;
            font-size: 18px;
        }
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
            color: dimkgrey;
        }
        #addImg{
            display: none;
        }
    </style>
</head>
<body>

    <div id="main">
        <div id="body">
            <div align="center">
                <form action="/wx/comment/${oid}" method="post" id="formComment">
                    <textarea id="target" placeholder="填写评论..." name="detail"></textarea>
                    <input name="picUrls" type="hidden">
                    <input name="isOpen" type="hidden">
                    <input name="level" type="hidden">
                </form>
            </div>
            <div id="pics">
                <div class="ps" style="display: inline">
                </div>
                <img src="/static/img/add.png" id="addImg" style="border: 2px dashed lightgray;width: 100px" onclick="$('#mulP').trigger('click');">
            </div>
        </div>


        <div id="foot">
            <div id="foot_play">
                <div style="display: inline">
                    <input id="input-22a" type="number" class="rating" min=0 max=5 step=1 data-size="xs"  value="0" >
                </div>
                <div class="nm">
                    <img src="/static/img/earth_s.png" ><span class="nm_span">公开</span>
                </div>
            </div>
            <div id="foot_function">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-3">
                            <img src="/static/img/pic.png" class="pic" style="margin-left: 15px" onclick="$('#mulP').trigger('click');">
                        </div>
                        <div class="col-xs-3">
                            <img src="/static/img/Smile.png" class="pic" style="margin-left: 15px">
                        </div>
                        <div class="col-xs-3" onclick="selectOpen()">
                            <img src="/static/img/earth.png" class="pic" style="margin-left: 15px">
                        </div>
                        <div class="col-xs-3">
                            <input type="button" onclick="submit()" class="pic" style="padding: 5px 8px; font-size: 18px;background-color: #20b49a;color: white;border-radius: 5px;border: none" value="发表">
                        </div>
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


</body>
<script>




    var num=1;//图片顺序
    var fd=new FormData();//存放表单信息

    $("#input-22a").rating({
        showClear: false
    });

    $(function(){
        $("#mulP").change(function () {
            for(var i=0;i<this.files.length;i++){
                fd.append("img"+num,this.files[i]);
                var $div=$('<div class="picdiv"></div>');
                var $span=$('<span class="glyphicon glyphicon-remove picrm" onclick="cancelImg(this)"></span>');
                var $img;
                if(i==this.files.length-1 && $("#addImg").is(":hidden")){
                    $img=$('<img class="addimg" id="img"'+num+' onload=$("#addImg").show()>');
                }else{
                    $img=$('<img class="addimg" id="img"'+num+'>');
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
        fd.delete(img);
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
    $('#main').slideUp();
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

    function submit() {
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
                $('input[name="picUrls"]').val(data.data);
                $('input[name="isOpen"]').val($('input[name="open"]').val());
                $('input[name="level"]').val($('#input-22a').val());
                $("#formComment").submit();
            },error:function () {

            }});
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
<script type="text/javascript">
    //实现 textarea随内容高度自动变化  原理 新生成一个textarea替换
    //*2
    var addHandler = window.addEventListener?
            function(elem,event,handler){elem.addEventListener(event,handler);}:
            function(elem,event,handler){elem.attachEvent("on"+event,handler);};

    var $$ = function(id){return document.getElementById(id);}


    function autoTextArea(elemid){
        //½һtextareaû߶
        if(!$$("_textareacopy")){
            var t = document.createElement("textarea");
            t.id="_textareacopy";
            t.style.position="absolute";
            t.style.top="-300px";
            t.style.width="95%";
            t.style.fontSize="18px";
            t.style.paddingTop="10px";
            document.body.appendChild(t);
        }
        function change(){
            $$("_textareacopy").value= $$(elemid).value;
            $$(elemid).style.height= $$("_textareacopy").scrollHeight+$$("_textareacopy").style.height+"px";
        }
        addHandler($$("target"),"propertychange",change);//for IE
        addHandler($$("target"),"input",change);// for !IE
        $$(elemid).style.overflow="hidden";//һأġ
        $$(elemid).style.resize="none";//ȥtextareaקŴ/С߶/ȹ
    }

    addHandler(window,"load",function(){
        autoTextArea("target");
    });
</script>
</html>
