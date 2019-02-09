<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*" %>
<%@ include file="page_top.jsp"%>
<jsp:useBean id="book_dao" class="book.BookDAO" />
<%
	//GET PARAMETER (없을때는 NULL 값을 가짐?)
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
			<td><button class="btn btn-sm btn-default">검색</button></td>
		</form>
	</tr></table>
	<table class="table table-sm table-bordered text-center">
		<tr>
			<th>도서명</th><th>지은이</th><th>출판사</th>
			<th>판매가</th><th>등록일</th><th colspan="2">수정/삭제</th>	
		</tr>
		<%
		List<BookDTO> list = null;
		//(1.전체)BookDTO 형식의 리스트를 만들어 DAO의 list함수 실행결과 값을 담음.
		if(search == null) {
			list = book_dao.listBook(); }
		else {
			list = book_dao.search_listBook(search); } 
		//(2.SEARCH)
		//간편화 For문
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
				<button class="btn btn-sm btn-default m-0" type="submit">확인</button>
			</td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0" type="button" onClick="page_list.jsp">취소</button>
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
				<!-- Button click시 current page 참조. GET -->
				<button class="btn btn-sm btn-default m-0" 
				onClick="location.href='page_list.jsp?edit_id=<%=dto.getBookid()%>'">수정</button>
			</td>
			<td class="align-middle p-0">
				<button class="btn btn-sm btn-default m-0"
				onClick="location.href='data_update.jsp?mode=delete&del_id=<%=dto.getBookid()%>'">삭제</button>
			</td>
		</tr>
		<%	
			}
		}

		%>
	</table>
</div>


<%@ include file="page_bottom.jsp"%>