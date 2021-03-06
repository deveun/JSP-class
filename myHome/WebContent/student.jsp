<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<!-- Student Register Page -->
	<div class="text-center">
		<hr color="green" width="300">
		<h2>Student Register Page</h2>
		<hr color="green" width="300">
		<div class="container">
		<form name="f1" action="insert2.jsp" method="POST">
			<table class="table table-sm">
				<tr>
					<td>
						ID: <input class="form-control" type="text" name="id"><br>
						Name: <input class="form-control" type="text" name="name"><br> 
						Class: <input class="form-control" type="text" name="cname"><br>
						<button class="btn btn-default btn-sm" type="submit">ADD</button>
						<button class="btn btn-default btn-sm" type="reset">Reset</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<br>
	<!-- Student Delete Page -->
	<div class="text-center">
		<hr color="green" width="300">
		<h2>Student Delete Page</h2>
		<hr color="green" width="300">
		<div class="container">
		<form name="f2" action="delete2.jsp" method="POST">
			<table class="table table-sm">
				<tr>
					<td>
						ID: <input class="form-control" type="text" name="id"><br>
						<button class="btn btn-default btn-sm" type="submit">DELETE</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<br>
	<!-- Student Search Page -->
	<div class="text-center">
		<hr color="green" width="300">
		<h2>Student Search Page</h2>
		<hr color="green" width="300">
		<div class="container">
		<form name="f2" action="search3.jsp" method="POST">
			<table class="table table-sm">
				<tr>
					<td>
						ID: <input class="form-control" type="text" name="id"><br>
						<button class="btn btn-default btn-sm" type="submit">SEARCH</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<br>
	
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