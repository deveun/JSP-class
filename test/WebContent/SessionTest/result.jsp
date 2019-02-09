<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 아이디 admin / 비밀번호 1234 -->

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg = null, url = null;
	
	if (id.equals("admin")) {
		if(pwd.equals("1234")) {
			msg = "로그인 성공. 회원전용 페이지로 이동";
			url = "sessionTest2.jsp";
		}else {
			msg = "비밀번호를 다시 입력하세요.";
			url = "sessionTest1.jsp";
		}
	}else {
		msg = "없는 아이디 입니다.";
		url = "sessionTest1.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>