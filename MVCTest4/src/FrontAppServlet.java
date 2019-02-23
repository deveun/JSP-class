import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontAppServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		//전체 주소값
		String url = req.getRequestURI();
		//경로 이름
		String path = req.getContextPath();
		//전체 주소 - 경로 이름 ===> 페이지 이름
		String cmd = url.substring(path.length());
		//PrintWriter pw = resp.getWriter();
		//pw.println(path);
		
		String nextPage = null;
		if(cmd.contentEquals("/login.app")) {
			nextPage = "login.jsp";
		} else if(cmd.contentEquals("/shop.app")) {
			nextPage = "index.shop";
		} else if(cmd.contentEquals("/member.app")) {
			nextPage = "index.mem"; //MemberServlet
		} else if(cmd.contentEquals("/board.app")) {
			nextPage = "list.board";
		}
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
}