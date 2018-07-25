<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
session.invalidate();
/* response.sendRedirect("/index.jsp"); */
	
	%>
	<script>
alert("로그아웃 되셨습니다");
location.href='/index.jsp';
</script>
</body>
</html>