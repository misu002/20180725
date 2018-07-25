<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
            width: 500px;
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
	String sqlmgr="select distinct m.empno,m.ename from emp e,emp m where e.mgr=m.empno order by m.ename";
	   String sqldeptno="select deptno,loc from dept order by loc";
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sqlmgr);
%>
<%@ include file="Menus.jsp" %>

	<form action="empInsert.jsp">
	<table border="1">
		<tr>
		<td>사원번호</td>
		<td><input type="number" name="empno"/></td>		
		</tr>
		<tr>
		<td>사원이름</td>
		<td><input type="text" name="ename"/></td>		
		</tr>
		<tr>
		<td>직급</td>
		<td><input type="text" name="job"/></td>		
		</tr>
		<tr>
		<td>매니저</td>
		<td>
		
		<select name="mgr" id="">
		<% while(rs.next()){ %>
		<option value="<%=rs.getInt(1)%>">(<%=rs.getInt(1)%>)<%=rs.getString(2)%></option>
		<%} %>
		</select>
		</td>		
		</tr>
		<tr>
		<td>입사일</td>
		<td><input type="date" name="hiredate"/></td>		
		</tr>
		<tr>
		<td>급여</td>
		<td><input type="number" name="sal"/></td>		
		</tr>
		<tr>
		<td>커미션</td>
		<td><input type="number" name="comm"/></td>		
		</tr>
		<tr>
		<td>부서번호</td>
		<td>
		<select name="deptno" id="">
		<%
		rs=stmt.executeQuery(sqldeptno);
		while(rs.next()){ %>
		<option value="<%=rs.getInt(1)%>">(<%=rs.getInt(1)%>)<%=rs.getString(2)%></option>
<%} %>
		</select>
		</td>		
		</tr>
		<tr>
		<td colspan="2" style="text-align : center"><input type="submit" value="입력"/></td>			
		</tr>
		
	
	</table>
	<%	
}catch(SQLException ex){
	out.println(ex.getMessage());
	ex.printStackTrace();
}finally{
	if(rs!=null) try{rs.close();}catch(SQLException ex){}
	if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
	if(conn!=null) try{conn.close();}catch(SQLException ex){}
}	
		%>
	
	
	</form>
</body>
</html>