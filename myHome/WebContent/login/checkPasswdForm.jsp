<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>비밀번호 찾기</h2>
		<hr color="green" width="300">
		<form name="f" action="checkId.jsp" method="post">
			<table class="outline">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" class="box" maxlength="6"> - 
					<input	type="password" name="ssn2" class="box" maxlength="7"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="비밀번호 찾기">
						<input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>