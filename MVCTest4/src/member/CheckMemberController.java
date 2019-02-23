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
				msg = "�̹� ȸ�����ԵǾ����ϴ�. �α������ּ���.";
				url = "index.app";
			}
			else {
				msg = "ȸ�������������� �̵�.";
				url = "member.mem";
				//���� ����
				HttpSession session = req.getSession();
				session.setAttribute("name", name);
				session.setAttribute("ssn1", ssn1);
				session.setAttribute("ssn2", ssn2);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			msg = "���� �߻�";
			url = "index.mem";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
