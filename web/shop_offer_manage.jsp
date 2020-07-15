<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";    %>
<base href="<%=basePath %>">
<html>
<head>
    <meta charset="UTF-8">
    <title>岗位管理</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/shop_offer_manage.css">
    <script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/shop_offer_manage.js"></script>
</head>

<body>
<!-- 白色商家标题栏 -->
<div class="row headline top-font">
    <!-- 左侧文字 -->
    <div class="col-lg-2">
        <div class="big-font">
            C&T招聘网
        </div>
        <div class="small-font">
            city and town recruitment
        </div>
    </div>
    <!-- 占位 -->
    <div class="col-lg-9">
    </div>
    <div class="col-lg-1 center-font">
        <span>allo,退出登录</span>
    </div>
</div>
<!--内容-->
<div class="container content">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <div class="img-head">头像</div>
        <div class="shop-name"> 嗦粉早餐店</div>
        <ul>
            <li class="choice">商家资料</li>
            <li class="choice">认证管理</li>
            <li class="choice">账号管理</li>
            <li class="choice" id="chosen">岗位管理</li>
            <li class="choice">我的评论</li>
            <li class="choice">我的消息</li>
            <li class="choice">举报</li>
        </ul>
    </div>
    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div class="line">
            <div>
                <span class="line-title">岗位管理</span>
            </div>
            <a href="#"><button class="add_button">发布岗位 </button></a>
        </div>
        <!-- 岗位 -->
        <!-- <div class="offer">
            <a class="offer_name">扫描员扫描员扫描员</a>
            <span class="person_number small-text">需400人</span>
            <div class="interest_number ">
                <img class="icon" src="image/interested.png">
                <span class="small-text">30000人感兴趣</span>
            </div>
            <div class="history">
                <div class="visits">
                    <img class="icon" src="image/look.png">
                    <span class="small-text">3000人浏览</span>
                </div>
                <div class="small-text">发布于:2020-07-02</div>
            </div>
            <button class="delet_button">删除</button>
        </div>

        <div class="offer">
            <a class="offer_name">扫描员扫描员扫描员</a>
            <span class="person_number small-text">需400人</span>
            <div class="small-text">发布于:2020-07-02</div>
            <button class="delet_button">删除</button>
        </div> -->
    </div>
</div>
</body>
</html>