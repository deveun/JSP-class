<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deletePro.jsp -->
<jsp:useBean id="dao" class="my.board2.BoardDataBean" />
<%
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		int res = dao.deleteBoard(Integer.parseInt(num), passwd);
		if (res>0){%>
		<script type="text/javascript">
			alert("�Խñ� ���� ����!! �۸���������� �̵��մϴ�.")
			location.href="list.jsp"
		</script>				
<%	}else if (res==0){%>
		<script type="text/javascript">
			alert("�Խñ� ���� ����!! �ۺ����������� �̵��մϴ�.")
			location.href="content.jsp?num=<%=num%>"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���.")
			location.href="deleteForm.jsp?num=<%=num%>"
		</script>	
			
<%	}%>










