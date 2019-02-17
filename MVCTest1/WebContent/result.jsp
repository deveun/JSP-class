<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
		List<String> advice = (List)request.getAttribute("result");
%>
<html>
<head>	
	<title>학과선택결과</title>
</head>
<body>
	<h1 align="center">학과 선택에 따른 결과</h1>
	<hr color="red">
<%	if (advice==null && advice.size()==0){ %>
		<h3>선택하신 학과는 아직 서비스 되지 않습니다.</h3>	
<%	}else { 
			for(String msg : advice){%>
				<h3><%=msg%></h3>			
<%		}
		} %>
</body>
</html>
