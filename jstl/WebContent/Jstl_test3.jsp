<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>JSTL 예제 3</title>
</head>
<body>
	<c:set var="sum" value="0"/>
	<c:forEach var="k" begin="1" end="100">
		<c:set var="sum" value="${sum+k}"/>
	</c:forEach>
	1~100까지의 합 : ${sum}
</body>
</html>