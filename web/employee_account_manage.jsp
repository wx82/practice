<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 2020/7/19
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>账号管理</title>
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/employee_account_manage.css">
    <script>
        var uid = 3; //var uid =<%=session.getAttribute("uid")%>; 删前面
    </script>
    <script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/employee_account_manage.js"></script>
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
        <div class="img-head"><img class="head_image img-circle" src="img/默认头像.png"></div>
        <!--------------->
        <div class="user-name" id="user_name"> allo</div>
        <!--------------->
        <ul>
            <li class="choice">个人资料</li>
            <li class="choice" id="chosen">账号管理</li>
            <!--------------->
            <li class="choice">我感兴趣</li>
            <li class="choice">我的评论</li>
            <li class="choice">我的消息</li>
        </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <span class="line-title">账号资料</span>
        <div>
            <div class="col-lg-2"><img class="head_image img-circle" src="./img/默认头像.png"></div>
            <div class="col-lg-10" style="height:100px;position: relative;top:45px"><span id="account_msg">账号：</span></div>
        </div>
<%--        <form>--%>
<%--            <a href="javascript:;" class="upload">选择文件</a>--%>
<%--            <input class="change" type="file" multiple="multiple" />--%>
<%--        </form>--%>
        <form action="/user/adduserpic" method="post" enctype="multipart/form-data" id="pic">

            <input type="hidden" name="uid" value="5">
            <input type="file" name="pic">
            <input type="submit" value="提交" id="sub">
        </form>

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
