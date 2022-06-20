<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="memo.SQLset" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		SQLset sqls = new SQLset();
	
		sqls.SQLdelete(request.getParameter("bno"));
	%>
	
	<jsp:forward page="main.jsp"/>
</body>
</html>