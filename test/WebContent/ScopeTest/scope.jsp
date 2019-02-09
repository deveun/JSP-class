<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="application" />
<!-- scope = "page" || scope = "session" -->
<jsp:setProperty property="*" name="obj"/>

<h3>application Scope</h3>

<b>count의 num값: </b>
<jsp:getProperty property="count" name="obj" />

<a href = "result.jsp">다음페이지로.</a>