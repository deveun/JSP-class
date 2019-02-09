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
	//Session 값 꺼내기 (값이 존재하면 isLogin을 true로 변경)
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
				<!-- MODE 구별 -->
				<a href="<%=request.getContextPath()%>/member/member_all.jsp?mode=search">Search Member</a> |
					Forum | Introduction
				</td>
			</tr>
			<tr height ="80%">
				<td width="20%" valign="top">
				<jsp:include page="/count/count.jsp" /><br>
				<%
				//Session값에 따라 바뀜.
					if(isLogin){
				%>
					아이디[<%=mbId%>]님이 로그인 중
				<%
					}else {
				%>
					로그인을 해주세요.
				<%
					}
				%>
				</td>
				<td width="80%">