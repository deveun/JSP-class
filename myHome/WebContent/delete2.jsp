<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		//Method�� ���������� ������, Data�� Null�� ��, �Ʒ� ������ �����ϰԵ�.
		return;
	}

		int res = stdao.deleteStudent(id);

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