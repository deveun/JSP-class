<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	////////////////////////
	//1. Get Date
	//2. Data validation
	//3. Find driver
	//4. Connect Oracle DB
	//5. Send Query
	//6. ���� ����� �б��ϱ�
	///////////////////////

	//Korean Encoding
	request.setCharacterEncoding("EUC-KR");
	//1.	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String cname = request.getParameter("cname");

	//2. (trim = �� ���� ���ʿ��� space�����)
	if (id == null || id.trim().equals("") || name == null || name.trim().equals("") || cname == null
			|| cname.trim().equals("")) {
%><script>
		alert("Type ID, Name, Class name correctly");
		history.back();
	</script>
<%
	//Method�� ���������� ������, Data�� Null�� ��, �Ʒ� ������ �����ϰԵ�.
		return;
	}

	//3. (WEB-INF - lib ���� ojdbc6.jar ���� �ֱ�)
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//4. import class to the page top section
	// import="java.sql.*"
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp01";
	String pass = "jsp01";
	//(��ġ, ���̵�, ��й�ȣ)
	Connection conn = DriverManager.getConnection(url, user, pass);

	//5. ������ ?? �� �����ϴ� �̿ϼ� ������ ���,
	//ps.setString(1,'abc') or ps.setInt(1,'5') �������� ���Ŀ� ���� ����.
	//�� ��, ù��° ���ڴ� ����ǥ�� ��ġ.
	String sql = "INSERT INTO jspstudent VALUES (?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3,cname);
	int res = ps.executeUpdate();
	
	//6. Query�� �����ϸ� res = 1; �����ϸ� res = 0;
	if(res > 0) {
		%><script>
		alert("Success!! Move to student list page.");
		location.href="list.jsp";
		</script><%
	}
	
	
%>