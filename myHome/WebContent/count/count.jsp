<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- count.jsp -->
<!-- 
	jsp life cycle
	1. jspInit() : jsp파일이 실행될때 제일 먼저 불려가서 실행되는 메소드
	2. _jspService() : init메소드 실행이 된후, 또는 없을때 불려가서 실행되는 메소드
	3. jspDestroy() : 파일 종료시 불려가서 실행되는 메소드
	jspInit()과 jspDestroy()는 오버라이딩이 가능하며, jspService()는 불가능 하다.	
 -->
 <%!
 		int count = 0;
 		String path = null;
 		
 		public void jspInit(){//count.jsp파일이 실행될때 제일먼저 실행
 			path = this.getServletContext().getRealPath("count/count.txt");
 			FileReader fr = null;
 			BufferedReader br = null;
 			try{
 				fr = new FileReader(path);
 				br = new BufferedReader(fr);
 				String line = br.readLine();
 				if (line != null){
 					count = Integer.parseInt(line.trim());
 				}
 				br.close();
 				fr.close();
 			}catch(FileNotFoundException e){
 				countSaveFile();
 			}catch(IOException e){
 				countSaveFile();
 			}
 		}
 		public void countSaveFile(){
 			FileWriter fw = null;
 			BufferedWriter bw = null;
 			PrintWriter pw = null;
 			try{
 				fw = new FileWriter(path);
 				bw = new BufferedWriter(fw);
 				pw = new PrintWriter(bw);
 				pw.println(count);
 				pw.close();
 				bw.close();
 				fw.close();
 			}catch(IOException e){
 				e.printStackTrace();
 			}
 		}
 		public void jspDestroy(){//count.jsp파일이 종료가 될때 
 			countSaveFile();
 		}
 %>
<%
		if (session.isNew()){//새로운 브라우저가 요청이 되었을때 호출되는 메소드
			count++;
		}
		if (count%10==0){
			countSaveFile();
		}
%> 
 <b>방문횟수 : </b>
 <%
 		String countStr = String.valueOf(count);
 		int len = countStr.length();
 		for(int i=0; i<len; ++i){
 			char ch = countStr.charAt(i);%>
 			<img	 src="<%=request.getContextPath()%>/img/no<%=ch%>.gif">
<%	} %>
 
 
 
 
 
 
 
 