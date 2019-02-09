<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*" %>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />

<div class="container">
	<table class="table table-sm table-bordered text-center">
		<tr>
			<th colspan=6 class="text-right"><button class="btn btn-sm btn-default">글쓰기</button>
		</tr>
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th>
			<th>작성일</th><th>조회수</th><th>IP</th>
		</tr>
		<%
		List<BoardDBBean> list = null;
		list = board_dao.listBoard(); 
		for(BoardDBBean dto : list) { %>
		<tr>
			<td><%=dto.getNum()%></td>
			<td><%=dto.getSubject()%></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>
		<% }%>
	</table>
		

</div>


<%@ include file="../bottom.jsp"%>