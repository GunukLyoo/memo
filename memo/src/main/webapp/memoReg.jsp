<%@page import="memo.textFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memoReg</title>
</head>
<body>
<!-- 	<%
		textFile file = new textFile();
		boolean b;
		
		file.setTitle(request.getParameter("title"));
		file.setMemo(request.getParameter("memo"));
		b = file.saveFile();
		
		if(b==true) {
			out.println("<h3>저장 완료!");
		} else if(b==false) {
			out.println("<h3>저장 실패!");
		}
	%>
	 -->
	 
	<jsp:useBean id="memo" class="memo.textFile" />
	
	<jsp:setProperty property="*" name="memo"/>
	
	<% 
		try {
			String name = System.getProperty("user.name");
	    	System.out.println(name);
	    	
	    	String title = request.getParameter("title");
		    String path = "C:\\Users\\" + name + "\\Documents\\text\\";
		    System.out.println(path);
	    
	    	File dir = new File(path);
	    
	    	if(dir.exists()) {
	    	
	    	}else {
		    	dir.mkdir();
		    }
			OutputStream output = new FileOutputStream(path + title + ".txt");
			byte[] by = memo.getMemo().getBytes();//memo.getBytes();
			output.write(by);
			output.close();
			out.println("<h3>저장 완료!");
			//return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			out.println("<h3>저장 실패!");
			//return false;
		}
		/*
		if(c==true) {
			out.println("<h3>저장 완료!");
		} else if(c==false) {
			out.println("<h3>저장 실패!");
		}*/
	%>
	
	<jsp:forward page="main.jsp" />
</body>
</html>