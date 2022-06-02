<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모장</title>
<style type="text/css">
	.centered{display: table; margin-left: auto;margin-right: auto; margin-top: auto; margin-bottom: auto;}
</style>
</head>
<body>
	<form action="memoReg.jsp" method="post" class="centered">
		<table border="1">
			<tr><td>제목 </td><td> <input type="text" name="title"></td></tr>
			<tr><td>내용 </td><td> <input type="text" style="width:200px; height:50px" name="memo"></td></tr>
			<tr><td colspan="2"><input type="submit" value="저장"></td></tr>
		</table>
	</form>
</body>
</html>