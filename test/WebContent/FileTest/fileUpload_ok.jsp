<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="com.oreilly.servlet.*, java.io.*"%>
<%
		//request.setCharacterEncoding("EUC-KR");
		//String name = request.getParameter("name");
		//String filename = request.getParameter("filename");
		MultipartRequest mr = null;
		String upPath = 
				config.getServletContext().getRealPath("/FileTest");
		int len = 10*1024*1024;
		try{
			//mr = new MultipartRequest(request, "위치", 크기, "글꼴");
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		}catch(IOException e){
			System.out.println("파일 업로드 중 오류 발생!!");
			e.printStackTrace();%>
			<script type="text/javascript">
				alert("파일 업로드 중 오류 발생!! 관리자에게 문의하세요!!")
				location.href="fileUpload.jsp"
			</script>
<%		return;
		}
%>
<h3>파일 업로드 성공!!</h3>
<br>
올린이 : <%=mr.getParameter("name")%><br>
<!-- request.getParameter("name") => X -->
파일명 : <%=mr.getFilesystemName("filename")%><br>
<!-- mr.getParameter("filename") => X -->
파일크기 : 
<%	
		File file = mr.getFile("filename");
		int filesize = 0;
		if (file != null){
			filesize = (int)file.length();
		}
%>
<%=filesize%> bytes<br>
파일위치 : <%=upPath%>














		
		
		
		
		
		
		
		