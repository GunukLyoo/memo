<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.file.Files" %>
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
		
		Path oldt = Paths.get(path + application.getAttribute("post_title"));
		Path newt = Paths.get(path + title);
		
		Files.move(oldt, newt);
		
		System.out.println(title);
		
		File file = new File(path+title);
		file.delete();
	%>
	
	<jsp:forward page="main.jsp" />
</body>
</html>