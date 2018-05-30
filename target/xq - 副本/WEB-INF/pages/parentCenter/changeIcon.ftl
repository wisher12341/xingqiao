<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>更换头像</title>
    <style>*,html,body{padding:0px;margin:0px;}</style>
    <script src="../../../static/js/parentCenter/icon/jquery-2.0.3.min.js"></script>
    <script src="../../../static/js/parentCenter/icon/layer.m.js"></script>
    <script src="../../../static/js/parentCenter/icon/touch-0.2.14.min.js"></script>
    <script src="../../../static/js/parentCenter/icon/jquery.crop.js"></script>
    <script>
        $(function(){
            var w = $(window).width();
            var h = $(window).height();
            $('.cutbox').crop({
                w:w>h?h:w,
                h:h,
                r:(w-30)*0.5,
                res:'',
                callback:function(ret){
                    alert(ret);
                    localStorage.setItem("new_avatar",ret);
                    sessionStorage.setItem('edit_baby_avatar',true);
                    window.location.replace("http://baby.memiler.com/index.php?s=/wap");
                }
            },${user.id},"${(user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}"?replace('\\','\\\\')))!}","parent");
        });
        <#--img\...需要加反斜杠-->
    </script>
</head>

<body>
<div class="cutbox"></div>
</body>
</html>
