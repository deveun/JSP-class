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

		String ip = request.getRemoteAddr();//xp-ipv4, win7이상-ipv6
		int res = dao.insertBoard(mr, ip);
		
		if (res>0){%>
			<script type="text/javascript">
				alert("게시글 등록 성공!! 글목록페이지로 이동합니다.")
				location.href="list.jsp"
			</script>
<%	}else { %>
			<script type="text/javascript">
				alert("게시글 등록 실패!! 글등록페이지로 이동합니다.")
				location.href="writeForm.jsp"
			</script>
<%	} %>		












