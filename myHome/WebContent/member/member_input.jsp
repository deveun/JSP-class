<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<%
	//VALIDATION
	if (mbdto.getName() == null || mbdto.getName().trim().equals("")) {
		response.sendRedirect("memberSsn.jsp");
		return;
	}
	//DAO ���� ���(Function) ����.
	//int res = stdao.insertStudent(id, name, cname);
	//DTO ��ü�� �Ű������� ������ �� ����
	int res = mbdao.insertMember(mbdto);

	//6. Query�� �����ϸ� res = 1; �����ϸ� res = 0;
	if (res > 0) {
%><script>
	alert("Success!!");
	self.close();
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("ȸ������ ����! �ٽ� �������ּ���.");
	location.href = "memberSsn.jsp";
</script>
<%
	}
%>