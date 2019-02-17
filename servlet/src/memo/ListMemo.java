package memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListMemo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("EUC-KR");
		req.setCharacterEncoding("EUC-KR");
		PrintWriter pw = resp.getWriter();
		MemoDAO dao = new MemoDAO();
		List<MemoDTO> list = dao.getList();
		
		//리스트 화면 출력
		pw.println("<html>");
		pw.println("<head><title>메모장</title></head>");
		pw.println("<body><div align=center>");
		pw.println("<h2>메 모 장</h2>");
		pw.println("<table border='1' width='500'>");
		pw.println("<tr bgcolor='yellow'><th>아이디</th>");
		pw.println("<th>이메일</th>");
		pw.println("<th width='50%'>내용</th></tr>");
		if (list==null || list.size()==0){
			pw.println("<tr><td colspan='3'>메모가 없습니다.</td></tr>");
		}else {
			for(MemoDTO dto : list){
				pw.println("<tr><td>"+dto.getId()+"</td>");
				pw.println("<td>"+dto.getEmail()+"</td>");
				pw.println("<td width='50%'>"+dto.getContent()+"</td></tr>");
			}
		}
		pw.println("</div></body></html>");
		pw.close();
	}

}
