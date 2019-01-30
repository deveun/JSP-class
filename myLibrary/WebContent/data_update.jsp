<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>

<!-- DAO�� �߰��Ͽ�, DB �������۾��� ������. -->
<jsp:useBean id = "book_dao" class="book.BookDAO"/>

<%
//(jsp) request�� POST �Ķ���͵��� ���޹���.
//����, �ѱ��� ���� ��츦 �����Ͽ� ���ڵ� �۾�.
request.setCharacterEncoding("EUC-KR");
//GET���� ���� PARAMETER
String mode = request.getParameter("mode");
String del = request.getParameter("del_id");
int del_id = 0;
if(del != null) {
	del_id = Integer.parseInt((String)del); }
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
	if (!mode.equals("delete")&&(book_dto.getBookname() == null ||
	book_dto.getBookname().trim().equals("") ||
	book_dto.getWriter() == null ||
	book_dto.getWriter().trim().equals("") ||
	book_dto.getPublisher() == null ||
	book_dto.getPublisher().trim().equals("") ||
	book_dto.getPrice() <= 0 )) {
%><script>
		alert("������ �ٽ� �Է����ּ���.");
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
	//mode�� ���� ADD OR DELETE OR EDIT
	int res = 0;
	String msg = null;
	if(mode.equals("add")) {
		res = book_dao.addBook(book_dto);
		msg = "å ������ �߰��Ͽ����ϴ�.";
	}
	else if(mode.equals("delete")) {
		res = book_dao.delBook(del_id);
		msg = "å ������ �����Ͽ����ϴ�.";
	}
	else if(mode.equals("edit")) {
		res = book_dao.editBook(book_dto);
		msg = "å ������ �����Ͽ����ϴ�.";
	}
	
	//Query�� �����ϸ� res = 1; �����ϸ� res = 0;
	if(res > 0) {
		%><script>
		alert("<%=msg%>");
		location.href="page_list.jsp";
		</script><%
	}
	
	
%>