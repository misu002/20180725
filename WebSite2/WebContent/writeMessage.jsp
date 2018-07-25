<%@page import="Services.WriteMessageService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GuestBook</title>
<%
	//1.사용자 입력 데이터 받기
	//2. 요구사항을 처리할 서비스 객체 생성 (받아오기)
	//3.처리요청 (service.write)
	//4.결과 받아서 사용자에게 보여줄 응답 view를 작성
	
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="message" class="member.Message"/>
<jsp:setProperty property="*" name="message"/>

<%
int resultCnt=0;
	WriteMessageService service=WriteMessageService.getInstance();
	resultCnt=service.write(message);
%>


</head>
<body>

	<%
		if(resultCnt>0){	%>
		<h1>방명록 메세지가 작성되었습니다. <br /> <a href="MList.jsp">리스트보기</a></h1>
	<%}else{ %>
		<h1>방명록 메세지가 작성되지 않았습니다. <br /> <a href="MList.jsp">리스트보기</a></h1>
	<%} %>
	<form action="deleteMessage.jsp" method="post">
		<input type="hidden" name="messageId"
			value="<%=request.getParameter("messageId")%>" /> 
			메시지를 삭제하시려면 암호를	입력하세요:<br /> 암호: <input type="password" name="password" /> <br /> 
			<input type="submit" value="메시지 삭제하기" />
	</form>
</body>
</html>