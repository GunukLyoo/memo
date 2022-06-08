<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Memo</title>
<style type="text/css">
	.centered{display: table; margin-left: auto;margin-right: auto; margin-top: auto; margin-bottom: auto;}
</style>
</head>
<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String bno = request.getParameter("bno");
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
		String sql = "select * from board where bno=" + bno;
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		application.setAttribute("bno", bno);
		rs.next();
		%>
	<form action="memoChange.jsp" method="post" class="centered">
		<table border="1">
     		<tr>     				     	
    	 		<td>글 제목</td>
     			<td><input type="text" name="title" value=<%= rs.getString("title") %>></td>
     		</tr>
     		<tr>
     			<td>작성자</td>
     			<td><input type="text" name="author" value=<%= rs.getString("author") %>></td>
     		</tr>
     		<tr>
     			<td>글 내용</td>
     			<td><input type="text" name="content" value=<%= rs.getString("content") %>></td>
     		</tr>
     		<tr>
     			<td><input type="submit" value="저장" /></td>
     			<td><input type="button" onclick="location.href='main.jsp'" value="취소" /></td>
     		</tr>
     	</table>
	</form>
     <%pstmt.close(); %>
</body>
</html>