<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<%
	if (mbdto.getName() == null || mbdto.getName().trim().equals("")) {
		response.sendRedirect("login.jsp");
		return;
	}

	String isCheck = "";
	String Msg = "";
	if (mbdto.getId() == null || mbdto.getId().trim().equals("")) {
		isCheck = mbdao.checkId(mbdto);
		Msg = "���̵� : ";
	} else {
		isCheck = mbdao.checkPasswd(mbdto);
		Msg = "��й�ȣ : ";
	}

	if (isCheck != "") {
		Msg = Msg + isCheck;
%> 
<script type="text/javascript">
	alert("<%=Msg%>");
	self.close();
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("�����ϴ� ������ �����ϴ�.");
	self.close();
</script>
<%
	}
%>