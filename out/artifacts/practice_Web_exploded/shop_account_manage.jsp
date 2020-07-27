
<%@ page import="com.qz.pojo.Merchant" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/17
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shop_account_manage.css">
    <script>
        <%--var mid = 3; //var mid =<%=session.getAttribute("mid")%>; 删前面--%>
       <% Merchant merchant = (Merchant) session.getAttribute("merchant_session");
       int mid = merchant.getMid();
       %>
        var mid = mid;
    </script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/shop_account_manage.js"></script>
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
        <div class="shop-name" id="shop_name"> 嗦粉早餐店</div>
        <ul>
            <li class="choice"><a href="shop_info.jsp">商家资料</a></li>
            <li class="choice"><a href="certify_manager.jsp">认证管理</a></li>
            <li class="choice" id="chosen"><a>账号管理</a></li>
            <li class="choice"><a href="shop_offer_manage.jsp">岗位管理</a></li>
            <li class="choice"><a href=shop_remark.jsp">我的评论</a></li>

        </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div>
            <span class="line-title">账号资料</span>
        </div>
        <span id="account_msg">
                账号： abgag
            </span>

        <br>
        <span class="line-title" style="margin-top:20px">修改密码</span>

        <div id="myTabContent">

            <form action="" id="change_password_form">

                <div class="row">
                    <span style="margin-right:10px;margin-left:20px">原密码</span>
                    <input id="oldpassword" placeholder="输入原密码密码" type="password" style="margin-left:20px"><span class="error_tip"></span>
                </div>


                <div class="row">
                    <span style="margin-right:10px;margin-left:20px">新密码</span>
                    <input id="newpassword1" placeholder="输入新密码" type="password" style="margin-left:20px"><span class="error_tip"></span>
                </div>

                <div class="row">
                    <span style="margin-right:10px;margin-left:20px">确认密码</span>
                    <input id="newpassword2" style="margin-right:10px;margin-left:8px" placeholder="输入新密码" type="password"><span class="error_tip"></span>
                </div>

                <div class="row" style="margin-top:18px;margin-left:20px">
                    <input id="change_password_button" type="button" value="完成修改">
                </div>

            </form>
        </div>

    </div>
</div>
</body>
</html>
