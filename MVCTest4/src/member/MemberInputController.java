package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInputController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setName(req.getParameter("name"));
		dto.setId(req.getParameter("id"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setSsn1(req.getParameter("ssn1"));
		dto.setSsn2(req.getParameter("ssn2"));
		dto.setEmail(req.getParameter("email"));
		dto.setHp1(req.getParameter("hp1"));
		dto.setHp2(req.getParameter("hp2"));
		dto.setHp3(req.getParameter("hp3"));
		MemberDAO dao = new MemberDAO();
		String msg = null, url = null;
		try{
			int res = dao.insertMember(dto);
			if (res>0) {
				msg = "회원가입성공!! 회원관리페이지로 이동합니다.";
				url = "index.mem";
			}else {
				msg = "회원가입실패!! 회원가입페이지로 이동합니다.";
				url = "memberSsn.mem";
			}
		}catch(SQLException e) {}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
