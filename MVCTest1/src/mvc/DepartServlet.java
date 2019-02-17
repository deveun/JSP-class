package mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DepartServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String depart = req.getParameter("depart");
		PrintWriter pw = resp.getWriter();
		//pw.println("<h2>�����Ͻ� �а� : " + depart + "</h2>");
		
		DepartDAO dao = new DepartDAO();
		List<String> advice = dao.advice(depart);
		
		req.setAttribute("result", advice);
		
		//DAO���� ���� parameter���� view�� �����ϱ����� ���
		//RequestDispatcher //forward�� req�� �����ϰԵ�.
		RequestDispatcher view = req.getRequestDispatcher("/result.jsp");
		view.forward(req, resp);
		
	}
	
}
