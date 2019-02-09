<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Cookie ck = new Cookie("id", "admin");
	Cookie ck2 = new Cookie("pwd", "1234");
	
	//쿠키 생성 주기 (7일 / 1일)
	ck.setMaxAge(7*24*60*60);
	ck2.setMaxAge(24*60*60);
	//참고: ck.setMaxAge(0) => ck에 해당되는  cookie값 삭제
			
	//쿠키 전송
	response.addCookie(ck);
	response.addCookie(ck2);
%>
<script type="text/javascript">
	alert("쿠키 전송 끝!!");
</script>
	
	