<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>JSTL ���� 1</title>
</head>
<body>  
	browser������ ����
	<c:set var="browser" value="${header['User-Agent']}"/><br>
	������ browser�� �� : 
	<c:out value="${browser}"/><br>
	<c:remove var="browser" />
	������ browser�� �� : <c:out value="${browser}"/><br>
</body>
</html>