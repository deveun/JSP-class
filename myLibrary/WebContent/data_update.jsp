<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>

<!-- DAO를 추가하여, DB 데이터작업을 진행함. -->
<jsp:useBean id = "book_dao" class="book.BookDAO"/>

<%
//(jsp) request로 POST 파라미터들을 전달받음.
//먼저, 한글을 받을 경우를 생각하여 인코딩 작업.
request.setCharacterEncoding("EUC-KR");
//GET으로 받은 PARAMETER
String mode = request.getParameter("mode");
String del = request.getParameter("del_id");
int del_id = 0;
if(del != null) {
	del_id = Integer.parseInt((String)del); }
//(POST로 받은 데이터 저장 방법1)
//String id = request.getParameter("id");
//String name = request.getParameter("name");
//String cname = request.getParameter("cname");
%>
<!-- (POST로 받은 데이터 저장 방법2) request로 인코딩을 하고 나서 ,, 
jsp 밖에서 DTO객체를 bean으로 받아 property들을 설정.-->
	<jsp:useBean id="book_dto" class = "book.BookDTO" />
	<jsp:setProperty property="*" name = "book_dto"/>
<% 
	if (!mode.equals("delete")&&(book_dto.getBookname() == null ||
	book_dto.getBookname().trim().equals("") ||
	book_dto.getWriter() == null ||
	book_dto.getWriter().trim().equals("") ||
	book_dto.getPublisher() == null ||
	book_dto.getPublisher().trim().equals("") ||
	book_dto.getPrice() <= 0 )) {
%><script>
		alert("정보를 다시 입력해주세요.");
		//이전 페이지로 이동.
		history.back();
	</script>
<%
	//Method를 빠져나가지 않으면, Data가 Null일 때, 아래 구문을 실행하게됨.
	return;
	}
	
	//Validation을 통과하면,
	//DAO File 에서 기능(Function) 구현.
	//DTO 객체를 매개변수로 설정할 수 있음
	//mode에 따라 ADD OR DELETE OR EDIT
	int res = 0;
	String msg = null;
	if(mode.equals("add")) {
		res = book_dao.addBook(book_dto);
		msg = "책 정보를 추가하였습니다.";
	}
	else if(mode.equals("delete")) {
		res = book_dao.delBook(del_id);
		msg = "책 정보를 삭제하였습니다.";
	}
	else if(mode.equals("edit")) {
		res = book_dao.editBook(book_dto);
		msg = "책 정보를 수정하였습니다.";
	}
	
	//Query가 성공하면 res = 1; 실패하면 res = 0;
	if(res > 0) {
		%><script>
		alert("<%=msg%>");
		location.href="page_list.jsp";
		</script><%
	}
	
	
%>