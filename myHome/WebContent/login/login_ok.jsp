<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.login.*"%>
    
<jsp:useBean id = "loginOk" class="my.login.LoginOk" />
<jsp:setProperty property = "*" name = "loginOk"/>

<%
	//Validation
	if(loginOk.getId() == null || loginOk.getId().trim().equals("")){
		response.sendRedirect("login.jsp");
		return;
	}

	String saveId = request.getParameter("saveId");
	//checkbox�� check�� �Ǿ������� on, check�� �ȵǾ� ������ null�� �����

	int res = loginOk.loginCheck();
	String msg = null, url = null;
	
	switch(res){
		case LoginOk.OK:
			Cookie ck = new Cookie("mbId", loginOk.getId());
			if (saveId == null){
				ck.setMaxAge(0);
			}else {
				ck.setMaxAge(24*60*60);
			}
			response.addCookie(ck);		
			
			//Session�� ����
			//�α��� ������, �ش� ���� top.jsp���� �ݿ��Ͽ� ȭ���� �ٲپ���.
			session.setAttribute("mbId", loginOk.getId());
			msg = "�α��� �Ǿ����ϴ�.";
			url = request.getContextPath() + "/index.jsp";
			break;
		case LoginOk.NOT_ID:
			msg = "���̵� �������� �ʽ��ϴ�.";
			url = "login.jsp";
			break;
		case LoginOk.NOT_PWD:
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url = "login.jsp";
			break;
		case LoginOk.ERROR:
			msg = "���� �߻�. �����ڿ��� �������ּ���.";
			url = "login.jsp";
			break;
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>