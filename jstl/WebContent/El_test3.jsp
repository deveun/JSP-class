<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>ǥ������3</title>
</head>
<body>
	<%	request.setAttribute("name","ȫ�浿"); 
			session.setAttribute("name", "���缮");%>
	
	<%	//String name = (String)request.getAttribute("name");
			//out.println(name);%>
			<%-- request�� name �Ӽ� : ${requestScope.name} --%>
			name �Ӽ� : ${sessionScope.name}
</body>
</html>