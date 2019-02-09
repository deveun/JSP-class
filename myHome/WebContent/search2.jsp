<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.*, my.student.*"%>
<!-- list.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
	//Korean Encoding
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");

	if (id == null || id.trim().equals("")) {
%><script>
	alert("Type ID");
	history.back();
</script>
<%
	//Method를 빠져나가지 않으면, Data가 Null일 때, 아래 구문을 실행하게됨.
		return;
	}
%>

<html>
<head>
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/css/mdb.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="text-center">
		<hr color="green" width="300">
		<h2>Student List</h2>
		<hr color="green" width="300">
		<div class="container">
			<table
				class="table table-sm table-bordered table-striped text-center">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Class</th>
				</tr>
				<%
				List<StudentDTO> list = stdao.searchStudent(id);
				for (StudentDTO dto : list) {
					//for(int i=0; i<list.size(); ++i){
					//	StudentDTO dto = list.get(i);
					// ---------------------------------------------------
					//Iterator<StudentDTO> it = list.iterator();
					//while(it.hasNext()){
					// 	StudentDTO dto = it.next();
			%>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
			</tr>
			<%
				}
			%>
			</table>
		</div>
	</div>


	<!-- ========================================================== -->
	<!-- JavaScript CDN LIST ====================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- Jquery 1.10.2 ============================================ -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/js/mdb.min.js"></script>
	<!-- /JavaScript CDN LIST ===================================== -->
</body>
</html>