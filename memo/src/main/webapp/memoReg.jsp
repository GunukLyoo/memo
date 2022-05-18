<%@page import="memo.textFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		boolean c;
	
		c = memo.saveFile();
		
		if(c==true) {
			out.println("<h3>저장 완료!");
		} else if(c==false) {
			out.println("<h3>저장 실패!");
		}
	%>
	
	<jsp:forward page="main.jsp" />
</body>
</html>