<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />
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
	<form name="f" action="writePro.jsp" method="POST" onsubmit="return test()">
		<tr>
			<td colspan="2">�� �� ��</td>
		</tr>
		<tr>
			<td class="bg-default text-white" width="15%">�̸�</td>
			<td><input name= "writer" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td class="bg-default text-white">����</td>
			<td><input name= "subject" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td class="bg-default text-white">Email</td>
			<td><input name= "email" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td class="bg-default text-white">����</td>
			<td><textarea class="form-control" name="content" rows="3" required></textarea></td>
		</tr>
		<tr>
			<td class="bg-default text-white">��й�ȣ</td>
			<td><input type="password" name= "passwd" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btn btn-sm btn-default" type="submit">�۾���</button>
				<button class="btn btn-sm btn-default" type="reset">�ٽþ���</button>
				<button class="btn btn-sm btn-default" type="button" onClick="location.href='list.jsp'">�۸��</button>
			</td>
		</tr>
		</form>
	</table>


</div>


<%@ include file="../bottom.jsp"%>