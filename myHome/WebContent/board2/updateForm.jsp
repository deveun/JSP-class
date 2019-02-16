<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board2.*"%>
<!-- updateForm.jsp -->
<jsp:useBean id="dao" class="my.board2.BoardDataBean" />   
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
 
		BoardDBBean dto = dao.getBoard(Integer.parseInt(num), "update");
%>
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("������ �Է��� �ּ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("������ �Է��� �ּ���!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
	<form name="f" action="updatePro.jsp" method="post"
			enctype="multipart/form-data"	onsubmit="return check()">
	<input type="hidden" name="num" value="<%=num%>" />												
	<table border="1" width="60%">
		<tr bgcolor="yellow">
			<th colspan="2">�� �� ��</th>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><input type="text" name="writer" class="box" 
									value="<%=dto.getWriter()%>"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><input type="text" name="subject" class="box" size="35"
									value="<%=dto.getSubject()%>"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">Email</th>
			<td><input type="text" name="email" class="box" size="35"
									value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td>
				<textarea name="content" rows="10" cols="35" class="box"><%=dto.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">���ϸ�</th>
			<td>
<%		if (dto.getFilesize()>0){ %>
				<%=dto.getFilename()%>	
<%		} %>			
				<input type="file" name="filename">
				<input type="hidden" name="filename2" 
									value="<%=dto.getFilename()%>"/>
				<input type="hidden" name="filesize"
									value="<%=dto.getFilesize()%>" />									
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">��й�ȣ</th>
			<td><input type="password" name="passwd" class="box"></td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center" colspan="2">
				<input type="submit" value="�ۼ���">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="�۸��" onClick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>