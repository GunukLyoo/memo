<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view memo</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap" rel="stylesheet">


<style type="text/css">
	.centered{display: table; margin-left: auto;margin-right: auto; margin-top: auto; margin-bottom: auto;}
	#logo{
		font-family: 'Pinyon Script', cursive;
	}
	table {
		margin-left: auto;
		margin-right: auto;
		width: 95%;
		border-top: 1px solid #444444;
    	border-collapse: collapse;
	}
	th, td {
    	border-bottom: 1px solid #444444;
    	padding: 10px;
  	}
</style>
</head>
<body>
	<header>
    	<div id="logo" class="centered">
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
		rs.next();
     	%>

		<table border="1" class="centered">
     		<tr>
	     		<td>글 번호</td>
    	 		<td><%= rs.getInt("bno") %></td>
     		</tr>
     		<tr>
     			<td>글 제목</td>
     			<td><%= rs.getString("title") %></td>
     			<td>날짜</td>
     			<td><%= rs.getTimestamp("regdate") %></td>
     		</tr>
     		<tr>
     			<td colspan="1">글 내용</td>
     			<td colspan="3"><%= rs.getString("content") %></td>
     		</tr>
     		<tr>
     			<td colspan="4"><input type="button" onclick="history.back()" value="취소" />
     			<input type="button" id="change" onclick="location.href='Change_Memo.jsp?bno=<%=request.getParameter("bno")%>'" value="수정" />
  				<input type="button" onclick="location.href='delete_memo.jsp?bno=<%=request.getParameter("bno")%>'" value="삭제"></td>
     		</tr>
     </table>
     
     <%pstmt.close(); %>
		
	</main>

</body>
</html>
