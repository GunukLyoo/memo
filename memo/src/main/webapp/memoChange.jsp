<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
	
		sqls.SQLupdate((String)application.getAttribute("bno"), request.getParameter("title"), request.getParameter("content"), request.getParameter("author"), request.getParameter("password"));	
	
	%>
	
	<jsp:forward page="main.jsp" />
</body>
</html>