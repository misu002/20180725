<%@page import="member.userinfo"%>
<%@page import="java.util.List"%>
<%@page import="Services.GetUserService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
[
<%
	GetUserService getService=GetUserService.getInstance();
	List<userinfo> userlist=getService.getUser();
%>
<%
	for(int i=0;i<userlist.size();i++){
		String birth = userlist.get(i).getYear() + "-" + userlist.get(i).getMonth() + "-"
				+ userlist.get(i).getDay();
	%>	
{
	"id" : "<%=userlist.get(i).getId()%>",
	"pw" : "<%=userlist.get(i).getPw()%>",
	"name" : "<%=userlist.get(i).getName()%>",
	"birth" : "<%=birth%>",
	"gender" : "<%=userlist.get(i).getGender()%>",
	"phone" : "<%=userlist.get(i).getPhone()%>",
	"email" : "<%=userlist.get(i).getEmail()%>"
}

<%if(userlist.size()-1!=i){%>
,<%}} %>
]
