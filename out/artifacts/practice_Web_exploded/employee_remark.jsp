<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 2020/7/20
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>我的评论</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/employee_remark.css">
    <script>
        var uid = 3; //var mid =<%=session.getAttribute("mid")%>; 删前面
    </script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/employee_remark.js"></script>
</head>

<body>
<!-- 白色用户标题栏 -->
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
    <div class="col-lg-7">
    </div>

    <div class="col-lg-2 center-font">
        <span>吉首市</span>
        <span>[更换位置]</span>
    </div>

    <div class="col-lg-1 center-font">
        <span>退出登录</span>
    </div>
</div>

<!--内容-->
<div class="container content">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <div class="img-head">头像</div>
        <div class="shop-name"> allo</div>
        <ul>
            <li class="choice">个人资料</li>
            <li class="choice">账号管理</li>
            <li class="choice">我感兴趣</li>
            <li class="choice" id="chosen">我的评论</li>
            <li class="choice">我的消息</li>
            <li class="choice">举报</li>
        </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div>
            <span class="line-title">我的评论</span>
        </div>

        <!-- 评论 -->
        <!-- <div class="remark_card">
            <div class="line">
                <a class="me">我</a>
                <span>评论</span>
                <a class="shop_name">嗦粉早餐店</a>
                <span class="label label-danger">5星</span>
            </div>
            <p class="remark_content">babla</p>
            <hr/>
            <div class="line2">
                <p class="remark_content">商家回复：babal</p>
                <button class="delet_button"> 删除</button>
            </div>
        </div>

        <div class="remark_card">
            <div class="line">
                <a class="me">我</a>
                <span>评论</span>
                <a class="shop_name">嗦粉早餐店</a>
                <span class="label label-danger">5星</span>
            </div>
            <p class="remark_content">babla</p>
            <hr/>
            <div class="line2">
                <p class="remark_content">商家回复：babal</p>
                <button class="delet_button"> 删除</button>
            </div>
        </div>

        <div class="remark_card">
            <div class="line">
                <a class="me">我</a>
                <span>评论</span>
                <a class="shop_name">嗦粉早餐店</a>
                <span class="label label-danger">5星</span>
            </div>
            <p class="remark_content">babla</p>
            <hr/>
            <div class="line2">
                <p class="remark_content">商家回复：l</p>
                <button class="delet_button"> 删除</button>
            </div>
        </div> -->
    </div>
</div>
</body>

</html>