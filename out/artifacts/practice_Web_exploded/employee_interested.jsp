<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 2020/7/20
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>我感兴趣</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/employee_interested.css">
    <script>
        var uid = 3; //var mid =<%=session.getAttribute("mid")%>; 删前面
    </script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/employee_interested.js"></script>
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
        <span>allo,退出登录</span>
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
            <li class="choice">我的评论</li>
            <li class="choice">我的消息</li>
            <li class="choice">举报</li>
        </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div>
            <span class="line-title">我感兴趣</span>
        </div>
        <!-- 岗位 -->
        <!-- <div class="offer">
            <a class="offer_name">扫描员扫描员扫描员</a>
            <span class="person_number small-text">需400人</span>
            <div class="inform">
                <span class="small-text">吉首|5星</span>
            </div>
            <div class="salary">
                500/天
            </div>
            <div class="history">
                <div class="visits">
                    <img class="icon" src="image/look.png">
                    <span class="small-text">3000人浏览</span>
                </div>
                <div class="small-text">发布于:2020-07-02</div>
            </div>
            <button class="delet_button">删除</button>
        </div> -->


        <table class="table">

            <tbody id="offer_list">

            <!-- <tr class="offer">
                <td><a class="employee_name">包包子包子包子包子子</a></td>
                <td><span class="person_number small-text">ametet/eu teur</span></td>
                <td>
                    <div class="small-text">发布于:5354732</div>
                </td>
                <td><button class="delet_button" id="49711927.34381357">不再感兴趣</button></td>
            </tr>

            <tr class="offer">
                <td><a class="employee_name">包子</a></td>
                <td><span class="person_number small-text">am et/eu Ut nullr</span></td>
                <td>
                    <div class="small-text">发布于:53547323.43127048</div>
                </td>
                <td><button class="delet_button" id="49711927.34381357">不再感兴趣</button></td>
            </tr> -->

            </tbody>
        </table>
    </div>
</div>
</body>

</html>