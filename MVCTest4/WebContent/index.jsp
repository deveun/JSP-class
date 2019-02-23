<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MVC</title>
</head>
<body>
	<h2>MVC패턴으로 해보는 JSP</h2>
	<p>Command 를 만들지 않고, 페이지를 구분하기</p>
	<p>넘어온 주소값을 이용하여 Servlet에서 Command를 알아내자.</p>
	<ul>
		<li onClick="location.href='login.app'" style="cursor: pointer;">로그인 페이지로 이동</li><br>
		<li onClick="location.href='shop.app'" style="cursor: pointer;">쇼핑몰로 이동</li><br>
		<li onClick="location.href='member.app'" style="cursor: pointer;">회원관리페이지로 이동</li><br>
		<li onClick="location.href='board.app'" style="cursor: pointer;">게시판으로 이동</li>
	</ul>
</body>
</html>