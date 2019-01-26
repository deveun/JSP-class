<!--  DTO DAO ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
<!-- StudentDAO -->
<jsp:useBean id = "stdao" class="my.student.StudentDAO"/>

<%
	//Korean Encoding
	request.setCharacterEncoding("EUC-KR");
	//1.	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String cname = request.getParameter("cname");

	//2. (trim = �� ���� ���ʿ��� space�����)
	if (id == null || id.trim().equals("") || name == null || name.trim().equals("") || cname == null
			|| cname.trim().equals("")) {
%><script>
		alert("Type ID, Name, Class name correctly");
		history.back();
	</script>
<%
	//Method�� ���������� ������, Data�� Null�� ��, �Ʒ� ������ �����ϰԵ�.
		return;
	}
	 
	//DAO File ���� ���(Function) ����.
	int res = stdao.insertStudent(id, name, cname);
	
	//6. Query�� �����ϸ� res = 1; �����ϸ� res = 0;
	if(res > 0) {
		%><script>
		alert("Success!! Move to student list page.");
		location.href="list2.jsp";
		</script><%
	}
	
	
%>