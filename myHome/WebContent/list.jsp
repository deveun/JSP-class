<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
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
			<table class="table table-sm table-bordered table-striped text-center">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Class</th>
				</tr>
				<%
					Class.forName("oracle.jdbc.driver.OracleDriver");
					String url = "jdbc:oracle:thin:@localhost:1521:xe";
					String user = "jsp01";
					String pass = "jsp01";
					Connection conn = DriverManager.getConnection(url, user, pass);

					String sql = "SELECT * FROM jspstudent";
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						String id = rs.getString("id");
						String name = rs.getString("name");
						String cname = rs.getString("cname");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=cname%></td>
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