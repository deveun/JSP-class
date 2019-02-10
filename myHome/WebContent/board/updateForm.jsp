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
	//update / context의 작업을 다르게 하기 위해. 두번째 파라미터 추가 (mode)
	BoardDBBean board_dto = board_dao.getBoard(num, "update"); 
%> 

<script>
 function test() {
	 if (f.writer.value==""){
			alert("이름을 입력해 주세요!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true
 }
</script>
<div class="container">
	<table class="table table-sm table-bordered text-center">
	<!-- onSubmit="return test()" 를 실행하면
	함수를 실행하여 데이터를 전송하기 전에 Validation을 실행. -->
	<form name="f" action="updatePro.jsp" method="POST" onsubmit="return test()">
		<tr>
			<td colspan="2">글 수정하기</td>
		</tr>
		<input name="num" value="<%=board_dto.getNum()%>" hidden>
		<tr>
			<td width="15%">이름</td>
			<td><input name= "writer" class="form-control form-control-sm" value = "<%=board_dto.getWriter() %>"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input name= "subject" class="form-control form-control-sm"  value = "<%=board_dto.getSubject() %>"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input name= "email" class="form-control form-control-sm"  value = "<%=board_dto.getEmail() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea class="form-control" name="content" rows="3"><%=board_dto.getWriter() %></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name= "passwd" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btn btn-sm btn-default" type="submit">글 수정</button>
				<button class="btn btn-sm btn-default" type="reset">다시작성</button>
				<button class="btn btn-sm btn-default" type="button" onClick="location.href='list.jsp'">목록보기</button>
			</td>
		</tr>
		</form>
	</table>


</div>


<%@ include file="../bottom.jsp"%>