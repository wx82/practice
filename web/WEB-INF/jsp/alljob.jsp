<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/7/10
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>商家展示</h2>
<c:forEach var = "job" items="${list}">
    ${job.jid}
    ${job.jname}
    ${job.jintro}
</c:forEach>
</body>
</html>
