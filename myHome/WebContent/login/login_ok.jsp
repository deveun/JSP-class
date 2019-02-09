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
	//checkbox에 check가 되어있으면 on, check가 안되어 있으면 null이 저장됨

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
			
			//Session값 저장
			//로그인 성공시, 해당 값을 top.jsp에서 반영하여 화면을 바꾸어줌.
			session.setAttribute("mbId", loginOk.getId());
			msg = "로그인 되었습니다.";
			url = request.getContextPath() + "/index.jsp";
			break;
		case LoginOk.NOT_ID:
			msg = "아이디가 존재하지 않습니다.";
			url = "login.jsp";
			break;
		case LoginOk.NOT_PWD:
			msg = "비밀번호가 틀렸습니다.";
			url = "login.jsp";
			break;
		case LoginOk.ERROR:
			msg = "오류 발생. 관리자에게 문의해주세요.";
			url = "login.jsp";
			break;
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>