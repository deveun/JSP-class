<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DAO�� �߰��Ͽ�, DB �������۾��� ������. -->
<jsp:useBean id = "board_dao" class="my.board.BoardDataBean"/>

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
	<jsp:useBean id="board_dto" class = "my.board.BoardDBBean" />
	<jsp:setProperty property="*" name = "board_dto"/>
<%
	if (
	board_dto.getPasswd() == null ||
	board_dto.getPasswd().trim().equals("")
	) {
%><script>
		alert("��й�ȣ�� �ٽ� �Է����ּ���.");
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
	int res = board_dao.deleteBoard(board_dto); 
	
	//Query�� �����ϸ� res = 1; �����ϸ� res = 0;
	if(res > 0) {
		%><script>
		alert("���� �����߽��ϴ�.");
		location.href="list.jsp";
		</script><%
	}
	else if (res == -1) {
		%><script>
		alert("��й�ȣ�� �������� �ʽ��ϴ�.");
		history.back();
		</script><%
	}
	else {
		%><script>
		alert("������ �����߽��ϴ�.");
		location.href="list.jsp";
		</script><%
	}
	
	
%>