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
			//mr = new MultipartRequest(request, "��ġ", ũ��, "�۲�");
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		}catch(IOException e){
			System.out.println("���� ���ε� �� ���� �߻�!!");
			e.printStackTrace();%>
			<script type="text/javascript">
				alert("���� ���ε� �� ���� �߻�!! �����ڿ��� �����ϼ���!!")
				location.href="fileUpload.jsp"
			</script>
<%		return;
		}
%>
<h3>���� ���ε� ����!!</h3>
<br>
�ø��� : <%=mr.getParameter("name")%><br>
<!-- request.getParameter("name") => X -->
���ϸ� : <%=mr.getFilesystemName("filename")%><br>
<!-- mr.getParameter("filename") => X -->
����ũ�� : 
<%	
		File file = mr.getFile("filename");
		int filesize = 0;
		if (file != null){
			filesize = (int)file.length();
		}
%>
<%=filesize%> bytes<br>
������ġ : <%=upPath%>














		
		
		
		
		
		
		
		