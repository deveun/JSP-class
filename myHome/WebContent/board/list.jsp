<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*" %>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />

<div class="container">
	<table class="table table-sm table-bordered table-hover text-center">
		<tr>
			<th colspan=6 class="text-right"><button class="btn btn-sm btn-default" onClick="location.href='writeForm.jsp'">글쓰기</button>
		</tr>
		<tr class="bg-default text-white">
			<th>번호</th><th>제목</th><th>작성자</th>
			<th>작성일</th><th>조회수</th><th>IP</th>
		</tr>
		<%
		
		//Pagination을 위한 작업
		String pageNum = request.getParameter("pageNum");
		if(pageNum ==null) {
			pageNum = "1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize +1;
		int endRow = startRow + pageSize -1;
		int dbRow = board_dao.getCount();
		if(endRow > dbRow ) endRow = dbRow;
		
		List<BoardDBBean> list = null;
		list = board_dao.listBoard(startRow, endRow); 
		for(BoardDBBean dto : list) { %>
		<!-- top.jsp에 isLogin session값이 들어있어서 바로 사용 가능. -->
		<tr onClick = "if(!<%=isLogin%>) {alert('로그인 후 이용가능합니다.');return;} else {location.href='content.jsp?num=<%=dto.getNum()%>'}">
			<td><%=dto.getNum()%></td>
			<td><%=dto.getSubject()%></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>
		<% }%>
	</table>
	
	<!-- PAGINATION -->
	<%
		if (dbRow>0){
			int pageBlock = 3;
			int dbPage = (dbRow-1) / pageSize + 1;
			int startPage = ((currentPage-1)/pageBlock*pageBlock)+1;
			//currentpage : 123 -> 0
			//currentPage : 456 -> 3
			//currentPage : 789 -> 6
			int endPage = startPage + pageBlock - 1;
			if (endPage>dbPage) endPage = dbPage;
			if (startPage>pageBlock){%>
				[<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">이전</a>]			
<%		}
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage < dbPage){%>
				[<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">다음</a>]			
<%		}
		}		
%>		

</div>


<%@ include file="../bottom.jsp"%>