<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*" %>
<%@ include file="page_top.jsp"%>
<jsp:useBean id="book_dao" class="book.BookDAO" />

<div class="container">
	<table class="table table-sm table-bordered text-center">
		<tr>
			<th>������</th><th>������</th><th>���ǻ�</th>
			<th>�ǸŰ�</th><th>�����</th><th colspan="2">����/����</th>	
		</tr>
		<%
		//BookDTO ������ ����Ʈ�� ����� DAO�� list�Լ� ������ ���� ����.
		List<BookDTO> list = book_dao.listBook();
		//����ȭ For��
		for (BookDTO dto : list) {
		%>
		<tr>
			<td><%=dto.getBookname() %></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getPublisher() %></td>
			<td><%=dto.getPrice() %></td>
			<td><%=dto.getIndate() %></td>
			<td class="align-middle p-0"><button class="btn btn-sm btn-default m-0">����</button></td>
			<td class="align-middle p-0"><button class="btn btn-sm btn-default m-0">����</button></td>
		</tr>
		<%	
		}
		%>
	</table>
</div>


<%@ include file="page_bottom.jsp"%>