package book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String cmd = req.getParameter("command");
		//FACTORY
		BookFactory factory = BookFactory.getInstance();
		Controller cmdIf = factory.createController(cmd);
		String nextPage = (String)cmdIf.processController(req,resp);
		
		//DISPATCHER
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}

}
