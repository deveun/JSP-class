<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
		//GET으로 전송한 parameters
		String no = request.getParameter("no");
		if (no==null || no.trim().equals("")){
			response.sendRedirect("member_all.jsp");
			return;
		}
		
		//오라클에서 number형인데 String형태로 처리를 하면 - 그 컬럼은 계산이 안된다
		//받은 값을 INT형으로 변환
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg, url = "member_all.jsp";
		if (res>0){
			msg = "회원삭제성공!! 회원목록페이지로 이동합니다.";
		}else {
			msg = "회원삭제실패!! 회원목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>












