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
<body>
	<div class="d-inline-block mx-auto">
		<table class="table table-bordered width="800" height="600"">
			<tr>
				<td colspan="2">
				<a href="<%=request.getContextPath()%>/index.jsp">Main</a> | 
				<a href="<%=request.getContextPath()%>/login/login.jsp">Login</a> |
				<a href="javascript:checkMember();"> Register</a> | 
				<a href="<%=request.getContextPath()%>/member/member_all.jsp">All
						members</a> | 
				<!-- MODE ±¸º° -->
				<a href="<%=request.getContextPath()%>/member/member_all.jsp?mode=search">Search Member</a> |
					Forum | Introduction</td>
			</tr>
			<!--  LEFT MENU SECTION -->
			 <tr height="80%">
				<td width="20%">tree/view</td>
				<td width="80%">