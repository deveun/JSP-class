package student;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCommand implements CommandIf{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		StudentDAO dao = new StudentDAO();
		String del_id = req.getParameter("id");
		int res = 0;
		String msg = null, url = null;
		try {
			res = dao.deleteStudent(del_id);
			msg = "학생삭제 성공.";
			url = "student.do?command=list";
		} catch (SQLException e) {
			e.printStackTrace();
			msg = "학생삭제 오류.";
			url = "student.do?command=start";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "/message.jsp";
	}
}
