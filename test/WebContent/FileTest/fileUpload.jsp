<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->
<html>
<head>
	<title>���Ͼ��ε�TEST</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� TEST</h2>
		<hr color="green" width="300">
		<form name="f" action="fileUpload_ok.jsp" method="post" 
			enctype="multipart/form-data">
<!-- enctype="application/x-www-form-urlencoded" - default�� -->			
			<table border="1">
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>���ϸ�</th>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="����">
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>