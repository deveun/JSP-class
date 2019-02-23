package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String uri = req.getRequestURI();
		String path = req.getContextPath();
		String cmd = uri.substring(path.length());
		
//		PrintWriter pw = resp.getWriter();
//		pw.println("<h2>MemberServlet ������ �Դϴ�.</h2>");
		
		String nextPage = null;
		//WEB-INF ���� ������ ���������� ������ �Ұ���.
		//���� ���� ������ ��θ� ����鼭 ������ �̵��� ����.
		//if(cmd.contentEquals("/index.mem")) {
		//	nextPage = "WEB-INF/member/index.jsp";
		//}
		
		MemberFactory factory = MemberFactory.getInstance();
		Controller controller = factory.createController(cmd);
		nextPage = controller.processController(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req,  resp);
	}

}
