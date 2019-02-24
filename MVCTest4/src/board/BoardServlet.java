package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardServlet extends HttpServlet
{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String uri = req.getRequestURI();
		String path = req.getContextPath();
		String cmd = uri.substring(path.length());
		
		BoardFactory factory = BoardFactory.getInstance();
		Controller controller = factory.createController(cmd);
		String nextPage = controller.processController(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req,  resp);
	}

}
