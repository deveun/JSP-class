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
			|| mbdto.getSsn2() == null	|| mbdto.getSsn2().trim().equals("")) {
		response.sendRedirect("checkIdForm.jsp");
		return;
	}

	String isCheck = mbdao.checkId(mbdto);
	if (isCheck != "") {
%>
<script type="text/javascript">
	alert("ID �� �ֽ��ϴ� ...")
</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("���̵� �������� �ʽ��ϴ�.");
		</script>	
<%
	}
%>