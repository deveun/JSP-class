<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="page_top.jsp"%>

<form name="f" action="data_add.jsp" method="POST">
	<div class="container">
		<table class="table table-sm">
			<tr><td>
				도서명:	<input class="form-control" type="text" name="bookname">
			</td></tr>
			<tr><td>
				지은이:	<input class="form-control" type="text" name="writer">
			</td></tr>
			<tr><td>
				출판사:	<input class="form-control" type="text" name="publisher">
			</td></tr>
			<tr><td>
				판매가:	<input class="form-control" type="number" name="price">
			</td></tr>
			<tr><td>
				<button class="btn btn-default btn-sm d-block mx-auto" type="submit">추가하기</button>
			</td></tr>
		</table>
</form>


<%@ include file="page_bottom.jsp"%>