<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />
<%
	//GET PARAMETER (�������� NULL ���� ����?)
	request.setCharacterEncoding("EUC-KR");
	String str_num = request.getParameter("num");
	int num = 0;
	if(str_num == null || str_num.trim().equals("")) { %>
		<script>
		history.back()
		</script>
	<% return;
	}
	num = Integer.parseInt((String)str_num);
	//update / context�� �۾��� �ٸ��� �ϱ� ����. �ι�° �Ķ���� �߰� (mode)
	BoardDBBean board_dto = board_dao.getBoard(num, "update"); 
%> 

<script>
 function test() {
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
<div class="container">
	<table class="table table-sm table-bordered text-center">
	<!-- onSubmit="return test()" �� �����ϸ�
	�Լ��� �����Ͽ� �����͸� �����ϱ� ���� Validation�� ����. -->
	<form name="f" action="updatePro.jsp" method="POST" onsubmit="return test()">
		<tr>
			<td colspan="2">�� �����ϱ�</td>
		</tr>
		<input name="num" value="<%=board_dto.getNum()%>" hidden>
		<tr>
			<td width="15%">�̸�</td>
			<td><input name= "writer" class="form-control form-control-sm" value = "<%=board_dto.getWriter() %>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input name= "subject" class="form-control form-control-sm"  value = "<%=board_dto.getSubject() %>"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input name= "email" class="form-control form-control-sm"  value = "<%=board_dto.getEmail() %>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><textarea class="form-control" name="content" rows="3"><%=board_dto.getWriter() %></textarea></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type="password" name= "passwd" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btn btn-sm btn-default" type="submit">�� ����</button>
				<button class="btn btn-sm btn-default" type="reset">�ٽ��ۼ�</button>
				<button class="btn btn-sm btn-default" type="button" onClick="location.href='list.jsp'">��Ϻ���</button>
			</td>
		</tr>
		</form>
	</table>


</div>


<%@ include file="../bottom.jsp"%>