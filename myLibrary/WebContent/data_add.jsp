<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>

<!-- DAO를 추가하여, DB 데이터작업을 진행함. -->
<jsp:useBean id = "book_dao" class="book.BookDAO"/>

<%
//(jsp) request로 POST 파라미터들을 전달받음.
//먼저, 한글을 받을 경우를 생각하여 인코딩 작업.
request.setCharacterEncoding("EUC-KR");
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
	
	if (book_dto.getBookname() == null ||
	book_dto.getBookname().trim().equals("") ||
	book_dto.getWriter() == null ||
	book_dto.getWriter().trim().equals("") ||
	book_dto.getPublisher() == null ||
	book_dto.getPublisher().trim().equals("") ||
	book_dto.getPrice() <= 0 ) {
%><script>
		alert("책 정보를 다시 입력해주세요.");
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
	int res = book_dao.addBook(book_dto);
	
	//Query가 성공하면 res = 1; 실패하면 res = 0;
	if(res > 0) {
		%><script>
		alert("책 정보를 추가하였습니다.");
		//location.href="list2.jsp";
		</script><%
	}
	
	
%>