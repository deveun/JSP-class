<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>표현예제2</title>
</head>
<body>
	<form name="f" method="post">
		이름 : <input type="text" name="name">
		<input type="submit" value="확인">
	</form>
	<hr color="red">
	<%	request.setCharacterEncoding("EUC-KR"); %>
	<h3>입력하신 이름은 ${param.name}</h3>
</body>
</html>