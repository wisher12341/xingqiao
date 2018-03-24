<#include "common/const.ftl" />
<#include "common/var.ftl" />
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>我的星级</title>
<#include "common/head.ftl" />
    <style>
        body{
            /*background-color: #f5f5f5;*/
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
            font-size: 40px;
            color: dimgrey;
            /*font-weight: bold;*/
            padding:15px 30px 0;
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
    </style>
</head>
<body>


<div id="main">
    <div class="" style="background-color: white;" >
        <p class="text_p">1. 星级治疗师是如何评定的？</p>
        <p class="text_p">治疗师在本平台具有的星级标志制度规则如下:</p>
        <p class="text_p">300次康复+90％以上好评， 1星</p>
        <p class="text_p">600次康复+90％以上好评， 2星</p>
        <p class="text_p">1000次康复+90％以上好评，3星</p>
        <p class="text_p">2000次康复+90％以上好评，4星</p>
        <p class="text_p">3000次康复+90％以上好评，5星</p>
        <p class="text_p">（康复次数：按治疗师在平台中更新的‘康复计划’计数） </p>
        <p class="text_p"> 治疗师获得星级后，其康复费用参考标准可以上浮。获得星级后接收的预约可以开始上浮费用，正在进行治疗的要根据双方的意愿进行费用调整。</p>
        <p class="text_p">2.成为星级治疗师有什么好处吗？</p>
        <p class="text_p">首先这是您经验能力的展示，您的价格也可以以此为依据提升，进入更高的价格区间，帮助您与经验稍缺乏的治疗师区分开。另外，您将会得到平台的优先推荐，得到更多患者资源，更好的做康复安排。同时，平台也会为星级康复治疗师准备各种福利，组织相关活动以及技能提升的讲座等。</p>
    </div>

    <div class="foot" align="center">
        <button style="width: 100% !important;" onclick="">申请升级</button>
    </div>
</div>
</body>

</html>
