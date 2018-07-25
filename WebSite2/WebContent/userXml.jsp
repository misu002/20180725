<%@page import="member.userinfo"%>
<%@page import="java.util.List"%>
<%@page import="Services.GetUserService"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<?xml version="1.0" encoding="UTF-8"?>

<users>
<%
	GetUserService getService=GetUserService.getInstance();
	List<userinfo> userlist=getService.getUser();
%>

<%
	for(int i=0;i<userlist.size();i++){
		String birth = userlist.get(i).getYear() + "-" + userlist.get(i).getMonth() + "-"
				+ userlist.get(i).getDay();
	%>
<user>
	<id><%=userlist.get(i).getId()%></id>
	<pw><%=userlist.get(i).getPw()%></pw>
	<name><%=userlist.get(i).getName()%></name>
	<birth><%=birth%></birth>
	<gender><%=userlist.get(i).getGender()%></gender>
	<phone><%=userlist.get(i).getPhone()%></phone>
	<email><%=userlist.get(i).getEmail()%></email>
</user>

<%} %>


</users>
