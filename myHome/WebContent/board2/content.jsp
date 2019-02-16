<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board2.*"%>
<!-- content.jsp -->
<jsp:useBean id="dao" class="my.board2.BoardDataBean" />
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		BoardDBBean dto = dao.getBoard(Integer.parseInt(num), "content");
%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
	<b>글 내 용 보 기</b>
	<table border="1" width="90%">
		<tr>
			<th bgcolor="yellow" width="20%">글번호</th>
			<td align="center" width="30%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="20%">조회수</th>
			<td align="center" width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작성자</th>
			<td align="center" width="30%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="20%">작성일</th>
			<td align="center" width="30%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">글제목</th>
			<td width="30%" colspan="3"><%=dto.getSubject()%></td>
		</tr>
<%	if (dto.getFilesize()>0){ %>		
		<tr>
			<th bgcolor="yellow" width="20%">파일명</th>
			<td width="30%" colspan="3"><%=dto.getFilename()%></td>
		</tr>
<%	} %>		
		<tr>
			<th bgcolor="yellow" width="20%">글내용</th>
			<td width="30%" colspan="3">
				<textarea rows="5" cols="60"><%=dto.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" colspan="4" align="right">
				<input type="button" value="글수정"
		onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="글삭제"
		onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="글목록" 
												onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>


















