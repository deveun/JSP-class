package student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");

		PrintWriter pw = resp.getWriter();
		// pw.println("<h2>�������</h2>");
		String cmd = req.getParameter("command");

		String msg = null, url = null, nextPage = null;
		///////////////////////
		if (cmd.equals("insert")) {
			// pw.println("<h2>�л�������������� �Խ��ϴ�.</h2>");
			StudentDTO dto = new StudentDTO();
			dto.setId(req.getParameter("id"));
			dto.setName(req.getParameter("name"));
			dto.setCname(req.getParameter("cname"));
			StudentDAO dao = new StudentDAO();
			int res = 0;
			try {
				res = dao.insertStudent(dto);
				msg = "�л���� ����.";
				url = "student.do?command=list";

			} catch (SQLException e) {
				e.printStackTrace();
				msg = "�л���� ����.";
				url = "student.do?command=start";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			nextPage = "/message.jsp";

		}
		///////////////////////////
		else if (cmd.equals("delete")) {
			//pw.println("<h2>�л��������������� �Խ��ϴ�.</h2>");
			StudentDAO dao = new StudentDAO();
			String del_id = req.getParameter("id");
			int res = 0;
			try {
				res = dao.deleteStudent(del_id);
				msg = "�л����� ����.";
				url = "student.do?command=list";
			} catch (SQLException e) {
				e.printStackTrace();
				msg = "�л����� ����.";
				url = "student.do?command=start";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			nextPage = "/message.jsp";
		}
		///////////////////////////////
		else if (cmd.equals("find")) {
			//pw.println("<h2>�л�ã������������ �Խ��ϴ�.</h2>");
			StudentDAO dao = new StudentDAO();
			String sear_name = req.getParameter("name");
			List<StudentDTO> list = null;
			try {
				list = dao.findStudent(sear_name);
				req.setAttribute("studentList", list);
				msg = "�л�ã�� ����.";
				url = "list.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
				msg = "�л�ã�� ����.";
				url = "student.do?command=start";
			} 
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			nextPage = "/message.jsp";
		}
		///////////////////////////////
		else if (cmd.equals("list")) {
			//pw.println("<h2>�л�������������� �Խ��ϴ�.</h2>");
			StudentDAO dao = new StudentDAO();
			List<StudentDTO> list = null;
			try {
				list = dao.listStudent();
				req.setAttribute("studentList", list);
				msg = "�л���� ����.";
				url = "list.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
				msg = "�л���� ����.";
				url = "student.do?command=start";
			} 
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			nextPage = "/message.jsp";
		} 
		/////////////////////////////////
		else if (cmd.equals("start")) {
			nextPage = "/student.jsp";
		}

		// �۾� ���� �� ȭ�� �ٲٱ�
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}

}
