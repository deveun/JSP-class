<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
		//GET���� ������ parameters
		String no = request.getParameter("no");
		if (no==null || no.trim().equals("")){
			response.sendRedirect("member_all.jsp");
			return;
		}
		
		//����Ŭ���� number���ε� String���·� ó���� �ϸ� - �� �÷��� ����� �ȵȴ�
		//���� ���� INT������ ��ȯ
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg, url = "member_all.jsp";
		if (res>0){
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}else {
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>












