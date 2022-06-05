<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  <main id="memo_list">
	 <h3 style="margin-left: 3%;">메모 목록</h3>
 
     <%
     	Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
		
		String sql = "select * from board order by bno desc";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

		
     %>
     
     <table>
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
     		<td><a href="view_memo.jsp?bno=<%= rs.getString("bno")%>"><%= rs.getString("title") %></a></td>
     		<td><%= rs.getTimestamp("regdate") %></td>
     	</tr>
     	<%
     		}
     	%>
     </table>
     
	<%pstmt.close(); %>
	
	 <a href="memo.jsp" style="margin-left: 94%;">메모 쓰기</a>
  </main>
</body>
</html>
