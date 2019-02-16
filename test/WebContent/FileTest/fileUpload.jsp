<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->
<html>
<head>
	<title>파일업로드TEST</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>파 일 업 로 드 TEST</h2>
		<hr color="green" width="300">
		<form name="f" action="fileUpload_ok.jsp" method="post" 
			enctype="multipart/form-data">
<!-- enctype="application/x-www-form-urlencoded" - default값 -->			
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>파일명</th>
					<td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="전송">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>