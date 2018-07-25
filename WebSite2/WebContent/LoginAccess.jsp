
<%@page import="member.userinfo"%>
<%@page import="Services.GetIdService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" scope="session" class="member.MemberInfo" />
    <jsp:setProperty name="member" property="*" />
    
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
        <%
        GetIdService getIdService=GetIdService.getInstance();
        String id=member.getId();
        String pw=member.getPassword();
        String DBpw=getIdService.findPw(id);       
        
        System.out.println(pw);
        System.out.println(DBpw);
        System.out.println(pw.equals(DBpw));
        /*
        //Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = null;
		//Statement stmt = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String jdbcDriver="jdbc:apache:commons:dbcp:pool1";
 		String jdbcDriver="jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser="student";
		String dbPass="1234";  
		String sql="select id,pw from userinfo";
		String sql1="select pw from userinfo where id=?";
		
		String id=member.getId();
		String pw=member.getPassword();
		String isRem=request.getParameter("remember");
		
		try{
			conn=DriverManager.getConnection(jdbcDriver);
			//stmt=conn.createStatement();
			 //rs=stmt.executeQuery(sql);
			 pstmt=conn.prepareStatement(sql1);
			 pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(isRem!=null){
				Cookie cookie=new Cookie("id",id);
				response.addCookie(cookie);
		
			}else{
				Cookie cookie=new Cookie("id",null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}	
			*/
	%>

<%
		if(pw.equals(DBpw)){
			session.setAttribute("id", member.getId());
/* while(rs.next()){
if(id.equals(rs.getString(1)) && pw.equals(rs.getString(2))){
	session.setAttribute("id", member.getId()); */
	//response.sendRedirect("/index.jsp");
%>
<script>
	alert('로그인되셨습니다');
	location.href = '/index.jsp';   
</script>

<%}else{%>		

<script>
	alert('아이디 또는 패스워드가 틀립니다');
	location.href = '/LoginForm.jsp'; 
 </script>
		<%
		}
	

	 
	%>
	</body>
	</html>