<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>    
<!-- updatePro.jsp -->

<jsp:useBean id="dao" class="my.board2.BoardDataBean" />
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board2");
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		}catch(IOException e){
			e.printStackTrace();
			return;
		}
%>
<%
		if (mr.getParameter("writer")==null 
							|| mr.getParameter("writer").trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}

		int res = dao.updateBoard(mr); 
		
		if (res>0){%>
		<script type="text/javascript">
			alert("�Խñ� ���� ����!! �۸���������� �̵��մϴ�.")
			location.href="list.jsp"
		</script>				
<%	}else if (res==0){%>
		<script type="text/javascript">
			alert("�Խñ� ���� ����!! �ۺ����������� �̵��մϴ�.")
			location.href="content.jsp?num=<%=mr.getParameter("num")%>"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���.")
			location.href="updateForm.jsp?num=<%=mr.getParameter("num")%>"
		</script>	
	
<%	}%>		





