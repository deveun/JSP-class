<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, book.*" %>
<%@ include file="page_top.jsp"%>
<jsp:useBean id="book_dao" class="book.BookDAO" />

<div class="container">
	<table class="table table-sm table-bordered text-center">
		<tr>
			<th>도서명</th><th>지은이</th><th>출판사</th>
			<th>판매가</th><th>등록일</th><th colspan="2">수정/삭제</th>	
		</tr>
		<%
		//BookDTO 형식의 리스트를 만들어 DAO의 list함수 실행결과 값을 담음.
		List<BookDTO> list = book_dao.listBook();
		//간편화 For문
		for (BookDTO dto : list) {
		%>
		<tr>
			<td><%=dto.getBookname() %></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getPublisher() %></td>
			<td><%=dto.getPrice() %></td>
			<td><%=dto.getIndate() %></td>
			<td class="align-middle p-0"><button class="btn btn-sm btn-default m-0">수정</button></td>
			<td class="align-middle p-0"><button class="btn btn-sm btn-default m-0">삭제</button></td>
		</tr>
		<%	
		}
		%>
	</table>
</div>


<%@ include file="page_bottom.jsp"%>