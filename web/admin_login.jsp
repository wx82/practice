<%--
  Created by IntelliJ IDEA.
  User: hanmengru
  Date: 2020/7/20
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>C&T招聘网登录</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/admin_login.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/admin_login.js"></script>
</head>

<body>
<!-- 标题栏 -->
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
    <div class="col-lg-10">

    </div>

</div>

<!-- 登录表单 -->
<div class="container card">




    <!-- 左边部分 -->
    <div class="col-lg-8 left-part">

        <!-- 选项卡组件（菜单项nav-tabs）登录注册-->
        <ul id="myTab" class="title" id="title" role="tablist">
            <li class="active"><a href="#login" role="tab" data-toggle="tab">管理员登录</a></li>
        </ul>

        <!-- 选项卡面板 -->
        <div id="myTabContent" class="tab-content">

            <!-- 管理员登录面板 -->
            <div class="tab-pane active container login_pane" id="login">
                <form action="" id="login_form">

                    <div class="row">
                        <input id="name" placeholder="输入管理员账号" type="text"><span class="error_tip"></span>
                    </div>

                    <div class="row">
                        <input id="password" placeholder="输入管理员密码" type="password"><span class="error_tip"></span>
                    </div>

                    <div class="row" style="margin-top:18px;">
                        <input id="login_button" type="button" value="管理员登录">
                    </div>

                </form>
            </div>
        </div>
    </div>

    <!-- 右边部分 -->
    <dic class="col-lg-4 right-part">

        <div class="big-font text-center">
            C&T招聘网
        </div>

        <div class="small-font text-center">
            city and town recruitment
        </div>

    </dic>
</div>
</body>

</html>
