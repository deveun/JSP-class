<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>Homepage</title>
<link rel="stylesheet" type="text/css" href="style.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp",
				"checkMember", "width=640, height=400")
	}
</script>
</head>
<%
	//Session �� ������ (���� �����ϸ� isLogin�� true�� ����)
	String mbId = (String)session.getAttribute("mbId");
	boolean isLogin = false;
	if(mbId != null) isLogin = true;
%>
<body>
	<div class="d-inline-block mx-auto">
		<table class="table table-bordered width="800" height="600"">
			<tr>
				<td colspan="2">
				<a href="<%=request.getContextPath()%>/index.jsp">Main</a> | 
				<% if(isLogin) { %>
				<a href="<%=request.getContextPath()%>/login/logout.jsp">Logout</a> |
				<% } else { %>
				<a href="<%=request.getContextPath()%>/login/login.jsp">Login</a> |
				<% } %>
				<a href="javascript:checkMember();"> Register</a> | 
				<a href="<%=request.getContextPath()%>/member/member_all.jsp">All
						members</a> | 
				<!-- MODE ���� -->
				<a href="<%=request.getContextPath()%>/member/member_all.jsp?mode=search">Search Member</a> |
					Forum | Introduction
				</td>
			</tr>
			<tr height ="80%">
				<td width="20%" valign="top">
				<jsp:include page="/count/count.jsp" /><br>
				<%
				//Session���� ���� �ٲ�.
					if(isLogin){
				%>
					���̵�[<%=mbId%>]���� �α��� ��
				<%
					}else {
				%>
					�α����� ���ּ���.
				<%
					}
				%>
				</td>
				<td width="80%">