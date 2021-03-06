<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />
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

<%
		//2군데서 writeForm 으로 오게 된다.
		// - list페이지에서 글쓰기를 누를때 : 넘어오는 num값이 없다
		// - content페이지에서 답글쓰기를 누를때
		//   : 넘어오는 num값이 있다(re_step, re_level) 
		int num=0, re_step=0, re_level=0;
		String snum = request.getParameter("num");
		if (snum != null){//답글쓰기에서 넘어왔다면
			num = Integer.parseInt(snum);
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
		}
%>


<div class="container">
	<table class="table table-sm table-bordered text-center">
	<!-- onSubmit="return test()" 를 실행하면
	함수를 실행하여 데이터를 전송하기 전에 Validation을 실행. -->
	<form name="f" action="writePro.jsp" method="POST" onsubmit="return test()">
	<input type="hidden" name="num" value="<%=num%>"/>
	<input type="hidden" name="re_step" value="<%=re_step%>"/>
	<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<tr>
			<td colspan="2">글 쓰 기</td>
		</tr>
		<tr>
			<td class="bg-default text-white" width="15%">이름</td>
			<td><input name= "writer" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td class="bg-default text-white">제목</td>
			<td><input name= "subject" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td class="bg-default text-white">Email</td>
			<td><input name= "email" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td class="bg-default text-white">내용</td>
			<td><textarea class="form-control" name="content" rows="3" required></textarea></td>
		</tr>
		<tr>
			<td class="bg-default text-white">비밀번호</td>
			<td><input type="password" name= "passwd" class="form-control form-control-sm"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btn btn-sm btn-default" type="submit">글쓰기</button>
				<button class="btn btn-sm btn-default" type="reset">다시쓰기</button>
				<button class="btn btn-sm btn-default" type="button" onClick="location.href='list.jsp'">글목록</button>
			</td>
		</tr>
		</form>
	</table>


</div>


<%@ include file="../bottom.jsp"%>