package memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertMemo extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String content = req.getParameter("content");
		
		//DAO에서 처리/
		MemoDTO dto = new MemoDTO(id, email, content);
		MemoDAO dao = new MemoDAO();
		int res = dao.insertMemo(dto); 
		
		if(res > 0) {
			resp.sendRedirect("list.do");
		}
		else {
			PrintWriter pw = resp.getWriter();
			pw.println("<script>alert('오류발생. 입력화면으로 돌아갑니다.')</script>");
			resp.sendRedirect("memo.html"); 
		}
				
	}

}
