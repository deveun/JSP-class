<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="application" />
<!-- scope = "page" || scope = "session" -->
<jsp:setProperty property="*" name="obj"/>

<h3>application Scope</h3>

<b>count�� num��: </b>
<jsp:getProperty property="count" name="obj" />

<a href = "result.jsp">������������.</a>