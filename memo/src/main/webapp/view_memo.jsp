<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view memo</title>
</head>
<body>
	<header>
    	<div id="logo">
      		<a href="main.jsp"><h1>InterNote</h1></a>
    	</div>
  	</header>
	<main>

		<%
     	Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
		
		String sql = "select * from board where bno=" + request.getParameter("bno");
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
     	%>

		<table border="1">
     		<tr>
	     		<td>글 번호</td>
    	 		<td>글 제목</td>
     			<td>날짜</td>
     		</tr>
     		<%
	     		while(rs.next()){
    	 	%>
     		<tr>
     			<td><%= rs.getInt("bno") %></td>
     			<td><%= rs.getString("title") %></a></td>
     			<td><%= rs.getTimestamp("regdate") %></td>
     		</tr>
     		<%
     			}
     		%>
     		<tr>
     			<td><input type="button" id="change" onclick="location.href='Change_Memo.jsp?bno=<%=request.getParameter("bno")%>'" value="수정" /></td>
     			<td><input type="button" onclick="history.back()" value="취소" /></td>
     		</tr>
     </table>
		
	</main>

</body>
</html>
