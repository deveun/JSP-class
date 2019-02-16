<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="board_dao" class="my.board.BoardDataBean" />
<%
	//GET PARAMETER (�������� NULL ���� ����?)
	request.setCharacterEncoding("EUC-KR");
	String str_num = request.getParameter("num");
	int num = 0;
	if (str_num == null || str_num.trim().equals("")) {
		response.sendRedirect("list.jsp");
		return;
	}
	num = Integer.parseInt((String) str_num);
	//���� ��ǻ�Ϳ����� ������ �����ϴ� ��츦 �����ֱ� ���� Cookie���
	//��Ű���� �Խñ��� Ű��(name) num�� Ȯ��.
	Cookie cks[] = request.getCookies();
	boolean isCk = false;
	if (cks != null && cks.length != 0) {
		for (int i = 0; i < cks.length; ++i) {
			String name = cks[i].getName();
			if (name.equals(num)) {
				isCk = true;
			}
		}
	}
	BoardDBBean board_dto = null;
	//Cookie�� ������ getBoard�� ��带 �ٲ�
	if (isCk) {
		board_dto = board_dao.getBoard(num, "check");
	} else {
		//Cookie�� ������ ���ο� ��Ű�� ����.
		Cookie ck = new Cookie(str_num, "check");
		ck.setMaxAge(24 * 60 * 60);
		response.addCookie(ck);
		//update / content�� �۾��� �ٸ��� �ϱ� ����. �ι�° �Ķ���� �߰� (mode)
		board_dto = board_dao.getBoard(num, "content");
	}
%>

<div class="container">
	<table class="table table-sm table-bordered text-center">
		<tr>
			<td class="bg-default text-white" width="15%">�۹�ȣ</td>
			<td><%=board_dto.getNum()%></td>
			<td class="bg-default text-white" width="15%">��ȸ��</td>
			<td><%=board_dto.getReadcount()%></td>
		</tr>
		<tr>
			<td class="bg-default text-white">�ۼ���</td>
			<td><%=board_dto.getWriter()%></td>
			<td class="bg-default text-white">�ۼ���</td>
			<td><%=board_dto.getReg_date()%></td>
		</tr>
		<tr>
			<td class="bg-default text-white">������</td>
			<td colspan="3"><%=board_dto.getSubject()%></td>
		</tr>
		<tr>
			<td class="bg-default text-white">�۳���</td>
			<td colspan="3"><%=board_dto.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4">
				<button class="btn btn-sm btn-default" type="button"
					onClick="location.href='writeForm.jsp?num=<%=board_dto.getNum()%>&re_step=<%=board_dto.getRe_step()%>&re_level=<%=board_dto.getRe_level()%>'">��۾���</button>  
				<button class="btn btn-sm btn-default" type="button"
					onClick="location.href='updateForm.jsp?num=<%=board_dto.getNum()%>'">�ۼ���</button>
				<button class="btn btn-sm btn-default" type="button"
					onClick="location.href='deleteForm.jsp?num=<%=board_dto.getNum()%>'">�ۻ���</button>
				<button class="btn btn-sm btn-default" type="button"
					onClick="location.href='list.jsp'">�۸��</button>
			</td>
		</tr>
	</table>


</div>


<%@ include file="../bottom.jsp"%>
