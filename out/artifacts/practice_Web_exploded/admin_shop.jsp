<%@ page import="com.qz.pojo.Manager" %><%--
  Created by IntelliJ IDEA.
  User: hanmengru
  Date: 2020/7/21
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    Manager manager = (Manager) request.getSession().getAttribute("manager_session");
    String manager_name = manager.getManame();
%>

<head>
    <meta charset="UTF-8">
    <title>商家管理</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/admin_shop.css">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/admin_shop.js"></script>
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
        <span id="manager_name"><%=manager_name %></span>
        <a id="exit">退出</a>
    </div>
</div>

<!--内容-->
<div class="container content">
    <!-- 左侧选项 -->
    <div class="col-lg-3 choice-box">
        <ul>
            <li class="choice chosen" id="amdin_shop"><a href="admin_shop.jsp">商家管理</a></li>
            <li class="choice" id="amdin_employee"><a href="admin_employee.jsp">求职者管理</a></li>
            <li class="choice" id="amdin_license"><a href="admin_license.jsp">认证管理</a></li>
        </ul>
    </div>

    <!-- 右侧内容 -->
    <div class="col-lg-9 right-part">
        <div class="search_line">
            <from action="">
                <input id="search_id" type="text" placeholder="输入商家id">
                <input id="search_id_button" type="button" value="通过id查找">
            </from>
            <from action="">
                <input id="search_name" type="text" placeholder="输入商家名称">
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
            <tbody id="shop_list">

            <!-- <tr class="shop">
                <td><a class="shop_name col-lg-1">扫描员扫描员扫描员</a></td>
                <td> <span class="label label-success">已认证</span></td>
                <td><span class="label label-danger">5星</span></td>
                <td><span id="id">id:1231412</span></td>
                <td><button class="delet_button">删除商家</button></td>
            </tr>

            <tr class="shop">
                <td><a class="shop_name col-lg-1">描员扫描员</a></td>
                <td> <span class="label label-default">未认证</span></td>
                <td><span class="label label-danger">5星</span></td>
                <td><span id="id">id:1231411231412314112</span></td>
                <td><button class="delet_button">删除商家</button></td>
            </tr> -->

            </tbody>
        </table>
        <!-- 商家item
        <div class="shop">
            <a class="shop_name col-lg-1">扫描员扫描员扫描员</a>
            <span class="label label-success">已认证</span>
            <span class="label label-danger">5星</span>
            <div class="inform">
                <span id="id">id:1231412</span>
            </div>

            <button class="delet_button">删除商家</button>
        </div>

        商家item
        <div class="shop">
            <a class="shop_name">扫描员扫描员扫描员</a>
            <span class="label label-success">已认证</span>
            <span class="label label-danger">5星</span>
            <div class="inform">
                <span id="id">id:1231412</span>
            </div>

            <button class="delet_button">删除商家</button>
        </div> -->

    </div>
</div>
</body>

</html>
