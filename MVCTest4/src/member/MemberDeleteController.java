package member;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberDeleteController implements Controller {

	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String no = req.getParameter("no");
		
		MemberDAO dao = new MemberDAO();
		String msg = null, url = "memberAll.mem";
		try {
			int res = dao.deleteMember(Integer.parseInt(no));
			if (res>0){
				msg = "회원삭제성공!! 회원목록페이지로 이동합니다.";
			}else {
				msg = "회원삭제실패!! 회원목록페이지로 이동합니다.";
			}
		}catch(SQLException e) {}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}
}




