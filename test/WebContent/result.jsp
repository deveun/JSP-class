<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%

//get resources from other pages.
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String pwd = request.getParameter("pwd");
String address = request.getParameter("address");

%>

<h2>Name : <%=name %></h2>
<h2>Tel : <%=tel %></h2>
<h2>Password : <%=pwd %></h2>
<h2>Address : <%=address %></h2>