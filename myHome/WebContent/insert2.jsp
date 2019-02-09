<!--  DTO DAO 사용 -->
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

	//2. (trim = 앞 뒤의 불필요한 space지우기)
	if (id == null || id.trim().equals("") || name == null || name.trim().equals("") || cname == null
			|| cname.trim().equals("")) {
%><script>
		alert("Type ID, Name, Class name correctly");
		history.back();
	</script>
<%
	//Method를 빠져나가지 않으면, Data가 Null일 때, 아래 구문을 실행하게됨.
		return;
	}
	 
	//DAO File 에서 기능(Function) 구현.
	int res = stdao.insertStudent(id, name, cname);
	
	//6. Query가 성공하면 res = 1; 실패하면 res = 0;
	if(res > 0) {
		%><script>
		alert("Success!! Move to student list page.");
		location.href="list2.jsp";
		</script><%
	}
	
	
%>