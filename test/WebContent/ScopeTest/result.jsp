<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="application"/>
<!-- scope = "page" || scope = "session" -->

<h2>result.jsp������</h2>
<b>counter�� num��: </b>
<jsp:getProperty property="count" name="obj" />

<a href="scopeTest.jsp">ó������.</a> 