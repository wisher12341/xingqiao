<style>
    .text_foot{
        text-align: center;
        font-size: 40px;
    }
    #foot{
        background-color: white;
        position: fixed;
        bottom: 0;
        height: 8%;
        width: 100%;
        border-top: 1px solid #ccc;
        color: dimgrey;
    }
    .icon_foot{
        font-size: 40px;
        color: dimgrey;
    }
</style>
<div id="foot">
        <div class="row" align="center" style="padding-top: 3%">
            <div class="col-xs-2" align="center" onclick="href('/wx/teacherCenter')" style="width: 17%!important;">
                <div>
                    <span class="glyphicon glyphicon-home icon_foot"></span>
                </div>
                <div>
                    <span class="text_foot text_index">主页</span>
                </div>
            </div>
            <div class="col-xs-3" align="center" onclick="href('/wx/teacherCenter/${(user.id)!uid}/order')" style="width: 22%!important;">
                <div>
                    <span class="glyphicon glyphicon-list-alt icon_foot"></span>
                </div>
                <div>
                    <span class="text_foot text_order">订单</span>
                </div>
            </div>
            <div class="col-xs-3" align="center" style="width: 20%!important;">
                <div>
                    <span class="glyphicon glyphicon-calendar icon_foot"></span>
                </div>
                <div>
                    <span class="text_foot text_calendar">日程</span>
                </div>
            </div>
            <div class="col-xs-3" align="center" onclick="href('/wx/teacherCenter/${(user.id)!uid}/myDemands')" style="width: 22%!important;">
                <div>
                    <span class="glyphicon glyphicon-heart icon_foot"></span>
                </div>
                <div>
                    <span class="text_foot text_demand">患者</span>
                </div>
            </div>
            <div class="col-xs-2" align="center"  onclick="href('/wx/teacherCenter/${(user.id)!uid}/my')" style="width: 17%!important;">
                <div>
                    <span class="glyphicon glyphicon-user icon_foot"></span>
                </div>
                <div>
                    <span class="text_foot text_my">我的</span>
                </div>
            </div>
        </div>
</div>

<script>
    function href(href){
        location.href=href;
    }
</script>