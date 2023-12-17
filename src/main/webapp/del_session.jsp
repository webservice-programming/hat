<%--
  Created by IntelliJ IDEA.
  User: user as gdaegeun539
  Date: 2022-12-20
  Time: 오후 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
<html>
<head>
    <title>DAMOA</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
</head>
<body>
<h3>로그아웃 중입니다...</h3>
</body>
</html>
