<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>표현예제3</title>
</head>
<body>
	<%	request.setAttribute("name","홍길동"); 
			session.setAttribute("name", "유재석");%>
	
	<%	//String name = (String)request.getAttribute("name");
			//out.println(name);%>
			<%-- request의 name 속성 : ${requestScope.name} --%>
			name 속성 : ${sessionScope.name}
</body>
</html>