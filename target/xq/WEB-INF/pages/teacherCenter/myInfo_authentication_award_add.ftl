<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>奖励荣誉</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />
    <style>
        body{
            background-color: #f5f5f5;
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
        .foot input{
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
        .textarea{
            width: 100%;
            height: 15%;
            font-size: 45px;
            border-style: none;
            padding: 35px;
            resize: none;
            color: dimgrey;
        }
        .length{
            background-color: white;
            font-size: 35px;
            color: #a0a0a0;
            text-align: right;
            width: 100%;
            border-top: 1px solid #ccc;
            padding: 15px 35px 15px 0px;
        }

        .addimg{
            width: 200px;
            height: 200px;
            margin-right: 50px;
            margin-bottom: 30px;
        }
        #pics{
            width: 95%;
            margin-left: 5%;
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .picrm{
            position: absolute;
            z-index: 999;
            margin-left: -85px;
            color: white;
            background-color: gray;
            margin-top: -105px;
            font-size: 35px;
        }
        .picdiv{
            position: relative;
            display: inline;
        }
    </style>
</head>
<body>


<div id="main">
    <form action="<#if data??>/wx/teacherCenter/info/${user.id}/${type}/${index}/edit<#else>/wx/teacherCenter/info/${user.id}/${type}/add</#if>" method="post" id="form">
        <input type="hidden" name="picUrls">
        <input type="hidden" name="deleteExitImg">

        <div class="buttonDiv_info" style="background-color: white">
            <textarea class="textarea" placeholder="请输入<#if type=='award'>相关奖励荣誉<#elseif type=='certificate'>相关证书<#else >其他资料，如学生证等</#if>介绍，20字以内" name="detail" maxlength="20"><#if data??>${(data?split("@")[0])}</#if></textarea>
            <div id="pics">
                <div class="ps" style="display: inline">
                    <#if data??>
                        <#list (data?split("@")[1])?split("!") as pic>
                            <div class="picdiv">
                                <img class="addimg" number="${pic_index}" src="/${pic}">
                                <span class="glyphicon glyphicon-remove picrm" onclick="cancelExitImg(this)"></span>
                            </div>
                        </#list>
                    </#if>
                </div>
                <img src="/static/img/add.png" id="addImg" style="border: 2px dashed lightgray;width: 200px;" onclick="$('#mulP').trigger('click');">
            </div>
            <p class="length">
                最多上传3张
            </p>
        </div>
    </form>
        <input id="mulP" type="file" class="upfile"  multiple style="display: none">

        <div class="foot" align="center">
            <input type="button" onclick="submit()" value="${(user.userStatus!=0)?string("保存并提交审核","保存")}" style="width: 100% !important;">
        </div>


</div>
</body>
<script>

    var num=1;//添加时 图片顺序

    //由于手机端浏览器 不能执行formData的delete方法 改用set方法进行覆盖 也不支持  那就创建一个变量用于存储要删除的img的ID 提交时放到cookie供后台进行判断
    var fd=new FormData();//存放全部图片信息
    var deleteImg="";//添加照片时  删除选择的
    var deleteExitImg="";//编辑时用 删除 已添加照片的  索引顺序

    $(function () {
        if($('.addimg').size()%3==0){
            $("#addImg").css("margin-top","0px");
        }else{
            $("#addImg").css("margin-top","-30px");
        }


        $("#mulP").change(function () {
            for(var i=0;i<this.files.length;i++){
                fd.append("img"+num,this.files[i]);
                var $div=$('<div class="picdiv"></div>');
                var $span=$('<span class="glyphicon glyphicon-remove picrm" onclick="cancelImg(this)"></span>');
                var $img=$('<img class="addimg" id="img'+num+'">');
                $($img).attr("src",getObjectURL(this.files[i]));
                $div.append($img);
                $div.append($span);
                var $target=$('#pics .ps');
                $target.append($div);
                num++;
            }
            if($('.addimg').size()%3==0){
                $("#addImg").css("margin-top","0px");
            }else{
                $("#addImg").css("margin-top","-30px");
            }
        });
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
            $("#addImg").css("margin-top","-30px");
        }
    }

//    编辑时用
    function cancelExitImg(obj) {
        $(obj).parent().remove();
        var number=$(obj).prev().attr("number");
//        fd.set(img+"","");//浏览器不能用
//        fd.delete(img+"");//浏览器不能用
        deleteExitImg+="#"+number;

        if($('.addimg').size()%3==0){
            $("#addImg").css("margin-top","0px");
        }else{
            $("#addImg").css("margin-top","-30px");
        }
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

    function submit() {
            deleteImg += "#";  //保证形式 #id#id#
            setCookie("deleteImg", deleteImg, '0.001');//存到cookie中
            //先上传图片
            $.ajax({
                type: "POST",
                url:"/wx/teacherCenter/img",
                data: fd,
                //下面的一定要加
                // 告诉jQuery不要去处理发送的数据
                processData : false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType : false,
                success: function (data) {
                    $('input[name="picUrls"]').val(data.data);
                    $('input[name="deleteExitImg"]').val(deleteExitImg);
                    $("#form").submit();
                },error:function () {}});
    }

    function setCookie(c_name,value,expiredays)
    {
        var exdate=new Date()
        exdate.setDate(exdate.getDate()+expiredays)
        document.cookie=c_name+ "=" +escape(value)+
                ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+";path=/"
    }

</script>
</html>
