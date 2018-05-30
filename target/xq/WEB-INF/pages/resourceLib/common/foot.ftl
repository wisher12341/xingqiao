<style>
    .text_foot{
        text-align: center;
        font-size: 15px;
    }
    #foot{
        background-color: white;
        position: fixed;
        bottom: 0;
        height: 10%;
        width: 100%;
        border-top: 1px solid #ccc;
        color: dimgrey;
    }
    .icon_foot{
        font-size: 25px;
        color: dimgrey;
    }
    .row{
        margin-right: 0 !important;
        margin-left: 0 !important;
    }
</style>
<div id="foot">
    <div class="row" align="center" style="padding-top: 3%">
        <div class="col-xs-3" align="center" onclick="href('/wx/resourceLib/index')">
            <div>
                <span class="glyphicon glyphicon-home icon_foot"></span>
            </div>
            <div>
                <span class="text_foot text_index">首页</span>
            </div>
        </div>
        <div class="col-xs-3" align="center" onclick="href('/wx/resourceLib/index')">
            <div>
                <span class="glyphicon glyphicon-list-alt icon_foot"></span>
            </div>
            <div>
                <span class="text_foot text_order">资料上传</span>
            </div>
        </div>

        <div class="col-xs-3" align="center" onclick="href('/wx/resourceLib/index')">
            <div>
                <span class="glyphicon glyphicon-heart icon_foot"></span>
            </div>
            <div>
                <span class="text_foot text_demand">喜马拉雅</span>
            </div>
        </div>
        <div class="col-xs-3" align="center"  onclick="href('/wx/resourceLib/index')">
            <div>
                <span class="glyphicon glyphicon-user icon_foot"></span>
            </div>
            <div>
                <span class="text_foot text_my">我的资源</span>
            </div>
        </div>
    </div>
</div>

<script>
    function href(href){
        location.href=href;
    }
</script>