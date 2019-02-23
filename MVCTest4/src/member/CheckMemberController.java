package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckMemberController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		
		MemberDAO dao = new MemberDAO();
		String msg= null, url = null;
		try {
			boolean isCheck = dao.checkMember(name, ssn1, ssn2);
			if(isCheck) {
				msg = "이미 회원가입되었습니다. 로그인해주세요.";
				url = "index.app";
			}
			else {
				msg = "회원가입페이지로 이동.";
				url = "member.mem";
				//세션 저장
				HttpSession session = req.getSession();
				session.setAttribute("name", name);
				session.setAttribute("ssn1", ssn1);
				session.setAttribute("ssn2", ssn2);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			msg = "에러 발생";
			url = "index.mem";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
