<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*" %>
<%@ include file="page_top.jsp"%>
<%

	List<BookDTO> list = (List)request.getAttribute("list");
	//GET PARAMETER (�������� NULL ���� ����?)
	request.setCharacterEncoding("EUC-KR");
	String sel = request.getParameter("sel_id");
	int sel_id = 0;
	if(sel != null) {
		sel_id = Integer.parseInt((String)sel); }
%>

<div class="container">
	<table class="mx-auto"><tr>
		<form name="f1" action="book.do" method="POST">
			<input hidden name = "command" value = "find">
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
		//����ȭ For��
		for (BookDTO dto : list) {
			//EDIT MODE (SELECTED ID)
			if(sel_id == dto.getBookid())
			{
		%>
		<tr>
		<form name="f" action="book.do" method="POST">
			<td><input name= "bookname" class="form-control form-control-sm" size="5"></td>
			<td><input name= "writer" class="form-control form-control-sm" size="5"></td>
			<td><input name= "publisher" class="form-control form-control-sm" size="5"></td>
			<td><input name= "price" class="form-control form-control-sm" type="number" size="5"></td>
			<input name= "bookid" value=<%=dto.getBookid()%> hidden>
			<input name= "command" value="edit" hidden> 
			<td><%=dto.getIndate()%></td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0" type="submit">Ȯ��</button>
			</td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0" type="button" onClick="location.href='book.do?command=list'">���</button>
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
				onClick="location.href='book.do?command=select&sel_id=<%=dto.getBookid()%>'">����</button>
			</td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0"
				onClick="location.href='book.do?command=delete&del_id=<%=dto.getBookid()%>'">����</button>
			</td>
		</tr>
		<%	
			}
		}

		%>
	</table>
</div>


<%@ include file="page_bottom.jsp"%>