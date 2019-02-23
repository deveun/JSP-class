package student;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class InsertCommand implements CommandIf{
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		
		StudentDTO dto = new StudentDTO();
		dto.setId(req.getParameter("id"));
		dto.setName(req.getParameter("name"));
		dto.setCname(req.getParameter("cname"));
		StudentDAO dao = new StudentDAO();
		int res = 0;
		String msg= null, url = null;
		try {
			res = dao.insertStudent(dto);
			msg = "학생등록 성공.";
			url = "student.do?command=list";

		} catch (SQLException e) {
			e.printStackTrace();
			msg = "학생등록 오류.";
			url = "student.do?command=start";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "/message.jsp";
	}

}
