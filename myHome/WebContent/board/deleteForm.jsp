<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />

<%
	//GET PARAMETER (없을때는 NULL 값을 가짐?)
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
%>

<div class="container col-6">
	<table class="table table-sm text-center">
		<form name="f" action="deletePro.jsp" method="POST" onsubmit="return test()">
		<tr>
			<td colspan="2" class="bg-default text-white">비밀번호를 입력해 주세요.</td>
		</tr>
		<tr>
			<input name = "num" value = "<%=num%>" hidden> 
			<td>비밀번호: </td>
			<td><input name= "passwd" type="password" class="form-control form-control-sm"></td>
		</tr>
		<tr class="bg-default text-white">
			<td colspan="2">
				<button class="btn btn-sm btn-light" type="submit">글삭제</button>
				<button class="btn btn-sm btn-light" type="button" onClick="location.href='list.jsp'">글목록</button>
				</td>
		</tr>
		</form>
	</table>


</div>


<%@ include file="../bottom.jsp"%>