package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		
		//ȭ�鿡 ����ϱ� ����
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>Hello, Servlet!!</h2>");
	}

}

//���� Ŭ���� �����
//1. HttpServlet Ŭ������ ��ӹ޴´�
//2. �ݵ�� �����ؾ� �ϴ� �޼ҵ尡 �ִ�.
//doGet(), doPost(), service() �޼ҵ� �� �ϳ��̻��� �ݵ�� �����Ͽ��� �Ѵ�
//�������� �������� ��Ŀ� ���� GET / POST
//�������� ����̶� ������̴� Service() ��� (ex. �� �������� GET/POST�� �������� ���)
//3. WebContent -> WEB-INF -> web.xml ����
//servlet�� servlet-mapping�� ���� Ŭ������ ���.