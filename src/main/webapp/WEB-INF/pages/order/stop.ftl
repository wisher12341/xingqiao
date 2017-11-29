<#include "common/const.ftl" />
<html>
<head>
    <title>终止订单</title>
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
    </style>

</head>
<body>

    <form action="${path}/wx/order/stop" method="post" >
        <input name="oid" type="hidden" value="${oid}"/>
                <div style="margin-top:20px;vertical-align: middle;font-size: 40px;" align="center">
                    <textarea style="width:95%;height:50%;border: 1px solid black" placeholder="请填写您的理由" id="comment_text" name="reason" ></textarea>
                </div>

        <div align="center" class="foot">
            <input type="submit" style="width:90%;padding: 20px; font-size: 40px;background-color: #20b49a;color: white;border-radius: 10px" value="提交">
        </div>


    </form>


</body>

</html>
