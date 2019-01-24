<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
//Korean Encoding
request.setCharacterEncoding("EUC-KR");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>

<h2>Title : <%=title %></h2>
<h2>Content : <%=content %></h2>