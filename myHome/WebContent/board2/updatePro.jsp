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
			alert("게시글 수정 성공!! 글목록페이지로 이동합니다.")
			location.href="list.jsp"
		</script>				
<%	}else if (res==0){%>
		<script type="text/javascript">
			alert("게시글 수정 실패!! 글보기페이지로 이동합니다.")
			location.href="content.jsp?num=<%=mr.getParameter("num")%>"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다. 다시 입력해 주세요.")
			location.href="updateForm.jsp?num=<%=mr.getParameter("num")%>"
		</script>	
	
<%	}%>		





