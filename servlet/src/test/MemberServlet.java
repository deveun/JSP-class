package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>" + name + "님의 주소는" + addr + "입니다.</h2>");
		
	}

}

//form 데이터를 post로 받기 위해서는 doPost Method를 선언해야함.