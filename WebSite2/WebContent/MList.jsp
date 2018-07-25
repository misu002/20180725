<%@page import="Services.GetUserService"%>
<%@page import="Services.GetMessageListService"%>
<%@page import="member.Message"%>
<%@page import="member.MessageListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <%
    	String id=(String)session.getAttribute("id");
    	String pageNumberStr=request.getParameter("page");
    	int pageNumber=1;
    	if(pageNumberStr!=null){
    		pageNumber = Integer.parseInt(pageNumberStr);
    	}
    
    	GetMessageListService messageListService =GetMessageListService.getInstance();
    	MessageListView viewData = messageListService.getMessageList(pageNumber);
    	
    	GetUserService getUser=GetUserService.getInstance();    	
    	String name= getUser.getUserName(id);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GuestBook</title>
<style>
	div{
	
	}
	table{
		width: 
	}
</style>
</head>
<body>	

	<a href="/MWrite.jsp">방명록에 글남기기</a>
	<%
	if(viewData.isEmpty()){	
	%>
	<h1>등록된 메세지가 없습니다.</h1>
	<%}else{ %>
	<div>
	<table>
	<% for (Message message : viewData.getMessageList()) { %>
		<tr>
			<td>메시지 번호: <%=message.getId()%> <br /> 
			손님 이름: <%=message.getGuestName()%><br /> 
			메시지: <%=message.getMessage()%> <br /> 
			<a href="deleteMessage.jsp?messageId=<%=message.getId()%>&name=<%=name%>">[삭제하기]</a>
			</td>
		</tr>	
	<%}%>
	</table></div>
	<br>
	<% for (int i = 1 ; i <= viewData.getPageTotalCount() ; i++) { %>
	<a href="MList.jsp?page=<%= i %>">[<%= i %>]</a>	
	
	<% }}%>
</body>
</html>