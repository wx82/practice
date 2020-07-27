<%@ page import="com.qz.pojo.Merchant" %>
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
<script type="text/javascript">
    <% Merchant merchant = (Merchant) session.getAttribute("merchant_session");
int mid = merchant.getMid();
%>
    var mid = <%=mid%>;
</script>
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
            <li class="choice"><a href="shop_info.jsp"> 商家资料</a></li>
            <li class="choice"><a href="certify_manager.jsp">认证管理</a></li>
            <li class="choice" ><a href="shop_account_manage.jsp">账号管理</a></li>
            <li class="choice" id="chosen"><a>岗位管理</a></li>
            <li class="choice"><a href="shop_remark.jsp">我的评论</a></li>
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
         -->

        <table class="table">

            <tbody id="offer_list">

            <!-- <tr class="offer">
                    <td><a class="offer_name">洗碗工</a></td>
                    <td><span class="person_number small-text">1小时50元</span></td>
                    <td>
                        <div class="small-text">发布于:5354732</div>
                    </td>
                    <td><button class="delet_button" id="49711927.34381357">删除</button></td>
                </tr>

             -->

            </tbody>
        </table>
    </div>
</div>
</body>
</html>