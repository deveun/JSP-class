<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
		List<String> advice = (List)request.getAttribute("result");
%>
<html>
<head>	
	<title>�а����ð��</title>
</head>
<body>
	<h1 align="center">�а� ���ÿ� ���� ���</h1>
	<hr color="red">
<%	if (advice==null && advice.size()==0){ %>
		<h3>�����Ͻ� �а��� ���� ���� ���� �ʽ��ϴ�.</h3>	
<%	}else { 
			for(String msg : advice){%>
				<h3><%=msg%></h3>			
<%		}
		} %>
</body>
</html>
