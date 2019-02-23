package book;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteController implements Controller{
	@Override
	public Object processController(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		try {
			BookDAO dao = new BookDAO();
			int del_id = Integer.parseInt(req.getParameter("del_id"));
			int res = dao.delBook(del_id);
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("error");
		}
		
		return "book.do?command=list";
	}
}
