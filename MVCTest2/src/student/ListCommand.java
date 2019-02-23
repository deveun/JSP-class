package student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListCommand implements CommandIf{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		StudentDAO dao = new StudentDAO();
		List<StudentDTO> list = null;
		String msg = null, url = null;
		try {
			list = dao.listStudent();
			req.setAttribute("studentList", list);
			msg = "학생목록 성공.";
			url = "list.jsp";
		} catch (SQLException e) {
			e.printStackTrace();
			msg = "학생목록 오류.";
			url = "student.do?command=start";
		} 
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "/message.jsp";
	}
}
