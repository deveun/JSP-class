<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ���̵� admin / ��й�ȣ 1234 -->

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg = null, url = null;
	
	if (id.equals("admin")) {
		if(pwd.equals("1234")) {
			msg = "�α��� ����. ȸ������ �������� �̵�";
			url = "sessionTest2.jsp";
		}else {
			msg = "��й�ȣ�� �ٽ� �Է��ϼ���.";
			url = "sessionTest1.jsp";
		}
	}else {
		msg = "���� ���̵� �Դϴ�.";
		url = "sessionTest1.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>