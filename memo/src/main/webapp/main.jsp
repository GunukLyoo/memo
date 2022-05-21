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

 	<%
		String name = System.getProperty("user.name");
    	String path = "C:\\Users\\" + name + "\\Documents\\text\\";
    	
		File dir = new File(path);
		File files[] = dir.listFiles();
		
		for(int i = 0 ; i < files.length ; i++){%>
			<%=i+1 %> : <%=files[i] %> <br>
	<%	
		}
	%>

	<a href="memo.jsp">메모 쓰기</a>
</body>
</html>