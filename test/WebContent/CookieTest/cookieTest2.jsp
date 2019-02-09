<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	//쿠키에 저장된 값 꺼내오기
	Cookie cks[] = request.getCookies();
	
	if(cks != null || cks.length != 0) {
	for(int i=0; i<cks.length; ++i) {
		String name = cks[i].getName();
		String value = cks[i].getValue();
		
		out.println("<h3>쿠키명: "+name+", 쿠키값: "+value+"</h2>");
		}
	}
%>
		