package member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberAllController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String mode = req.getParameter("mode");
		String search = null, searchString = null;
		if (mode==null){
			mode = "all";
		}else {
			search = req.getParameter("search");
			searchString = req.getParameter("searchString");
		}
		MemberDAO dao = new MemberDAO();
		
		List<MemberDTO> listMember = null;
		try {
			if (mode.equals("all")) listMember = dao.listMember();
			else listMember = dao.findMember(search, searchString);
			req.setAttribute("list", listMember);
			return "WEB-INF/member/memberAll.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB오류 발생!! 관리자에게 문의하세요!!");
			req.setAttribute("url", "index.mem");
			return "message.jsp";
			}
	}
}
