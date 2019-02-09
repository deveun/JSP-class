<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	if (mbdto.getName() == null || mbdto.getName().trim().equals("")) {
		response.sendRedirect("member_all.jsp");
		return;
	}

	int res = mbdao.updateMember(mbdto);
	String msg, url = "member_all.jsp";
	if (res > 0) {
		msg = "회원수정성공!! 회원목록페이지로 이동합니다.";
	} else {
		msg = "회원수정실패!! 회원목록페이지로 이동합니다.";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>