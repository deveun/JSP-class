<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*" %>
<%@ include file="page_top.jsp"%>
<jsp:useBean id="book_dao" class="book.BookDAO" />
<%
	//GET PARAMETER (�������� NULL ���� ����?)
	request.setCharacterEncoding("EUC-KR");
	String edit = request.getParameter("edit_id");
	int edit_id = 0;
	if(edit != null) {
		edit_id = Integer.parseInt((String)edit); }
	//POST PARAMETER (SEARCH)
	String search = request.getParameter("search");
%>

<div class="container">
	<table class="mx-auto"><tr>
		<form name="f1" action="page_list.jsp" method="POST">
			<td width="70%"><input class="form-control form-control-sm" name="search"></td>
			<td><button class="btn btn-sm btn-default">�˻�</button></td>
		</form>
	</tr></table>
	<table class="table table-sm table-bordered text-center">
		<tr>
			<th>������</th><th>������</th><th>���ǻ�</th>
			<th>�ǸŰ�</th><th>�����</th><th colspan="2">����/����</th>	
		</tr>
		<%
		List<BookDTO> list = null;
		//(1.��ü)BookDTO ������ ����Ʈ�� ����� DAO�� list�Լ� ������ ���� ����.
		if(search == null) {
			list = book_dao.listBook(); }
		else {
			list = book_dao.search_listBook(search); } 
		//(2.SEARCH)
		//����ȭ For��
		for (BookDTO dto : list) {
			//EDIT MODE (SELECTED ID)
			if(edit_id == dto.getBookid())
			{
		%>
		<tr>
		<form name="f" action="data_update.jsp" method="POST">
			<td><input name= "bookname" class="form-control form-control-sm" size="5"></td>
			<td><input name= "writer" class="form-control form-control-sm" size="5"></td>
			<td><input name= "publisher" class="form-control form-control-sm" size="5"></td>
			<td><input name= "price" class="form-control form-control-sm" type="number" size="5"></td>
			<input name= "bookid" value=<%=dto.getBookid()%> hidden>
			<input name= "mode" value="edit" hidden> 
			<td><%=dto.getIndate()%></td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0" type="submit">Ȯ��</button>
			</td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0" type="button" onClick="page_list.jsp">���</button>
			</td>
			</form>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td><%=dto.getBookname()%></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getPublisher()%></td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getIndate()%></td>
			<td class="align-middle p-0">
				<!-- Button click�� current page ����. GET -->
				<button class="btn btn-sm btn-default m-0" 
				onClick="location.href='page_list.jsp?edit_id=<%=dto.getBookid()%>'">����</button>
			</td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0"
				onClick="location.href='data_update.jsp?mode=delete&del_id=<%=dto.getBookid()%>'">����</button>
			</td>
		</tr>
		<%	
			}
		}

		%>
	</table>
</div>


<%@ include file="page_bottom.jsp"%>