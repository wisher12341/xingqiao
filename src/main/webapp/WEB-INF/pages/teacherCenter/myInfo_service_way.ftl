<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>康复方式</title>
<#include "common/head.ftl" />
    <style>
        body{
            background-color: #f5f5f5;
        }
        #main{
            margin-top: 4%;
        }
        .buttonDiv_info{
            margin-bottom: 2%;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .text_p{
            font-size: 45px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            font-weight: bold;
        }
        .text_pp{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            top:5px;
        }
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
        }
        .icon_fa{
            color: dimgrey;
        }
        .flow > p {
            font-size: 45px;
            color: #dff0d8;
            text-align: center;
            font-weight: bold;
        }
        .search_label{
            background-color: white;
            font-size: 35px;
            color: #20b49a;
            padding: 5px;
            margin-right: 10px;
            border: solid 1px #20b49a;
            border-radius: 5px;
        }
        .text_detail{
            color: dimgrey;
            font-size: 35px;
            margin-left: 20px;
            margin-right: 100px;
            margin-top: 20px;
        }
        .row{
            margin: 0!important;
        }
        .b{
            margin-bottom: 2%!important;
        }
    </style>
</head>
<body>


<div id="main">
    <div class="buttonDiv_info" style="background-color: white;" onclick=location.href="/wx/teacherCenter/serviceInfo/${user.id}/way/student/edit">
        <div >
            <div class="row" style="height: 7%;padding-top:3.5% ">
                <div class="col-xs-4">
                    <p class="text_p"> 学生上门</p>
                </div>
                <#if (teacher.way)?contains("学生上门")>
                    <div class="col-xs-5">
                        <p class="text_pp">
                            <span style="color: orange">${(teacher.priceS)!}</span>元/课时
                        </p>
                    </div>
                    <div class="col-xs-2">
                        <p class="text_ppp"> 编辑</p>
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                <#else >
                    <div class="col-xs-5">
                    </div>
                    <div class="col-xs-2">
                        <p class="text_ppp"> <span style="color: red">未设置</span></p>
                    </div>
                    <div class="col-xs-1">
                        <i class="fa fa-angle-right fa-4x icon_fa"></i>
                    </div>
                </#if>
            </div>
            <div class="row" style="border-bottom:1px solid #ccc;height: 8% ">
                <div class="col-xs-12">
                    <#if (teacher.way)?contains("学生上门")>
                        <p class="text_detail">${teacher.tGround}-${teacher.detailAddress}</p>
                    </#if>
                </div>
            </div>
        </div>
    </div>


    <div class="buttonDiv_info" style="background-color: white;"  onclick=location.href="/wx/teacherCenter/serviceInfo/${user.id}/way/teacher/edit">
        <div >
            <div class="row" style="height: 7%;padding-top:3.5% ">
                <div class="col-xs-4">
                    <p class="text_p"> 治疗师上门</p>
                </div>
            <#if (teacher.way)?contains("治疗师上门")>
                <div class="col-xs-5">
                    <p class="text_pp">
                        <span style="color: orange">${teacher.priceT}</span>元/课时
                    </p>
                </div>
                <div class="col-xs-2">
                    <p class="text_ppp"> 编辑</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            <#else >
                <div class="col-xs-5">
                </div>
                <div class="col-xs-2">
                    <p class="text_ppp"> <span style="color: red">未设置</span></p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </#if>
            </div>
        <#list ((teacher.sGround)!)?split("、") as g>
            <#if g_index%5==0>
                <div class="row a">
                <div class="col-xs-12">
                <p class="text_detail sground">
            </#if>
            <span class="search_label">${g}</span>
            <#if g_index==4 || g_index==9 || g_index==14>
            </p>
            </div>
            </div>
            </#if>
        </#list>
        </div>
    </div>

    <div class="buttonDiv_info" style="background-color: white;" onclick=location.href="/wx/teacherCenter/serviceInfo/${user.id}/way/online/edit">
        <div >
            <div class="row" style="height: 7%;padding-top:3.5% ">
                <div class="col-xs-4">
                    <p class="text_p"> 在线授课</p>
                </div>
            <#if (teacher.way)?contains("在线授课")>
                <div class="col-xs-5">
                    <p class="text_pp">
                        <span style="color: orange">${teacher.priceO}</span>元/课时
                    </p>
                </div>
                <div class="col-xs-2">
                    <p class="text_ppp"> 编辑</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            <#else >
                <div class="col-xs-5">
                </div>
                <div class="col-xs-2">
                    <p class="text_ppp"> <span style="color: red">未设置</span></p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </#if>
            </div>
            <div class="row" style="border-bottom:1px solid #ccc;height: 8% ">
            </div>
        </div>
    </div>

</div>
</body>
<script>
    $(function () {
        $("div.a:last").addClass("b");
    })
</script>
</html>
