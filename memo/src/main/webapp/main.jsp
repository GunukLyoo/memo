<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <header>
    <div id="logo">
      <a href="main.jsp"><h1>InterNote</h1></a>
    </div>
  </header>
  <main id="memo_list">
	 <h3>메모 목록</h3>
 
     <%
     	Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
		
		String sql = "select * from board order by bno desc";
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
     		<td><a href="view_memo.jsp?bno=<%= rs.getString("bno")%>"><%= rs.getString("title") %></a></td>
     		<td><%= rs.getTimestamp("regdate") %></td>
     	</tr>
     	<%
     		}
     	%>
     </table>
     
	<%pstmt.close(); %>
	
	 <a href="memo.jsp">메모 쓰기</a>
  </main>
</body>
</html>
