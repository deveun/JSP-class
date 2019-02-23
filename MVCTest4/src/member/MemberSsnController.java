package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberSsnController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "WEB-INF/member/memberSsn.jsp";
	}

}
