<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모장</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pinyon+Script&display=swap" rel="stylesheet">

<style type="text/css">
	.centered{display: table; margin-left: auto;margin-right: auto; margin-top: auto; margin-bottom: auto;}
	#logo{
		font-family: 'Pinyon Script', cursive;
	}
	table {
		margin-left: auto;
		margin-right: auto;
		width: 95%;
		border-top: 1px solid #444444;
    	border-collapse: collapse;
	}
</style>
</head>
<body>
	<header>
    	<div id="logo" class="centered">
      		<a href="main.jsp"><h1>InterNote</h1></a>
    	</div>
  	</header>
  	<main>
		<form action="memoReg.jsp" method="post">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="author" value="익명" required="required"></td>
					<td>비밀번호</td>
					<td><input type="password" name="password" value="0000" required="required"></td>
				</tr>
				<tr>
					<td>제목 </td>
					<td colspan="3"> <input type="text" name="title" required="required"></td>
				</tr>
				<tr>
					<td>내용 </td>
					<td colspan="3"> <input type="text"  name="content" required="required"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="저장"></td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>