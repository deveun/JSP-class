package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String no = req.getParameter("no");
		try {
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getMember(Integer.parseInt(no));
			req.setAttribute("getMember", dto);
		}catch(SQLException e) {}
		return "WEB-INF/member/member_update.jsp";
	}

}












