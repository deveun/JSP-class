<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="application"/>
<!-- scope = "page" || scope = "session" -->

<h2>result.jsp페이지</h2>
<b>counter의 num값: </b>
<jsp:getProperty property="count" name="obj" />

<a href="scopeTest.jsp">처음으로.</a> 