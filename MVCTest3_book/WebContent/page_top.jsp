<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/css/mdb.min.css"
	rel="stylesheet">
<!-- Jquery 3.2.1 ============================================= -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark default-color mb-5">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" id="list" href="book.do?command=list">목록보기</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="add" href="page_add.jsp">추가하기</a>
			</li>
		</ul>
	</div>
</nav>