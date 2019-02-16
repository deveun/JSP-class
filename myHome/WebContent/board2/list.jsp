<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board2.*" %>    
<!-- list.jsp -->
<jsp:useBean id="dao" class="my.board2.BoardDataBean" />
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
	<b>�ڷ�� �Խ���</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="40%">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
			<th>����</th>
		</tr>
		<!-- DB�� �����ؼ� ����Ÿ�� �޾ƿ� ����ϱ� -->
<%
 		List<BoardDBBean> listBoard = dao.listBoard();
		if (listBoard == null || listBoard.size()==0){%>
		<tr>
			<td colspan="7">�Խõ� ���� �����ϴ�.</td>
		</tr>		
<%	}else {
			for(BoardDBBean dto : listBoard){%>
		<tr>
			<td><%=dto.getNum()%></td>
			<td>
				<a href="content.jsp?num=<%=dto.getNum()%>">
					<%=dto.getSubject()%>
				</a>
<%	if (dto.getReadcount()>10){ %>
			<img src="../img/hot.gif">
<%	}%>				
			</td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
			<td>
<%	if (dto.getFilesize()>0){ %>
				<img src="../img/folder.gif">
<%	}else { %>
				<img src="../img/level.gif">
<%	} %>			
			</td>
		</tr>		
<%		}
		}%>
	</table>   
</div>
<%@ include file="../bottom.jsp"%>












