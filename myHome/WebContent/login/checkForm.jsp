<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//GET PARAMETER
	request.setCharacterEncoding("EUC-KR");
	String mode = request.getParameter("mode");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<% if (mode.equals("id")) {%>
		<h2>���̵� ã��</h2><%}
		else {%>
		<h2>��й�ȣ ã��</h2><%}%>
		<hr color="green" width="300">
		<form name="f" action="check.jsp" method="post">
			<table class="outline">
				<%if (mode.equals("passwd")) { %>
				<tr>
					<th>���̵�</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>
				<%} %>
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td><input type="text" name="ssn1" class="box" maxlength="6">
						- <input type="password" name="ssn2" class="box" maxlength="7"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="���̵� ã��"> <input type="reset" value="���"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>