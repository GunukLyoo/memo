<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>메모 목록</h3>
 	<%
		String name = System.getProperty("user.name");
    	String path = "C:\\Users\\" + name + "\\Documents\\text\\";
    	
		File dir = new File(path);
		File files[] = dir.listFiles();
		
		for(int i = 0 ; i < files.length ; i++){
			String str = files[i].getName();
			//String[] array = str.split("");%>
			<%=i+1 %> : <%=str %> <br>
	<%	
		}
	%>

	<a href="memo.jsp">메모 쓰기</a>
</body>
</html>