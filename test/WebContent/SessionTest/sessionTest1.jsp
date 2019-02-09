<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>sessionTest</title>
</head>
<body>
	<h2 align="center">Session Test</h2>
	<form name="f" action="result.jsp" method="post">
		아이디: <input type="text" name = "id"> <br>
		비밀번호: <input type="password" name = "pwd"><br>
		<input type="submit" value = "로그인">
		<input type="reset" value = "다시입력">
	</form>
</body>
</html>