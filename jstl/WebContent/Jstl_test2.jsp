<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>JSTL ���� 2</title>
</head>
<body>
	<c:set var="country" value="${'rusia'}"/>
	<c:if test="${country != null }">
		������ : <c:out value="${country}"/>
	</c:if>
	<br>
	<br>
	<c:choose>
		<c:when test="${country=='korea'}">
			<c:out value="${country}"/>�� �ܿ��� ���
		</c:when>
		<c:when test="${country=='canada'}">
			<c:out value="${country}"/>�� �ܿ��� ���� �� ���
		</c:when>
		<c:otherwise>
			�׿��� ����� �˼��� �����ϴ�
		</c:otherwise>
	</c:choose>
</body>
</html>








