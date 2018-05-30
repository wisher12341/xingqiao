<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复项目</title>
<#include "common/head.ftl" />
    <style>
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
        .ob-div .ob-img img{
            width: 80%;
            margin: 10% 0;
        }
        .ob-btn {
            text-align: center;
            width: 80%;
        }
        .ob-btn div{
            height: 80px;
            border-bottom-left-radius: 10%;
            border-bottom-right-radius:10% ;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .ob-img{
            opacity: 1;
        }
        .ob{
            font-size: 42px;
            color: grey;
            font-weight: bold;
            position: relative;
            bottom: 25px;
        }
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            /*border-bottom: 1px solid #ccc;*/
            /*border-top: 1px solid #ccc;*/
        }
        .select .ob{
            color: dimgrey !important;
        }
        .select .ob-img{
            opacity: 0.5 !important;
        }
    </style>
</head>
<body>


<div id="main" class="row buttonDiv_info">


    <div class="col-sm-4" >
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">言语</div>
            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">听觉</div>
            </div>
        </div>
    </div>
    <div class="col-sm-4" >
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">认知</div>
            </div>
        </div>
    </div>
    <div class="col-sm-4" >
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">情绪行为</div>
            </div>
        </div>
    </div>
    <div class="col-sm-4" >
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">运动</div>
            </div>
        </div>
    </div>
    <div class="col-sm-4" style="margin-bottom: 5%">
        <div class="ob-div" align="center" onclick="ob_select(this)">
            <div class="ob-img">
                <img src="${path}/static/img/log/icon.png">
            </div>
            <div class="ob-btn">
                <div style="width: 100%" class="ob">心理</div>
            </div>
        </div>
    </div>
</div>

<div class="foot" align="center">
    <form action="/wx/teacherCenter/editServiceInfo" method="post">
        <input type="hidden" name="domain">
        <input type="hidden" name="userId" value="${user.id}">
    </form>
        <input type="button" style="width: 100% !important;" value="${(user.userStatus!=0)?string("保存并提交审核","保存")}" onclick="submit()">
</div>
</body>

<script>
    $(function () {
        $(".ob-div").each(function () {
            if('${(teacher.domain)!}'.indexOf($(this).text().trim())!=-1){
                $(this).addClass("select");
            }
        });
    });

    function ob_select(obj) {
        if($(obj).attr("class").indexOf("select")!=-1) {
            $(obj).removeClass("select");
        }else{
            $(obj).addClass("select");
        }
    }

    function submit() {
        var data="";
        $(".select .ob").each(function () {
            data+="、"+$(this).text().trim();
        });
        data=data.substring(1);
        $("input[name='domain']").val(data);
        $("form").submit();
    }
</script>
</html>
