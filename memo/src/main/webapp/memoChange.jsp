<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page improt="java.nio.file.Path" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="memo" class="memo.textFile"/>
	<jsp:setProperty property="*" name="memo"/>
	
	<%
		String name = System.getProperty("user.name");
		String title = request.getParameter("title");
		String path = "C:\\Users\\" + name + "\\Documents\\text\\";
		
		OutputStream output = new FileOutputStream(path + title + ".txt");
		byte[] by = memo.getMemo().getBytes();//memo.getBytes();
		output.write(by);
		output.close();
		
		Path old = Paths.get(path + application.getAttribute("post_title"));
	%>
	
	<jsp:forward page="main.jsp" />
</body>
</html>