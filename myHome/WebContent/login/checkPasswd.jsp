<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
	<jsp:useBean id="mbdto" class = "my.member.MemberDTO" />
	<jsp:setProperty property="*" name = "mbdto"/>
<%
	if (mbdto.getName() == null || mbdto.getName().trim().equals("") 
			|| mbdto.getSsn1() == null || mbdto.getSsn1().trim().equals("") 
			|| mbdto.getSsn2() == null	|| mbdto.getSsn2().trim().equals("")
			|| mbdto.getId() == null || mbdto.getId().trim().equals("")) {
		response.sendRedirect("checkPasswdForm.jsp");
		return;
	}

	String isCheck = mbdao.checkPasswd(mbdto); 
	if (isCheck != "") {
%>
<script type="text/javascript">
	alert("Password 있습니다 ...")
</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("존재하는 아이디 정보가 없습니다.");
		</script>	
<%
	}
%>