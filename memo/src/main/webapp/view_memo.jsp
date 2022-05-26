<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view memo</title>
</head>
<body>
	<header>
    	<div id="logo">
      		<a href="main.jsp"><h1>InterNote</h1></a>
    	</div>
  	</header>
	<main>
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
		%>
		<h1><%=title.replace(".txt", "") %></h1>
		<p><%=txt %></p>

		<input type="button" id="change" onclick="location.href='Change_Memo.jsp?title=<%=title%>'" value="수정" />
		<input type="button" onclick="history.back()" value="취소" />
	</main>

</body>
</html>
