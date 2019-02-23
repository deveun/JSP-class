package book;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController implements Controller {

	@Override
	public Object processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		List<BookDTO> list = null;
		try {
			BookDAO dao = new BookDAO();
			list = dao.listBook();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("list", list);		
		return "/page_list.jsp";
	}

}
