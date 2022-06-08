<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:system";
	Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
	
	String sql = "update board set title='"+request.getParameter("title")+"', content='"+request.getParameter("content") + "' where bno="+application.getAttribute("bno");
	
	System.out.println(sql);
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
	pstmt.clearParameters();
	
	sql = "update board set author='"+ request.getParameter("author") + "' where bno="+application.getAttribute("bno");
	
	System.out.println(sql);
	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	pstmt.close();
	%>
	
	<jsp:forward page="main.jsp" />
</body>
</html>