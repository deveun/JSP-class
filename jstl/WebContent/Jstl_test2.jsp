<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>JSTL 예제 2</title>
</head>
<body>
	<c:set var="country" value="${'rusia'}"/>
	<c:if test="${country != null }">
		국가명 : <c:out value="${country}"/>
	</c:if>
	<br>
	<br>
	<c:choose>
		<c:when test="${country=='korea'}">
			<c:out value="${country}"/>의 겨울은 춥다
		</c:when>
		<c:when test="${country=='canada'}">
			<c:out value="${country}"/>의 겨울은 더욱 더 춥다
		</c:when>
		<c:otherwise>
			그외의 나라는 알수가 없습니다
		</c:otherwise>
	</c:choose>
</body>
</html>








