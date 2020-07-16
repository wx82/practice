<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";    %>

<base href="<%=basePath %>">
<html>

<head>
    <meta charset="UTF-8">
    <title>C&T招聘网登录</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/shop_login.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/shop_login.js"></script>
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
    <dic class="col-lg-4 right-part">

        <div class="big-font text-center">
            C&T招聘网
        </div>

        <div class="small-font text-center">
            city and town recruitment
        </div>

        <div class="center-block text-center">
            <button onclick="window.open('employee_login.html')" class="submit">
                我要求职>>
            </button>
        </div>
    </dic>


    <!-- 右边部分 -->
    <div class="col-lg-8 left-part">

        <!-- 选项卡组件（菜单项nav-tabs）登录注册-->
        <ul id="myTab" class="title" id="title" role="tablist">
            <li class="active"><a href="#login" role="tab" data-toggle="tab">登录</a></li>
            <li><a href="#register" role="tab" data-toggle="tab">注册</a></li>
        </ul>

        <!-- 选项卡面板 -->
        <div id="myTabContent" class="tab-content">

            <!-- 商家登录面板 -->
            <div class="tab-pane active container login_pane" id="login">
                <form action="" id="login_form">

                    <div class="row">
                        <input id="phone" placeholder="输入手机号" type="text"><span class="error_tip"></span>
                    </div>

                    <div class="row">
                        <input id="identify_code" placeholder="输入验证码" type="text">
                        <input id="identify_code_button" type="button" value="获取验证码">
                        <span class="error_tip"></span>
                    </div>

                    <div class="row" style="margin-top:18px;">
                        <input id="login_button" type="button" value="商家登录">
                        <a id="password_login">使用密码登录</a>
                    </div>

                </form>


            </div>

            <!-- 商家注册面板 -->
            <div class="tab-pane container" id="register">
                <form action="" id="register_form">

                    <div class="row">
                        <input id="phone2" placeholder="输入手机号" type="text"><span class="error_tip"></span>
                    </div>

                    <div class="row">
                        <input id="identify_code2" placeholder="输入验证码" type="text">
                        <input id="identify_code_button2" type="button" value="获取验证码"><span class="error_tip"></span>
                    </div>

                    <div class="row">
                        <input id="password2" placeholder="密码为6-12位，只能输入字母、数字和下滑线" type="password"><span class="error_tip"></span>
                    </div>
                    <div class="row">
                        <input id="password3" placeholder="再次输入密码" type="password"><span class="error_tip"></span>
                    </div>

                    <input id="register_button" type="button" value="商家注册">

                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>