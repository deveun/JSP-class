<!--  SET PROPERTY FUNCTION �ъ�� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
<!-- StudentDAO -->
<jsp:useBean id = "stdao" class="my.student.StudentDAO"/>

<%
	//Request 는 POST GET으로 받은 데이터를 말함. 
	//Korean Encoding
	request.setCharacterEncoding("EUC-KR");
	//1.	%>
	<jsp:useBean id="stdto" class = "my.student.StudentDTO" />
	<jsp:setProperty property="id" name = "stdto"/>
	<!-- 데이터의 프로퍼티를 자동으로 Setter를 통해 DTO Class에 저장. -->
	<!-- (EQUAL) stdto.setID(request.getParameter("id")); -->
	<!-- property="*" 로 작성하면, 모든 데이터 항목값을 한번에 저장할 수 있음. -->
<% 
	//2. (trim = 앞 뒤의 불필요한 space지우기)
	if (stdto.getId() == null || stdto.getId().trim().equals("") || stdto.getName() == null || stdto.getName().trim().equals("") || stdto.getCname() == null || stdto.getCname().trim().equals("")) {
%><script>
		alert("Type ID, Name, Class name correctly");
		history.back();
	</script>
<%
//Method를 빠져나가지 않으면, Data가 Null일 때, 아래 구문을 실행하게됨.
		return;
	}
	 
	//DAO File 에서 기능(Function) 구현.
	//int res = stdao.insertStudent(id, name, cname);
	//DTO 객체를 매개변수로 설정할 수 있음
	int res = stdao.insertStudent(stdto); 
	
	//6. Query가 성공하면 res = 1; 실패하면 res = 0;
	if(res > 0) {
		%><script>
		alert("Success!! Move to student list page.");
		location.href="list2.jsp";
		</script><%
	}
	
	
%>