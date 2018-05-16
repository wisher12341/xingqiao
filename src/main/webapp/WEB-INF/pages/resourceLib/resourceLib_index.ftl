<#include "common/const.ftl" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>康复资源库</title>
    <#include "common/head.ftl" />
    <style>
        .header-icon{
            text-align: center;
            background-color: #ffffff;
        }
        .header-icon img{
            width: 70px;
        }
        .header-icon p{
            font-size: 18px;
        }
        .article-item{
            padding: 10px;
            height: 120px;
            margin-bottom: 4px;
            background-color: #ffffff;
        }
        .articles{
            margin-top: 10px;
        }
        .articles-info{
            background-color: #ffffff;
            height: 40px;
            padding: 10px;
        }
        .articles-info p{
            font-size: 20px;
            color: #E0995E;
        }
        .article-title{
            font-size: 18px;
            padding: 0 5px;
        }
        .article-content{
            color: #747474;
            padding: 0 15px;
            font-size: 14px;
        }
        .article-tag{
            display: inline;
        }
        .article-tag p{
            display: inline;
            color: #20c59a;
            border:2px solid #20c59a;
            border-radius:12%;
            padding: 5px;
        }
    </style>
</head>
<body>
<div id="main" style="background-color: #f5f5f5">
    <div class="index-header" style="margin-top: 15px">
        <div class="row">
            <div class="col-xs-4 header-icon">
                <img src="../../../static/img/resourceLib/21526385668_.pic.jpg">
                <p>知识库</p>
            </div>
            <div class="col-xs-4 header-icon">
                <img src="../../../static/img/resourceLib/31526385681_.pic.jpg">
                <p>康复前沿</p>
            </div>
            <div class="col-xs-4 header-icon">
                <img src="../../../static/img/resourceLib/41526385721_.pic.jpg">
                <p>康复课件</p>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 header-icon">
                <img src="../../../static/img/resourceLib/51526385735_.pic.jpg">
                <p>儿童绘本</p>
            </div>
            <div class="col-xs-4 header-icon">
                <img src="../../../static/img/resourceLib/61526385744_.pic.jpg">
                <p>趣味游戏</p>
            </div>
            <div class="col-xs-4 header-icon">
                <img src="../../../static/img/resourceLib/71526385757_.pic.jpg">
                <p>查一查</p>
            </div>
        </div>
    </div>

    <div class="articles">
        <div class="articles-info">
            <p><span class="glyphicon glyphicon-star"></span>好文精选</p>
        </div>
        <div class="article-item">
        <div class="article-title">
            <p>【贝贝帮】千万家庭的陪学...</p>
        </div>
        <div class="article-content">
            <p>贝贝帮 3-12岁儿童一对一上门陪...</p>
        </div>
        <div class="row">
            <div class="col-xs-8" style="margin-top: 8px">
                <div class="article-tag">
                    <p>幼小衔接</p>
                </div>
                <div class="article-tag">
                    <p>启发式陪学</p>
                </div>
            </div>
            <div class="col-xs-2">
                <span class="glyphicon glyphicon-thumbs-up icon_foot"></span>
            </div>
            <div class="col-xs-2">
                <span class="glyphicon glyphicon-download-alt icon_foot"></span>
            </div>
        </div>
        <div class="article-tab"></div>
    </div>
        <div class="article-item">
            <div class="article-title">
                <p>贝贝帮陪学篇？第二期|达达...</p>
            </div>
            <div class="article-content">
                <p>人与人之间的遇见，总是在冥冥...</p>
            </div>
            <div class="row">
                <div class="col-xs-8" style="margin-top: 8px">
                    <div class="article-tag">
                        <p>初次体验</p>
                    </div>
                    <div class="article-tag">
                        <p>奖惩机制</p>
                    </div>
                </div>
                <div class="col-xs-2">
                    <span class="glyphicon glyphicon-thumbs-up icon_foot"></span>
                </div>
                <div class="col-xs-2">
                    <span class="glyphicon glyphicon-download-alt icon_foot"></span>
                </div>
            </div>
            <div class="article-tab"></div>
        </div>
        <div class="article-item">
            <div class="article-title">
                <p>贝贝帮辅导作业篇|一个专门...</p>
            </div>
            <div class="article-content">
                <p>做事情磨磨蹭蹭，说了一遍又一...</p>
            </div>
            <div class="row">
                <div class="col-xs-8" style="margin-top: 8px">
                    <div class="article-tag">
                        <p>时间管理</p>
                    </div>
                    <div class="article-tag">
                        <p>自主学习</p>
                    </div>
                </div>
                <div class="col-xs-2">
                    <span class="glyphicon glyphicon-thumbs-up icon_foot"></span>
                </div>
                <div class="col-xs-2">
                    <span class="glyphicon glyphicon-download-alt icon_foot"></span>
                </div>
            </div>
            <div class="article-tab"></div>
        </div>

    </div>
</div>
<#include "common/foot.ftl" />
</body>
</html>