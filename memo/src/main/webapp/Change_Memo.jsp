<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Memo</title>
</head>
<body>
	<%
		String name = System.getProperty("user.name");
		String title = request.getParameter("title");
		String path = "C:\\Users\\" + name + "\\Documents\\text\\" + title;
		String line = "";
		String txt = "";
		
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);

		while((line = br.readLine())!=null){
			txt = txt + line;
		}
		
		application.setAttribute("post_title", title);
		
		fr.close();
		br.close();
	%>
	
	<form action="memoChange.jsp">
		제목: <input type="text" name="title" value=<%=title.replace(".txt", "") %>><br>
		내용: <input type="text" style="width:200px; height:50px" name="memo" value=<%=txt %>><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>