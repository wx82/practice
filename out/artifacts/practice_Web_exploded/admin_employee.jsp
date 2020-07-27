<%--
  Created by IntelliJ IDEA.
  User: hanmengru
  Date: 2020/7/21
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>管理求职者</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/admin_employee.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/admin_employee.js"></script>
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
    <div class="col-lg-9">
    </div>


    <div class="col-lg-1 center-font" style="width: 150px;margin-left: 850px;">
        <span>欢迎</span>
        <span id="manager_name"></span>
        <a id="exit">退出</a>
    </div>
</div>

<!--内容-->
<div class="container content">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <ul>
            <li class="choice" id="amdin_shop"><a href="admin_shop.jsp">商家管理</a></li>
            <li class="choice chosen" id="amdin_employee"><a href="admin_employee.jsp">求职者管理</a></li>
            <li class="choice" id="amdin_license"><a href="admin_license.jsp">认证管理</a></li>
        </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div class="search_line">
            <from action="">
                <input id="search_id" type="text" placeholder="输入求职者id">
                <input id="search_id_button" type="button" value="通过id查找">
            </from>
            <from action="">
                <input id="search_name" type="text" placeholder="输入求职者名称">
                <input id="search_name_button" type="button" value="通过名称查找">
            </from>
        </div>

        <table class="table">
            <!-- <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First</th>
                            <th scope="col">Last</th>
                            <th scope="col">Handle</th>
                        </tr>
                    </thead> -->
            <tbody id="employee_list">

            <!-- <tr class="employee">
                <td><a class="employee_name">包子</a></td>
                <td><span id="id">id:1231412</span></td>
                <td><button class="delet_button">删除求职者</button></td>
            </tr>
            <tr class="employee">
                <td><a class="employee_name">包子包子包子包子包子</a></td>
                <td><span id="id">id:12314231412</span></td>
                <td><button class="delet_button">删除求职者</button></td>
            </tr>
            <tr class="employee">
                <td><a class="employee_name">alllo</a></td>
                <td><span id="id">id:1231412</span></td>
                <td><button class="delet_button">删除求职者</button></td>
            </tr> -->



            </tbody>
        </table>
    </div>
</div>
</body>

</html>
