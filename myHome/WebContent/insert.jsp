<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	////////////////////////
	//1. Get Date
	//2. Data validation
	//3. Find driver
	//4. Connect Oracle DB
	//5. Send Query
	//6. 받은 결과로 분기하기
	///////////////////////

	//Korean Encoding
	request.setCharacterEncoding("EUC-KR");
	//1.	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String cname = request.getParameter("cname");

	//2. (trim = 앞 뒤의 불필요한 space지우기)
	if (id == null || id.trim().equals("") || name == null || name.trim().equals("") || cname == null
			|| cname.trim().equals("")) {
%><script>
		alert("Type ID, Name, Class name correctly");
		history.back();
	</script>
<%
	//Method를 빠져나가지 않으면, Data가 Null일 때, 아래 구문을 실행하게됨.
		return;
	}

	//3. (WEB-INF - lib 내에 ojdbc6.jar 파일 넣기)
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//4. import class to the page top section
	// import="java.sql.*"
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp01";
	String pass = "jsp01";
	//(위치, 아이디, 비밀번호)
	Connection conn = DriverManager.getConnection(url, user, pass);

	//5. 쿼리에 ?? 가 존재하는 미완성 형태의 경우,
	//ps.setString(1,'abc') or ps.setInt(1,'5') 형식으로 추후에 지정 가능.
	//이 때, 첫번째 인자는 물음표의 위치.
	String sql = "INSERT INTO jspstudent VALUES (?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3,cname);
	int res = ps.executeUpdate();
	
	//6. Query가 성공하면 res = 1; 실패하면 res = 0;
	if(res > 0) {
		%><script>
		alert("Success!! Move to student list page.");
		location.href="list.jsp";
		</script><%
	}
	
	
%>