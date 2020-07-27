<%@ page import="com.qz.pojo.Merchant" %><%--
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
        <%--var mid = 3; //var mid =<%=session.getAttribute("mid")%>; 删前面--%>
        <% Merchant merchant = (Merchant) session.getAttribute("merchant_session");
int mid = merchant.getMid();
String mname = merchant.getMname();
%>
        var mid = <%=mid%>;
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
        <span>退出登录</span>
    </div>
</div>
<!--内容-->
<div class="container content">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <div class="img-head"><img class="head_image img-circle" src="img/bsPic.png"></div>
        <div class="shop-name" id="shop_name"> <%=mname%></div>
        <ul>
            <li class="choice"><a href="shop_info.jsp">商家资料</a></li>
            <li class="choice"><a href="certify_manager.jsp">认证管理</a></li>
            <li class="choice" ><a href="shop_account_manage.jsp">账号管理</a></li>
            <li class="choice"><a href="shop_offer_manage.jsp">岗位管理</a></li>
            <li class="choice" id="chosen"><a href="shop_remark.jsp">我的评论</a></li>
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
