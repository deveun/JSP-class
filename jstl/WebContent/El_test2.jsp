<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>ǥ������2</title>
</head>
<body>
	<form name="f" method="post">
		�̸� : <input type="text" name="name">
		<input type="submit" value="Ȯ��">
	</form>
	<hr color="red">
	<%	request.setCharacterEncoding("EUC-KR"); %>
	<h3>�Է��Ͻ� �̸��� ${param.name}</h3>
</body>
</html>