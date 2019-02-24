<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<tr>
		<c:forEach var="c" begin="2" end="9">
		<th>${c}</th>
		</c:forEach>
	</tr>
	<c:forEach var = "r" begin="1" end="9">
		<tr>
			<c:forEach var="c" begin="2" end="9">
			<td>${c} X ${r} = ${c*r}</td>
			</c:forEach>
		</tr>
	</c:forEach>
	</table>
</body>
</html>