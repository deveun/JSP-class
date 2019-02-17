<!-- COMMAND PATTERN -->
<!-- 여러개의 Form이 있어서 Servlet에서 많은 페이지의 정보를 받아서 처리하는 역할을
수행할 때, request에서 받는 값이 어디에서 온 값인지를 판단하기 위해, Form에 hidden으로 
command를 전달하고, 그 값에 따라서 처리 방법을 다르게 한다.  -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>학생관리</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 등 록 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="student.do" method="post">
		<input type="hidden" name="command" value="insert" />
			<table border="1">
				<tr>
					<td>아이디 : <input type="text" name="id"><br>
					학생명 : <input type="text" name="name"><br>
					학급명 : <input type="text" name="cname"><br>
					<input type="submit" value="입력">
					<input type="reset" value="다시입력"></td>
				</tr>			
			</table>
		</form>
		<hr color="green" width="300">
		<h2>학 생 삭 제 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="student.do" method="post">
		<input type="hidden" name="command" value="delete" />
			<table border="1">
				<tr>
					<td>아이디 : <input type="text" name="id">
					<input type="submit" value="삭제"></td>
				</tr>			
			</table>
		</form>
		<hr color="green" width="300">
		<h2>학 생 찾 기 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="student.do" method="post">
		<input type="hidden" name="command" value="find" />
			<table border="1">
				<tr>
					<td>학생명 : <input type="text" name="name">
					<input type="submit" value="찾기"></td>
				</tr>			
			</table>
		</form>
		<hr color="green" width="300">
		<h2>학 생 목 록 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="student.do" method="post">
		<input type="hidden" name="command" value="list" />
			<table border="1">
				<tr>
					<td>
						<input type="submit" value="학생목록페이지로 이동">
					</td>
				</tr>			
			</table>
		</form>
	</div>
</body>
</html>






