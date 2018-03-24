0<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>个人资料</title>
<#include "common/head.ftl" />
    <link href="${path}/static/css/parentCenter/parentCenter.css" type="text/css" rel="stylesheet" />
    <link href="${path}/static/css/parentCenter/myInfo.css" type="text/css" rel="stylesheet" />

</head>
<body>
<#--<div class="modal fade infoModal" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">-->
    <#--<div class="modal-dialog">-->
        <#--<div class="modal-content">-->
            <#--<div class="modal-header">-->
                <#--<a type="button" class="close" aria-hidden="true" data-dismiss="modal">×</a>-->
                <#--<h4 class="modal-title" id="myModalLabel">-->
                    <#--更改头像-->
                <#--</h4>-->
            <#--</div>-->
            <#--<div class="modal-body" style="text-align: center">-->
                <#--<img id="newImg" class="img-circle" style="object-fit: cover;">-->
            <#--</div>-->
            <#--<div class="modal-footer">-->
                <#--<button type="button" class="btn btn-primary" onclick="uploadIcon()">-->
                    <#--设为头像-->
                <#--</button>-->
            <#--</div>-->
        <#--</div><!-- /.modal-content &ndash;&gt;-->
    <#--</div><!-- /.modal-dialog &ndash;&gt;-->
<#--</div>-->

<div class="modal fade infoModal" id="fillInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a type="button" class="close" aria-hidden="true" >×</a>
                <h4 class="modal-title" id="myModalLabel">
                    您还为填写个人资料
                </h4>
            </div>
            <div class="modal-body">
                未填写资料将无法预约治疗师。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick=location.href="${path}/wx/parentCenter/${user.id}/fillInfoPage">
                    立即填写
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div id="main">

    <div class="imgDiv2">
        <img src="${user.headimgurl?contains("wx.qlogo.cn")?string("${user.headimgurl}","/${user.headimgurl}")}" class="img-circle"  onclick=location.href="${path}/wx/parentCenter/${user.id}/changeIconPage">
        <#--<input id="changeIcon" type="file" class="upfile" style="display: none"  onchange="previewFile()">-->
        <div id="myAlert" class="alert alert-success" style="display: none">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>您的资料正在审核中。</strong>审核通过后即可预约。
        </div>
    </div>

    <!-- /.modal -->


    <div class="myInfoDiv" >
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">基本信息</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/realName/parent/modifyPage">
                        <div class="list-item-title">姓名： </div>
                        <div class="list-item-text">${(parent.realName)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div"  onclick=location.href="${path}/wx/parentCenter/${user.id}/gender/parent/modifyPage">
                        <div class="list-item-title">性别： </div>
                    <#if user.gender==1>
                        <div class="list-item-text">女</div>
                    <#else>
                        <div class="list-item-text">男</div>
                    </#if>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/phone/parent/modifyPage">
                        <div class="list-item-title">手机： </div>
                        <div class="list-item-text">${(user.phone)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/email/parent/modifyPage">
                        <div class="list-item-title">邮箱： </div>
                        <div class="list-item-text">${(user.email)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
            </ul>
        </div>
        <div style="height: 30px;background-color: #e6ece3"></div>
        <div class="info-part-item" style="padding-top: 30px">
            <p class="info-part-title" style="color: #20b49a">个人资料</p>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/pid/parent/modifyPage">
                        <div class="list-item-title">身份证号： </div>
                        <div class="list-item-text">${(parent.pid)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="list-item-div" onclick=location.href="${path}/wx/parentCenter/${user.id}/ground/parent/modifyPage">
                        <div class="list-item-title">住址： </div>
                        <div class="list-item-text">${(parent.ground)!} ${(parent.address)!}</div>
                        <span><i class="fa fa-angle-right fa-4x"></i></span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function() {
    <#--if(${user.infoStatus}==0){-->
    <#--$("#myAlert").show();-->
    <#--}-->
        if(${user.userStatus}==0)
        {
            $('#fillInfoModal').modal();
        }

        else if(${user.userStatus}==1){
            $("#myAlert").show();
        }
        else if(${user.userStatus}==3){
            $("#myAlert").show();
        }

    });

    <#--var formData=new FormData();-->
    <#--function previewFile() {-->

        <#--var preview = document.querySelector('#newImg');-->
        <#--var file  = document.querySelector('input[type=file]').files[0];-->
        <#--formData.append("img",file);-->
        <#--var reader = new FileReader();-->
        <#--reader.onloadend = function () {-->
            <#--preview.src = reader.result;-->
        <#--}-->
        <#--if (file) {-->
            <#--reader.readAsDataURL(file);-->
        <#--} else {-->
            <#--preview.src = "";-->
        <#--}-->
        <#--$('#imgModal').modal();-->
    <#--}-->

    <#--function uploadIcon() {-->
        <#--$.ajax({-->
            <#--type: "POST",-->
            <#--url:"/wx/parentCenter/${user.id}/modifyIcon",-->
            <#--data: formData,-->
            <#--//下面的一定要加-->
            <#--// 告诉jQuery不要去处理发送的数据-->
            <#--processData : false,-->
            <#--// 告诉jQuery不要去设置Content-Type请求头-->
            <#--contentType : false,-->
            <#--success: function (data) {-->
                <#--if(data.success==true) {-->
                    <#--window.location.href = "/wx/parentCenter/${user.id}/myInfo";-->
                <#--}-->
            <#--},error:function () {-->
                <#--alert("出错了！");-->
            <#--}});-->
    <#--}-->
</script>
</html>