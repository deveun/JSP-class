<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, student.*" %>    
<!-- list.jsp -->
<%
		List<StudentDTO> list = (List)request.getAttribute("studentList");
%>
<html>
<head>
	<title>�л����</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� ��</h2>
		<a href="student.do?command=start">ó������</a>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th width="100">���̵�</th>
				<th width="150">�л���</th>
				<th width="250">�б޸�</th>
			</tr>
			<!-- DB�� �ڷḦ �ҷ��ͼ� ���⿡ ��½�Ű�� -->
<%		for(StudentDTO dto : list){%>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
			</tr>	
<%		}%>			
		</table>
	</div>
</body>
</html>













