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
        .buttonDiv_info{
            margin: 4% 0;
            border-bottom: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }
        .info{
            background-color: white;
            margin: 4px 0;
            height: 120px;
            padding-top: 30px;
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
        .text_label{
            font-size: 40px;
            display: inline;
            margin-left: 20px;
            color: dimgrey;
            position: relative;
            bottom:5px;
        }
        .text_ppp{
            font-size: 35px;
            display: inline;
            float: right;
            position: relative;
            top:5px;
        }
        .icon_fa{
            /*position: relative;*/
            /*top: 5px;*/
            color: dimgrey;
        }
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
        .textarea{
            width: 100%;
            height: 30%;
            font-size: 45px;
            border-style: none;
            padding: 35px;
            resize: none;
            color: dimgrey;
        }
        .title_input{
            font-size: 45px;
            border-style: none;
            color: dimgrey;
            position: relative;
            top:-6px;
        }
        .length{
            background-color: white;
            font-size: 35px;
            color: #a0a0a0;
            text-align: right;
            width: 100%;
            padding-right: 50px;
        }
        .selectArea1{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            padding-top: 5px;
            width: 100%;
            margin-left: 6px;
            color: dimgrey;
            opacity: 1
        }
        .selectArea2{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            padding-top: 5px;
            width: 100%;
            color: dimgrey;
            opacity: 1;
        }
        .selectArea2No,.selectArea1No{
            border-style: none;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            padding-top: 5px;
            width: 100%;
            color: #8c8c8c;
            opacity: 0.8;
            margin-left: 5px;
        }
        textarea{
            width: 100%;
            height: 15%;
            font-size: 45px;
            border-style: none;
            padding: 35px;
            resize: none;
            color: dimgrey;
        }
        .text_detail{
            color: dimgrey;
            font-size: 35px;
            margin-left: 40px;
            margin-right: 100px;
        }
        .search_label{
            background-color: white;
            font-size: 40px;
            color: #20b49a;
            padding: 5px;
            margin-right: 10px;
            border: solid 1px #20b49a;
            border-radius: 5px;
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
        #area2{
            position: absolute;
            z-index: 99;
            top:100%;
            width: 100%;
            height: 100%;
            background-color: #f5f5f5;
            display: none;
        }
        .area{
            margin-top: 5%;
        }
        .selectArea2{
            opacity: 0.5;
        }
    </style>
</head>
<body>

<div id="main">
    <form action="<#if (teacher.way)?? && (teacher.way)?contains(type)>/wx/teacherCenter/serviceInfo/${user.id}/way/${type!}/edit<#else >/wx/teacherCenter/serviceInfo/${user.id}/way/${type!}/add</#if>" method="post">
        <input type="hidden" name="userId" value="${(user.id)!}">
        <input type="hidden" name="way" value="${(teacher.way)!}">
        <input type="hidden" name="sGround">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-4" style="width: 28%!important;">
                    <p class="text_p"> 康复方式</p>
                </div>
                <div class="col-xs-8">
                    <p class="text_pp" style="color: #a0a0a0;font-weight: bold">${type}</p>
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-4" style="width: 28%!important;">
                    <p class="text_p"> 课酬(元/课)</p>
                </div>
                <div class="col-xs-8">
                    <input placeholder="请输入一课时的酬金" type="number" class="title_input" maxlength="10" style="padding-left: 20px"
                    <#if type=="学生上门">
                           value="${((teacher.priceS)??)?string((teacher.priceS)!,"")}" name="priceS"
                    <#elseif type=="治疗师上门">
                           value="${((teacher.priceT)??)?string((teacher.priceT)!,"")}" name="priceT"
                    <#else >
                           value="${((teacher.priceO)??)?string((teacher.priceO)!,"")}" name="priceO"
                    </#if>>
                </div>
            </div>
        </div>

        <#if type=="学生上门">
        <div class="buttonDiv_info">
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 上门地址</p>
                </div>
                <div class="col-xs-9">
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 省/市</p>
                </div>
                <div class="col-xs-8">
                        <#if (teacher.tGround)?? && (teacher.tGround)!="">
                        <select class="selectArea1 title_input" name="area1" >
                        <#else >
                        <select class="selectArea1No title_input" name="area1"onchange="area1Select()">
                            <option value="" style="display: none;" disabled selected>选择省/市</option>
                        </#if>
                        <option value="上海">上海</option>
                    </select>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" >
                <div class="col-xs-3">
                    <p class="text_p"> 市/区</p>
                </div>
                <div class="col-xs-8" id="a2">
                    <#if (teacher.tGround)?? && (teacher.tGround)!="">
                    <select class="selectArea2 title_input" name="area2">
                    <#list area2 as a>
                        <option value="${a.name}">${a.name}</option>
                    </#list>
                    <#else >
                        <select class="selectArea2No title_input" name="area2" onclick="alert('请先选择省/市')">
                            <option value="" style="display: none;" disabled selected>请选择市/区</option>
                        </select>
                    </#if>
                </select>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="info row" style="height:300px!important; ">
                <div class="col-xs-3" style="height:250px!important;">
                    <p class="text_p" style="position:relative;top: 50px"> 详细地址</p>
                </div>
                <div class="col-xs-9" style="height:250px!important; ">
                    <textarea placeholder="请输入详细地址,40字以内"  class="title_input" maxlength="40" name="detailAddress" style="padding-left: 20px;height: 100%">${(teacher.detailAddress)!}</textarea>
                </div>
            </div>
        </div>
        <#elseif type=="治疗师上门">
        <div class="buttonDiv_info" style="background-color: white" onclick="showArea2()">
            <div class="row" style="margin: 4% 0!important;">
                <div class="col-xs-9">
                    <p class="text_p"> 上门区域</p>
                </div>
                <div class="col-xs-2">
                    <p class="text_ppp"> 编辑</p>
                </div>
                <div class="col-xs-1">
                    <i class="fa fa-angle-right fa-4x icon_fa"></i>
                </div>
            </div>
            <div class="row ss" style="margin: 0!important;padding: 0 2% 2%;">
                <#if (teacher.sGround)??>
                    <#list ((teacher.sGround)!)?split("、") as g>
                        <#--<#if g_index%5==0>-->
                        <#--<div class="row" style="margin:0 0 2%!important;">-->
                        <#--<div class="col-xs-12">-->
                        <#--<p class="text_detail sground">-->
                        <#--</#if>-->
                        <span class="search_label">${g}</span>
                        <#--<#if g_index==4 || g_index==9 || g_index==14>-->
                        <#--</p>-->
                        <#--</div>-->
                        <#--</div>-->
                        <#--</#if>-->
                    </#list>
                </#if>
            </div>
        </div>
        </#if>

    </form>
    <div class="foot" align="center">
        <button style="width: 100% !important;" onclick="val()">${(user.userStatus!=0)?string("保存并提交审核","保存")}</button>
    </div>
</div>


<div id="area2">
    <div class="area">
        <#list area2 as a>
            <div class="col-xs-4" align="center" style="margin-bottom: 60px">
                <div class="search_label_a <#if (teacher.sGround)?? && (teacher.sGround)?contains(a.name)>selectArea2</#if>" onclick="changeArea2(this)">${a.name}</div>
            </div>
        </#list>
    </div>
    <div class="foot" align="center">
        <button style="width: 49.5% !important;" onclick='$("#main").show();$("#area2").animate({top:"100%"},function () {$("#area2").hide();});'>返回</button>
        <button style="width: 49.5% !important;" onclick="confirmArea2()">确定</button>
    </div>
</div>



</body>

<script>
    function val() {
        var flag=0;
        $(".title_input").each(function () {
            if($.trim($(this).val())==""){
                flag=1;
            }
        });
        <#if type=="治疗师上门">
            if($(".search_label").size()==0){
                flag=1;
            }
        </#if>
        if(flag==0){
            $("form").submit();
        }else{
            alert("资料未填写完整");
        }
    }

    $(function () {
        <#if (teacher.tGround)?? && (teacher.tGround)!="">
            $(".selectArea1 option").each(function () {
                if($(this).val()=="${(teacher.tGround)?split("-")[0]}"){
                    $(this).prop("selected","true");
                }
            });
            $(".selectArea2 option").each(function () {
                if($(this).val()=="${(teacher.tGround)?split("-")[1]}"){
                    $(this).prop("selected","true");
                }
            });
            <#elseif (teacher.sGround)?? && (teacher.sGround)!="">

        </#if>

    });
    function confirmArea2() {
        $(".ss").html("");
        var data="";
        $(".selectArea2").each(function () {
            data+="、"+$(this).text();
            $(".ss").append($('<span class="search_label">'+$(this).text()+'</span>'));
        });
        if(data.length>0){
            data=data.substring(1);
        }
        $("input[name='sGround']").val(data);
        $("#main").show();$("#area2").animate({top:"100%"},function () {$("#area2").hide();});
    }

    function showArea2() {
        $('#area2').show();
        $('#area2').animate({top:"0"},function () {
            $('#main').hide();
        });
    }

    function changeArea2(obj) {
        var c=$(obj).attr("class");
        if(c.indexOf("selectArea2")!=-1){
            $(obj).removeClass("selectArea2");
        }else{
            $(obj).addClass("selectArea2");
        }
    }

    function area1Select() {
        $(".selectArea1No").removeClass("selectArea1No").addClass("selectArea1");
        var $select=$('<select class="selectArea2No title_input" name="area2" onchange="area2Select()"></select>');
        $select.append($('<option value="" style="display: none;" disabled selected>请选择市/区</option>'));
    <#list (area2)! as item>
        $select.append($('<option value="${item.name}">${item.name}</option>'));
    </#list>
        $("#a2").html($select);
    }

    function area2Select() {
        $(".selectArea2No").removeClass("selectArea2No").addClass("selectArea2");
    }
</script>
</html>
