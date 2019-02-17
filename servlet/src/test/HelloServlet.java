package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		
		//화면에 출력하기 위함
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>Hello, Servlet!!</h2>");
	}

}

//서블릿 클래스 만들기
//1. HttpServlet 클래스를 상속받는다
//2. 반드시 구현해야 하는 메소드가 있다.
//doGet(), doPost(), service() 메소드 중 하나이상을 반드시 구현하여야 한다
//보내지는 데이터의 방식에 따라서 GET / POST
//보내지는 방식이랑 관계없이는 Service() 사용 (ex. 한 페이지에 GET/POST가 섞여있을 경우)
//3. WebContent -> WEB-INF -> web.xml 생성
//servlet과 servlet-mapping에 서블릿 클래스를 등록.