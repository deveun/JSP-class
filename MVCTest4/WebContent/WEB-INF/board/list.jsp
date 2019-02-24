<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="container">
	<table class="table table-sm table-bordered table-hover text-center">
		<tr>
			<th colspan=6 class="text-right"><button class="btn btn-sm btn-default" onClick="location.href='writeForm.jsp'">�۾���</button>
		</tr>
		<tr class="bg-default text-white">
			<th>��ȣ</th><th>����</th><th>�ۼ���</th>
			<th>�ۼ���</th><th>��ȸ��</th><th>IP</th>
		</tr>
		<c:forEach items="${list}" var = "dto">
		<tr>
			<td>${dto.getNum()}</td>
			<td>${dto.getSubject()}</td>
			<td>${dto.getWriter()}</td>
			<td>${dto.getReg_date()}</td>
			<td>${dto.getReadcount()}</td>
			<td>${dto.getIp()}</td>
		</tr>
		</c:forEach>
	</table>
</div>