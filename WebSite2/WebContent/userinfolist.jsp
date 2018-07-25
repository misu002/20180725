<%@page import="java.util.List"%>
<%@page import="member.userinfo"%>
<%@page import="Services.GetUserService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="member" scope="session" class="member.MemberInfo" />
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%
		GetUserService getService = GetUserService.getInstance();
		List<userinfo> userlist = getService.getUser();
	%>
	<%@ include file="Menus.jsp"%>
	<h1>이 블로그의 전체 회원 정보</h1>
	<table border="1">
		<tr>
			<td>Id</td>
			<td>PW</td>
			<td>Name</td>
			<td>Birthday</td>
			<td>Gender</td>
			<td>Phone Number</td>
			<td>Email</td>
		</tr>
		<%
			if (userlist.isEmpty()) {
		%>
		<h1>등록된 회원정보가 없습니다</h1>

		<%
			} else {
				for (int i = 0; i < userlist.size(); i++) {
					String birth = userlist.get(i).getYear() + "-" + userlist.get(i).getMonth() + "-"
							+ userlist.get(i).getDay();
		%>
		<tr>
			<td><%=userlist.get(i).getId()%></td>
			<td><%=userlist.get(i).getPw()%></td>
			<td><%=userlist.get(i).getName()%></td>
			<td><%=birth%></td>
			<td><%=userlist.get(i).getGender()%></td>
			<td><%=userlist.get(i).getPhone()%></td>
			<td><%=userlist.get(i).getEmail()%></td>
			<td><a href="">수정 </a><a href=""> 삭제</a></td>
		</tr>
		<%}}%>


		<!-- 	}
		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException ex) {	}
			if (stmt != null)try {	stmt.close();} catch (SQLException ex) {}
			if (conn != null)try {	conn.close();} catch (SQLException ex) {}
	} -->




	</table>
	<a href="/index.jsp">홈으로 돌아가기</a>
</body>

</html>