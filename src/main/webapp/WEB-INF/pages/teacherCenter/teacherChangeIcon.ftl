<#include "common/const.ftl" />
<html>
<head>
<#include "common/head.ftl" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no, email=no" />
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>修改头像</title>
    <style>
        body {
            margin: 0;
            text-align: center;
            background-color: #0a0a0a;
        }
        #clipArea {
            margin-top: 40%;
            height: 300px;
        }
        #file{
            display: none;
        }
        .m-btn{
            background-color: #20c59a;
            color: #ffffff;
        }
        #view {
            display: none;
            /*margin: 0 auto;*/
            /*width: 200px;*/
            /*height: 200px;*/
        }
    </style>
</head>
<body ontouchstart="">
<div id="clipArea">
</div>
<input type="file" id="file">
<div id="view"></div>

<div class="row" style="margin-top: 10%; padding: 15px">
    <div class="col-xs-4" style="padding: 5px"><a class="btn btn-block m-btn" href="/wx/parentCenter/${user.id}/myInfo_base">返回</a></div>
    <div class="col-xs-4" style="padding: 5px"><button class="btn btn-block m-btn" onclick="file.click()" id="inputBtn">选择</button></div>
    <div class="col-xs-4" style="padding: 5px"><button class="btn btn-block m-btn" id="clipBtn">完成</button></div>
</div>

<script src="/static/js/iconClip/hammer.min.js"></script>
<script src="/static/js/iconClip/iscroll-zoom-min.js"></script>
<script src="/static/js/iconClip/lrz.all.bundle.js"></script>
<script src="/static/js/iconClip/PhotoClip.js"></script>
<script>
    //document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
    var clipArea = new PhotoClip("#clipArea", {
        size: [260, 260],
        outputSize: [640, 640],
        file: "#file",
        view: "#view",
        ok: "#clipBtn",
        loadStart: function() {
            console.log("照片读取中");
        },
        loadComplete: function() {
            console.log("照片读取完成");
            console.log(file);
        },
        done: function(dataURL) {
            console.log(dataURL);
            var formData=new FormData();
            formData.append("img",convertBase64UrlToBlob(dataURL));
            $.ajax({
                type: "POST",
                url:"/wx/teacherCenter/"+"${user.id}"+"/modifyIcon",
                data: formData,
                //下面的一定要加
                // 告诉jQuery不要去处理发送的数据
                processData : false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType : false,
                success: function (data) {
                    if(data.success==true) {
                        window.location.href = "/wx/teacherCenter/" + "${user.id}" + "/myInfo_base";
                    }
                },error:function () {
                    alert("出错了！");
                }});
        },
        fail: function(msg) {
            alert(msg);
        }
    });
    if("${user.headimgurl}"!=null && "${user.headimgurl}".length!=0)
    {
        clipArea.load("/${user.headimgurl}");
    }
    else{
        file.click();
    }
    /**
     * 将以base64的图片url数据转换为Blob
     * @param urlData
     *            用url方式表示的base64图片数据
     */
    function convertBase64UrlToBlob(urlData){
        var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte
        //处理异常,将ascii码小于0的转换为大于0
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }
        return new Blob( [ab] , {type : 'image/png'});
    }
    //clipArea.destroy();
</script>

</body>
</html>