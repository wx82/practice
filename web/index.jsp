<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/10
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/merchant/allmer">进入商家界面</a>
<a href="${pageContext.request.contextPath}/user/alluser">进入个人界面</a>
<a href="${pageContext.request.contextPath}/job/alljob">进入职位界面</a>
<hr>
<h3>登录注册</h3>
<a href="employee_login.jsp">进入个人登录/注册界面</a>
<a href="shop_login.jsp">进入商家登录/注册界面</a>
<br>
<h3>商家界面</h3>
<a href="shop_info.jsp">进入商铺信息界面</a>
<a href="shop_offer_manage.jsp">进入职业管理界面</a>
<a href="shop_account_manage.jsp">进入商家账号管理界面</a>
<a href="shop_remark.jsp">进入商家评论界面</a>
<a href="show_work_infor.jsp">进入求职者查看职位详情界面</a>
<a href="work_infor.jsp">进入商家查看职位详情界面</a>
<a href="shop_form.jsp">进入商家注册表单</a>
<br>
<h3>个人界面</h3>
<a href="employee_account_manage.jsp">进入个人账号管理界面</a>
<a href="employee_interested.jsp">进入个人感兴趣界面</a>
<a href="employee_remark.jsp">进入个人评论界面</a>
<a href="user_info.jsp">进入个人信息界面(可编辑)</a>
<a href="user_show.jsp">进入个人信息查看界面</a>
<br>
<h3>首页、聊天</h3>
<a href="web_index.jsp">网站首页</a>
<a href="jsp/websocket.jsp">聊天</a>
<br>
<h3>后台</h3>
<a href="admin_login.jsp">进入后台管理登录界面</a>
<a href="admin_employee.jsp">进入后台管理求职者界面</a>
<a href="admin_shop.jsp">进入后台管理商家界面</a>
</body>
</html>
