package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateOkController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setNo(Integer.parseInt(req.getParameter("no")));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setEmail(req.getParameter("email"));
		dto.setHp1(req.getParameter("hp1"));
		dto.setHp2(req.getParameter("hp2"));
		dto.setHp3(req.getParameter("hp3"));
		
		MemberDAO dao = new MemberDAO();
		String msg = null, url = "memberAll.mem";
		try {
			int res = dao.updateMember(dto);
			if (res>0){
				msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
			}else {
				msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
			}
		}catch(SQLException e) {}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
