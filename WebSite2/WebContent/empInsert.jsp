<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%
    request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id="emp_info" class="member.emp_info"/>
    <jsp:setProperty name="emp_info" property="*"/>
    
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
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	int cnt=0;
	try{
	String jdbcDriver="jdbc:apache:commons:dbcp:pool1";
	conn=DriverManager.getConnection(jdbcDriver);
	String sql="insert into emp values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setInt(1, emp_info.getEmpno());
	pstmt.setString(2, emp_info.getEname());
	pstmt.setString(3, emp_info.getJob());
	pstmt.setInt(4,emp_info.getMgr());
	pstmt.setString(5,emp_info.getHiredate());
	pstmt.setInt(6, emp_info.getSal());
	pstmt.setInt(7,emp_info.getComm());
	pstmt.setInt(8, emp_info.getDeptno());
	cnt=pstmt.executeUpdate();
	
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		if(conn!=null) try{conn.close();}catch(SQLException ex){}
	}	 
   %>	
   
   <%@ include file="Menus.jsp" %>
	<%=cnt %>행이 입력되었습니다
	<a href="/empList.jsp">입력 확인</a>
</body>
</html>