<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>

<!-- DAO�� �߰��Ͽ�, DB �������۾��� ������. -->
<jsp:useBean id = "book_dao" class="book.BookDAO"/>

<%
//(jsp) request�� POST �Ķ���͵��� ���޹���.
//����, �ѱ��� ���� ��츦 �����Ͽ� ���ڵ� �۾�.
request.setCharacterEncoding("EUC-KR");
//(POST�� ���� ������ ���� ���1)
//String id = request.getParameter("id");
//String name = request.getParameter("name");
//String cname = request.getParameter("cname");
%>
<!-- (POST�� ���� ������ ���� ���2) request�� ���ڵ��� �ϰ� ���� ,, 
jsp �ۿ��� DTO��ü�� bean���� �޾� property���� ����.-->
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
		alert("å ������ �ٽ� �Է����ּ���.");
		//���� �������� �̵�.
		history.back();
	</script>
<%
	//Method�� ���������� ������, Data�� Null�� ��, �Ʒ� ������ �����ϰԵ�.
	return;
	}
	
	//Validation�� ����ϸ�,
	//DAO File ���� ���(Function) ����.
	//DTO ��ü�� �Ű������� ������ �� ����
	int res = book_dao.addBook(book_dto);
	
	//Query�� �����ϸ� res = 1; �����ϸ� res = 0;
	if(res > 0) {
		%><script>
		alert("å ������ �߰��Ͽ����ϴ�.");
		//location.href="list2.jsp";
		</script><%
	}
	
	
%>