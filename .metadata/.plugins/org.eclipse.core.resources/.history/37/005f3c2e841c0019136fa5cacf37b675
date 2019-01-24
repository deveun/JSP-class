package my.student;

import java.sql.*;

//DAO : Data Access Object (DB의 데이터를 쓰고, 읽고, 수정, 삭제)
public class StudentDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	String url, user, pass;

	// 반드시 public default
	public StudentDAO() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			System.err.println("Fail finding Oracle driver");
			//System.exit(0);
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "jsp01";
		pass = "jsp01";

	}
	
	public int insertStudent(String id, String name, String cname)
	throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into jspstudent values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);;
			ps.setString(2, name);;
			ps.setString(3, cname);;
			return ps.executeUpdate();
		}finally {
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
	}
}
