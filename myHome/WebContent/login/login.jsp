<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp"%>
<script type="text/javascript">
		function loginCheck() {
			if(f.id.value=="") {
				alert("아이디를 입력해주세요!!");
				f.id.focus();
				return;
			}
			if(f.passwd.value=="") {
				alert("비밀번호를 입력해 주세요!!");
				f.passwd.focus();
				return;
			}
			document.f.submit();
		}
		function checkId() {
			window.open("<%=request.getContextPath()%>/login/checkForm.jsp?mode=id",
					"checkId", "width=640, height=400")
		}
		function checkPasswd() {
			window.open("<%=request.getContextPath()%>/login/checkForm.jsp?mode=passwd",
					"checkPasswd", "width=640, height=400")
		}
</script>
<%
	//cookie값에 따라서 아이디 기억하기 기능을 구현
	//login_ok에서 로그인 성공 시에 id값을 cookie에 저장. 그 값을 활용.
		Cookie[] cks = request.getCookies();
		String name=null, value=null;
		if (cks != null && cks.length != 0){
			for(int i=0; i<cks.length; ++i){
				name = cks[i].getName();
				if (name.trim().equals("mbId")){
					value = cks[i].getValue();
					break;
				}
			}
		}
		//이때 value값이 null이면 cookie에 mbId값이 저장되지 않았다는 뜻
		//value값이 null이 아니면 cookie에 mbId값을 value에 넣었다는 뜻
%>
<!-- login.jsp-->
<!--  <link rel="stylesheet" type="text/css" href="style.css"> -->
<br>
<img src="../img/bottom.gif" width=570 height="40" border="0" alt="">
<br>
<p>
	<img src="../img/tm_login.gif" width=100 height="13" border="0"
		align=center ALT="회원 로그인">
<form name="f" action="login_ok.jsp" method="post">
	<table width="60%" align="center" height="120">
		<tr>
			<td align="right" width="30%"><img src="../img/id01.gif"
				width="28" height="11" border="0" alt="아이디">&nbsp;&nbsp;</td>
			<td width="40%">
<%		if (value==null){ %>			
				<input type="text" name="id" tabindex="1">
<%		}else { %>
				<input type="text" name="id" tabindex="1" value="<%=value%>">
<%		} %>				
			</td>
			<td rowspan="2" width="30%" valign="middle"><a
				href="javascript:loginCheck()"> <img src="../img/bt_login.gif"
					border="0" alt="로그인" tabindex="3">&nbsp;&nbsp;<br>
			</a> <nobr>
<%		if (value==null){ %>				
					<input type="checkbox" name="saveId">
<%		}else { %>
					<input type="checkbox" name="saveId" checked>
<%		} %>					
					<font face="굴림" size="2">아이디 기억하기</font>
				</nobr>
			</td>
		</tr>
		<tr>
			<td align="right"><img src="../img/pwd.gif" width="37"
				height="11" alt="비밀번호"></td>
			<td><input type="password" name="passwd" tabindex="2"></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><a href="javascript:checkMember();"><img src="../img/bt_join.gif"
				width="60" height="22" alt="회원가입"></a>
				<a href="javascript:checkId();"><img src="../img/bt_search_id.gif" width="60" height="22" alt="아이디 찾기"></a>
				<a href="javascript:checkPasswd();"><img src="../img/bt_search_pw.gif" width="60" height="22"	alt="비밀번호 찾기"></td></a>
		</tr>
	</table>
</form>
<%@ include file="../bottom.jsp"%>