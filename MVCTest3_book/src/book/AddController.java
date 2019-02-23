package book;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddController implements Controller {

	@Override
	public Object processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		try {
			BookDAO dao = new BookDAO();
			BookDTO dto = new BookDTO();
			dto.setBookname(req.getParameter("bookname"));
			dto.setWriter(req.getParameter("writer"));
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			dto.setPublisher(req.getParameter("publisher"));
			dto.setIndate(req.getParameter("indate"));
			int res = dao.addBook(dto);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "book.do?command=list";
	}

}
