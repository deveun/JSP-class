<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");

	if (name == null || name.trim().equals("") || ssn1 == null || ssn1.trim().equals("") || ssn2 == null
			|| ssn2.trim().equals("")) {
		response.sendRedirect("memberSsn.jsp");
		return;
	}
%>
<script type="text/javascript">
	function check() {
		if(f.id.value == "") {
			alert("아이디를 입력해주세요.");
			//Focus
			f.id.focus();
		}
		else if(f.passwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			//Focus
			f.passwd.focus();
		}
		else 
			document.f.submit();
	}
</script>
<body>
	<form name="f" method="POST" action="member_input.jsp">
		<table width="600" align="center" class="outline">
			<tr>
				<td colspan="2" align=center class="m2">회원가입</td>
			</tr>
			<tr>
				<td width="150" class="m3">이름</td>
				<td class="m3"><input type="text" name="name" class="box"
					value="<%=name%>" readonly></td>
			</tr>
			<tr>
				<td width="150" class="m3">아이디</td>
				<td class="m3"><input type="text" name="id" class="box">
				</td>
			</tr>
			<tr>
				<td width="150" class="m3">비밀번호</td>
				<td class="m3"><input type="password" name="passwd" class="box">
				</td>
			</tr>
			<tr>
				<td width="150" class="m3">주민번호</td>
				<td class="m3"><input type="text" name="ssn1" class="box"
					value="<%=ssn1%>" readonly> - <input type="password"
					name="ssn2" class="box" value="<%=ssn2%>" readonly></td>
			</tr>
			<tr>
				<td width="150" class="m3">이메일</td>
				<td class="m3"><input type="text" name="email" class="box">
				</td>
			</tr>
			<tr>
				<td width="150" class="m3">연락처</td>
				<td class="m3">
					<!-- input 의 사이즈 (size), 최대 입력가능 글자 제한 (maxlength) --> <input
					type="text" name="hp1" class="box" size="3" maxlength="3">
					- <input type="text" name="hp2" class="box" size="4" maxlength="4">
					- <input type="text" name="hp3" class="box" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- 동일 파일 내의 javascript 함수 실행 --> <a href="javascript:check()">[전송]</a>
					<a href="#">[취소]</a>
				</td>
			</tr>
		</table>
	</form>
</body>