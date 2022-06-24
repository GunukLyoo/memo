<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="memo.SQLset" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Memo</title>
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
			SQLset sqls = new SQLset();
		
			String bno = request.getParameter("bno");
			
			ResultSet rs = sqls.SQLselect(bno);
			application.setAttribute("bno", bno);
			rs.next();
			%>
		<form action="memoChange.jsp" method="post">
			<table border="1">
	     		<tr>     				     	
    	 			<td>글 제목</td>
     				<td colspan="3"><input type="text" name="title" value=<%= rs.getString("title") %> required="required"></td>
    	 		</tr>
	     		<tr>
     				<td>작성자</td>
     				<td><input type="text" name="author" value=<%= rs.getString("author") %> required="required"></td>
     				<td>비밀번호</td>
					<td><input type="password" name="password" required="required"></td>
     			</tr>
     			<tr>
    	 			<td>글 내용</td>
	     			<td colspan="3"><input type="text" name="content" value=<%= rs.getString("content") %> required="required"></td>
     			</tr>
     			<tr>
     				<td colspan="4">
     					<input type="submit" value="저장" />
     					<input type="button" onclick="location.href='main.jsp'" value="취소" />
     				</td>
	     		</tr>
     		</table>
		</form>
     	<%pstmt.close(); %>
     </main>
</body>
</html>