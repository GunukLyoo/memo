<%@page import="memo.textFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memoReg</title>
</head>
<body> 
	<%
	    request.setCharacterEncoding("UTF-8");
		//1.JDBC Driver 로딩하기
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.DB 서버 접속하기
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
		
		int num=0;
		String sql="select max(bno) from board";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();

		if(rs.next()){
			num=rs.getInt("max(bno)")+1;	
		}
	
		Timestamp reg_date=new Timestamp(System.currentTimeMillis());
		
		String pwd = request.getParameter("password");
		String encodepwd = Base64.getEncoder().encodeToString(pwd.getBytes());
		System.out.println(encodepwd);
		
		sql = "insert into board (BNO, TITLE, CONTENT, REGDATE, AUTHOR, PWD) values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		pstmt.setString(2, request.getParameter("title"));
		pstmt.setString(3, request.getParameter("memo"));
		pstmt.setTimestamp(4, reg_date);
		pstmt.setString(5, request.getParameter("author"));
		pstmt.setString(6, encodepwd);
		
		pstmt.executeUpdate();
		
		pstmt.close();
	%>
	 
	<jsp:forward page="main.jsp" />
</body>
</html>