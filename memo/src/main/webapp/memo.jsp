<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모장</title>
</head>
<body>
	<form action="memoReg.jsp" method="post">
		제목: <input type="text" name="title"><br>
		내용: <input type="text" style="width:200px; height:50px" name="memo"><br>
		<input type="submit" value="저장">
	</form>
</body>
</html>