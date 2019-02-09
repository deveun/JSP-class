<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.member.*"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
//Korean Encoding (GetParameter�� ó�� �����ϱ� ����. )
request.setCharacterEncoding("EUC-KR");
String mode = request.getParameter("mode");
if(mode == null) {
	mode = "all";
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
		<%if (mode.equals("all")) { %>
		<h2>Member List</h2>
		<%} 
		else { %>
			<h2>Member Search</h2>
			<!-- action�� ������ ���� �������� �� ���� -->
			<form name="f" method="post">
				<select name = "search">
					<option value="id">���̵�</option>
					<option value="name">�̸�</option>
				</select>
				<input type="text" name="searchString" class="box">
				<input type="submit" value="SEARCH">
			</form>
			
			<jsp:setProperty property="*" name="mbdao"/>
		<%}%>
		<hr color="green" width="300">
		<div class="container">
			<table
				class="table table-sm table-bordered table-striped text-center">
				<tr>
					<th>��ȣ</th>
					<th>�̸�</th>
					<th>���̵�</th>
					<th>�̸���</th>
					<th>��ȭ��ȣ</th>
					<th>������</th>
					<th>����/����</th>

				</tr>
				<%
				List<MemberDTO> list = null;
				if(mode.equals("all"))
					list = mbdao.listMember();
				else
					list = mbdao.searchMember();
				
				for (MemberDTO dto : list) {
						//for(int i=0; i<list.size(); ++i){
						//	StudentDTO dto = list.get(i);
						// ---------------------------------------------------
						//Iterator<StudentDTO> it = list.iterator();
						//while(it.hasNext()){
						// 	StudentDTO dto = it.next();
				%>
				<tr>
					<td><%=dto.getNo()%></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getId()%></td>
					<td><%=dto.getEmail()%></td>
					<td><%=dto.getAllHp()%></td>
					<td><%=dto.getJoindate()%></td>
					<td>
						<a href="member_update.jsp?no=<%=dto.getNo()%>">����</a> | 
						<a href="member_delete.jsp?no=<%=dto.getNo()%>">����</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<%@ include file="../bottom.jsp"%>

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