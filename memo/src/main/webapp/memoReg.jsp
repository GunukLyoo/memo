<%@page import="memo.textFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="memo.SQLset" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memoReg</title>
</head>
<body> 
	<%
		request.setCharacterEncoding("UTF-8");
	    SQLset sqls = new SQLset();
		
		sqls.SQLreg(request.getParameter("title"), request.getParameter("content"), request.getParameter("author"), request.getParameter("password"));
	%>
	 
	<jsp:forward page="main.jsp" />
</body>
</html>