<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
	table{
		    background: white;
            width: 1500px;
            margin: 20px auto;
	}
	
	
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
	String sql = "select e.empno, e.ename, e.job, ee.ename, e.hiredate, e.sal, nvl(e.comm, 0), e.deptno, d.dname, d.loc "
		     + " from emp e, emp ee, dept d "
            + " where e.mgr=ee.empno and e.deptno=d.deptno "
		     + " order by e.ename ";
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
%>	
<%@ include file="Menus.jsp" %>
<table border="1">
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>직급(업무)</td>
			<td>상사(이름)</td>
			<td>입사일</td>
			<td>급여</td>
			<td>커미션</td>
			<td>부서번호</td>
			<td>부서이름</td>
			<td>부서위치</td>
			<td>관리</td>
		</tr>
		<%
			while(rs.next()){			
		%>
		<tr>
			<td><%= rs.getInt(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getString(3)%></td>
			<td><%= rs.getString(4)%></td>
			<td><%= rs.getDate(5)%></td>
			<td><%= rs.getInt(6)%></td>
			<td><%= rs.getInt(7)%></td>
			<td><%= rs.getInt(8)%></td>
			<td><%= rs.getString(9)%></td>
			<td><%= rs.getString(10)%></td>
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