<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>JSTL 예제 1</title>
</head>
<body>  
	browser변수값 설정
	<c:set var="browser" value="${header['User-Agent']}"/><br>
	설정후 browser의 값 : 
	<c:out value="${browser}"/><br>
	<c:remove var="browser" />
	삭제후 browser의 값 : <c:out value="${browser}"/><br>
</body>
</html>