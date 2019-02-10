<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DAO를 추가하여, DB 데이터작업을 진행함. -->
<jsp:useBean id = "board_dao" class="my.board.BoardDataBean"/>

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
	<jsp:useBean id="board_dto" class = "my.board.BoardDBBean" />
	<jsp:setProperty property="*" name = "board_dto"/>
<%
	if (
	board_dto.getPasswd() == null ||
	board_dto.getPasswd().trim().equals("")
	) {
%><script>
		alert("비밀번호를 다시 입력해주세요.");
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
	int res = board_dao.deleteBoard(board_dto); 
	
	//Query가 성공하면 res = 1; 실패하면 res = 0;
	if(res > 0) {
		%><script>
		alert("글을 삭제했습니다.");
		location.href="list.jsp";
		</script><%
	}
	else if (res == -1) {
		%><script>
		alert("비밀번호가 존재하지 않습니다.");
		history.back();
		</script><%
	}
	else {
		%><script>
		alert("삭제에 실패했습니다.");
		location.href="list.jsp";
		</script><%
	}
	
	
%>