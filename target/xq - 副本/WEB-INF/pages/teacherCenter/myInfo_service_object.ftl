<#include "common/const.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复对象</title>
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
        body{
            background-color: #f5f5f5;
        }
        .buttonDiv_info{
            margin: 4% 0;
            /*border-bottom: 1px solid #ccc;*/
            /*border-top: 1px solid #ccc;*/
        }
        .search_label_a{
            background-color: #20b49a;
            font-size: 40px;
            color: white;
            padding: 20px 40px;
            border: solid 1px #20b49a;
            border-radius: 5px;
            width: 95%;
            opacity: 1;
        }
        .area{
            margin-top: 5%;
        }
        .select{
            opacity: 0.5;
        }
    </style>
</head>
<body>


<div id="main" class="row buttonDiv_info">
    <div id="area2">
        <div class="area">
            <div class="col-xs-6" align="center" style="margin-bottom: 60px">
                <div class="search_label_a" onclick="changeArea2(this)">0-3岁</div>
            </div>
            <div class="col-xs-6" align="center" style="margin-bottom: 60px">
                <div class="search_label_a" onclick="changeArea2(this)">3-6岁</div>
            </div>
            <div class="col-xs-6" align="center" style="margin-bottom: 60px">
                <div class="search_label_a" onclick="changeArea2(this)">6-18岁</div>
            </div>
            <div class="col-xs-6" align="center" style="margin-bottom: 60px">
                <div class="search_label_a" onclick="changeArea2(this)">成人</div>
            </div>
        </div>
    </div>
</div>

<div class="foot" align="center">
    <form action="/wx/teacherCenter/editServiceInfo" method="post">
        <input type="hidden" name="object">
        <input type="hidden" name="userId" value="${user.id}">
    </form>
        <input type="button" style="width: 100% !important;" value="${(user.userStatus!=0)?string("保存并提交审核","保存")}" onclick="submit()">
</div>
</body>

<script>
    $(function () {
        $(".search_label_a").each(function () {
            if('${(teacher.object)!}'.indexOf($(this).text().trim())!=-1){
                $(this).addClass("select");
            }
        });
    });
    function changeArea2(obj) {
        var c=$(obj).attr("class");
        if(c.indexOf("select")!=-1){
            $(obj).removeClass("select");
        }else{
            $(obj).addClass("select");
        }
    }

    function submit() {
        var data="";
        $(".select").each(function () {
            data+="、"+$(this).text().trim();
        });
        data=data.substring(1);
        $("input[name='object']").val(data);
        $("form").submit();
    }
</script>
</html>
