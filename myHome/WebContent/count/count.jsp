<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- count.jsp -->
<!-- 
	jsp life cycle
	1. jspInit() : jsp������ ����ɶ� ���� ���� �ҷ����� ����Ǵ� �޼ҵ�
	2. _jspService() : init�޼ҵ� ������ ����, �Ǵ� ������ �ҷ����� ����Ǵ� �޼ҵ�
	3. jspDestroy() : ���� ����� �ҷ����� ����Ǵ� �޼ҵ�
	jspInit()�� jspDestroy()�� �������̵��� �����ϸ�, jspService()�� �Ұ��� �ϴ�.	
 -->
 <%!
 		int count = 0;
 		String path = null;
 		
 		public void jspInit(){//count.jsp������ ����ɶ� ���ϸ��� ����
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
 		public void jspDestroy(){//count.jsp������ ���ᰡ �ɶ� 
 			countSaveFile();
 		}
 %>
<%
		if (session.isNew()){//���ο� �������� ��û�� �Ǿ����� ȣ��Ǵ� �޼ҵ�
			count++;
		}
		if (count%10==0){
			countSaveFile();
		}
%> 
 <b>�湮Ƚ�� : </b>
 <%
 		String countStr = String.valueOf(count);
 		int len = countStr.length();
 		for(int i=0; i<len; ++i){
 			char ch = countStr.charAt(i);%>
 			<img	 src="<%=request.getContextPath()%>/img/no<%=ch%>.gif">
<%	} %>
 
 
 
 
 
 
 
 