<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
        body {
            background: lightgray;
            font-family: 'Markazi Text', serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

         #links{
            width: 1500px;
            margin: 20px auto;
        }     
        
        a{
            margin-right: 20px;
            text-decoration: none;
            color: black;            
            padding-left: 10px;
        }

</style>
</head>
<body>
    <div id="links">
    <%if(session.getAttribute("id")==null){ %>
    <a href="/LoginForm.jsp">로그인</a>
    <a href="/NaverAgree.jsp">회원가입</a>
    <a href="/MList.jsp">방명록</a>
    <%}else if(session.getAttribute("id").equals("misu002")){ %>
    <a href="/Logout.jsp">로그아웃</a>
    <a href="/mypage.jsp">마이페이지</a>
    <a href="/MList.jsp">방명록</a>
    <a href="/userinfolist.jsp">회원리스트</a>
    <a href="/empList.jsp">사원리스트</a>
    <a href="/empInsertForm.jsp">사원등록</a>
    <%}else{ %>
       	<a href="/Logout.jsp">로그아웃</a>
   		<a href="/mypage.jsp">마이페이지</a>
   		<a href="/MList.jsp">방명록</a>
   		<%} %>
        </div>
</body>
</html>