<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>证件照</title>
<#include "common/head.ftl" />

    <style>
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

        .card{
            /*background-color: #20b49a;*/
            background:rgba(32,180,173,1);
            height: 30%;
            position: relative;
        }
        .idcard{
            padding-top: 10%;
        }
        .text{
            font-size: 35px;
            color: white;
            padding-top: 30px;
        }
    </style>
</head>
<body style="background-color: #f5f5f5">
<div id="main">
   <div class="card" align="center" style="margin-top: 10px">
       <div class="idcard" align="center" onclick=$("input[name=pidUrlFront]").trigger('click')>
           <#if (teacher.pidUrlFront)??>
               <div>
                   <img src="/${teacher.pidUrlFront}" width="230" onerror='this.src="/static/img/touxiang.svg;this.onerror=null"'>
               </div>
           <#else >
               <img src="/static/img/idcard.png" width="230">
           </#if>
       </div>
       <div align="center">
           <p class="text"><span style="opacity: 0.6">请上传身份证</span>正面照片</p>
       </div>
   </div>
    <div class="card" align="center" style="margin-top: 2px">
        <div class="idcard" align="center" onclick=$("input[name=pidUrlBack]").trigger('click')>
        <#if (teacher.pidUrlBack)??>
            <div>
                <img src="/${teacher.pidUrlBack}" width="230" onerror='this.src="/static/img/touxiang.svg;this.onerror=null"'>
            </div>
        <#else >
            <img src="/static/img/idcard.png" width="230">
        </#if>
        </div>
        <div align="center">
            <p class="text"><span style="opacity: 0.6">请上传身份证</span>背面照片</p>
        </div>
    </div>
    <div class="card" align="center" style="margin-top: 2px">
        <div class="idcard" align="center" onclick=$("input[name=peoplePidUrl]").trigger('click')>
        <#if (teacher.peoplePidUrl)??>
            <div>
                <img src="/${teacher.peoplePidUrl}" width="230" onerror='this.src="/static/img/touxiang.svg;this.onerror=null"'>
            </div>
        <#else >
            <img src="/static/img/idcard.png" width="230">
        </#if>
        </div>
        <div align="center">
            <p class="text"><span style="opacity: 0.6">请上传身份证</span>手持照片</p>
        </div>
    </div>
</div>



<div class="foot" align="center">
    <form action="" method="post" enctype="multipart/form-data">
        <input type="file" name="pidUrlFront" style="display: none">
        <input type="file" name="pidUrlBack" style="display: none">
        <input type="file" name="peoplePidUrl" style="display: none">
        <button style="width: 100% !important;">${(user.userStatus!=0)?string("保存并提交审核","保存")}</button>
    </form>
</div>
</body>
</html>
