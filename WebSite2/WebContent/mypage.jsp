<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <jsp:useBean id="member" scope="session" class="member.MemberInfo" />
      <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
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
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs=null;
	
	try{
	String jdbcDriver="jdbc:apache:commons:dbcp:pool1";
	conn=DriverManager.getConnection(jdbcDriver);
	String sql="select id,pw,name,birth,gender,phone,nvl(email,'없음'),imgname from userinfo where id='"+member.getId()+"'";
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);

%>	
<%@ include file="Menus.jsp" %>
<h2><%=member.getId() %>님의 회원정보</h2>
		<%
			if(rs.next()){			
		%>
<img src="/file/imgs/<%=rs.getString(8) %>" style="width: 400px"/>
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

		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getDate(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td> <a href="">수정
			</a><a href=""> 삭제</a>  </td>
		</tr>		
		
		
		<%}
			} catch (SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				if (rs != null)	try {rs.close();} catch (SQLException ex) {	}
				if (stmt != null)try {	stmt.close();} catch (SQLException ex) {}
				if (conn != null)try {	conn.close();} catch (SQLException ex) {}
			}

		%>
		
		</table>
	
<a href="/index.jsp">홈으로 돌아가기</a>
</body>

</html>