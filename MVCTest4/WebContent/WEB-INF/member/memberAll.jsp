<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, member.*" %>    
<%@ include file="top.jsp" %>
<link rel="stylesheet" type="text/css" href="style.css">
<%	String mode = request.getParameter("mode"); %>
<div align="center">
	<hr color="green" width="300">
<%	if (mode == null){ %>	
	<h2>ȸ �� �� �� �� ��</h2>
<%	}else { %>
	<h2>ȸ �� ã ��</h2>
	<form name="f" method="post" action="memberAll.mem?mode=find">
		<select name="search">
			<option value="id">���̵�</option>
			<option value="name">�̸�</option>
		</select>
		<input type="text" name="searchString" class="box">
		<input type="submit" value="ã��">
	</form>
<%	} %>	
	<hr color="green" width="300">
	<table width="600" class="outline">
		<tr>
			<th class="m3">��ȣ</th>
			<th class="m3">�̸�</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">����/����</th>
		</tr>
<%	List<MemberDTO> list = (List)request.getAttribute("list");
 
		for(MemberDTO dto : list){%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td>
			 	<a href="member_update.mem?no=<%=dto.getNo()%>">����</a> |
				<a href="member_delete.mem?no=<%=dto.getNo()%>">����</a>
			</td>
		</tr>
<%	} %>				
	</table>
</div>
<%@ include file="bottom.jsp"%>








