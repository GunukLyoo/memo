<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:system";
		Connection conn = DriverManager.getConnection(url, "c##memo", "memo1234");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		String sql = "delete from board where bno="+request.getParameter("bno");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		
		sql="select * from board where bno>"+request.getParameter("bno");
		
		pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		sql = "update board set bno=? where bno=?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql);
		
		while(rs.next()){
			pstmt1.setInt(1, bno);
			pstmt1.setInt(2, bno+1);
			pstmt1.executeUpdate();
			pstmt1.clearParameters();
			bno++;
		}
		
		pstmt.close();
		pstmt1.close();
	%>
	
	<jsp:forward page="main.jsp"/>
</body>
</html>