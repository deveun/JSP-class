<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*, com.oreilly.servlet.*" %>    
<!-- writePro.jsp -->
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

		String ip = request.getRemoteAddr();//xp-ipv4, win7�̻�-ipv6
		int res = dao.insertBoard(mr, ip);
		
		if (res>0){%>
			<script type="text/javascript">
				alert("�Խñ� ��� ����!! �۸���������� �̵��մϴ�.")
				location.href="list.jsp"
			</script>
<%	}else { %>
			<script type="text/javascript">
				alert("�Խñ� ��� ����!! �۵���������� �̵��մϴ�.")
				location.href="writeForm.jsp"
			</script>
<%	} %>		












