<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/16
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";    %>
<base href="<%=basePath %>">
<html>
<head>
    <meta charset="UTF-8">
    <title>我的评论</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shop_remark.css">
    <script>
        var mid = 3; //var mid =<%=session.getAttribute("mid")%>; 删前面
    </script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/shop_remark.js"></script>
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
            <li class="choice">岗位管理</li>
            <li class="choice">我的评论</li>
            <li class="choice">我的消息</li>
            <li class="choice">举报</li>
        </ul>
    </div>
    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div>
            <span class="line-title">我的评论</span>
        </div>

        <!--评论卡片 -->
        <!-- <div class="remark_card">
            <div class="line">
                <a class="me">嗦粉早餐店</a>
                <span>评论</span>
                <a class="shop_name">我</a>
                <span class="label label-danger">5星</span>
            </div>
            <p class="remark_content">babla</p>
            <hr/>
            <div class="line2">
                <p class="remark_content">商家回复：babal</p>
                <div><button class="delet_button"> 删除回复</button>
                    <a>举报</a>
                </div>
            </div>
        </div>
        <div class="remark_card">
            <div class="line">
                <a class="me">嗦粉早餐店</a>
                <span>评论</span>
                <a class="shop_name">我</a>
                <span class="label label-danger">5星</span>
            </div>
            <p class="remark_content">babla</p>
            <hr/>
            <div class="line2">
                <input type="text" id="shop_add_remark" placeholder="请输入回复">

                <div><button class="add_button"> 马上回复</button>
                    <a>举报</a>
                </div>
            </div>
        </div> -->



    </div>
</div>
</body>
</html>
