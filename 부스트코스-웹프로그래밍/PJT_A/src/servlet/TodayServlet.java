package servlet;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodayServlet
 */
@WebServlet("/today")
public class TodayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TodayServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String now = format.format(new Date());
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter()
		.append("<a href='index.html'>메인화면</a></br>")
		.append("<h1 align='center' style='margin-top : 100px;'>현재시간 : ").append(now).append("</h1>");
	}
}
