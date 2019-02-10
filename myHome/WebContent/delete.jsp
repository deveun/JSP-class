<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>

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
		//Method�� ���������� ������, Data�� Null�� ��, �Ʒ� ������ �����ϰԵ�.
		return;
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp01";
	String pass = "jsp01";
	Connection conn = DriverManager.getConnection(url, user, pass);

	String sql = "DELETE * FROM jspstudent WHERE id like ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	int res = ps.executeUpdate();

	if (res > 0) {
%><script>
	alert("Success!! Move to student list page.");
	location.href = "list.jsp";
</script>
<%
}
if (res <= 0) {
%><script>
	alert("Fail!! No data.");
	location.href = "student.jsp";
</script>
<%
	}
%>