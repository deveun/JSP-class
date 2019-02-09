<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<%
	//VALIDATION
	if (mbdto.getName() == null || mbdto.getName().trim().equals("")) {
		response.sendRedirect("memberSsn.jsp");
		return;
	}
	//DAO 에서 기능(Function) 구현.
	//int res = stdao.insertStudent(id, name, cname);
	//DTO 객체를 매개변수로 설정할 수 있음
	int res = mbdao.insertMember(mbdto);

	//6. Query가 성공하면 res = 1; 실패하면 res = 0;
	if (res > 0) {
%><script>
	alert("Success!!");
	self.close();
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("회원가입 실패! 다시 가입해주세요.");
	location.href = "memberSsn.jsp";
</script>
<%
	}
%>