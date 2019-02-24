package board;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardListController implements Controller{
	@Override
	public String processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> listBoard = null;
		try {
			listBoard = dao.listBoard();
			req.setAttribute("list", listBoard);
			return "WEB-INF/board/list.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB오류 발생!! 관리자에게 문의하세요!!");
			req.setAttribute("url", "index.jsp");
			return "message.jsp";
			}
	}
}
