package my.member;

import java.sql.*;

//DAO : Data Access Object (DB의 데이터를 쓰고, 읽고, 수정, 삭제)
//DB 쿼리문 관련 동작을 클래스 함수로 지정하고, DTO의 데이터를 참조하여 값을 추출.
//이 함수들을 JSP에서 사용.
public class MemberDAO {

	// DB Connection
	Connection con;
	// (동적/정적)쿼리문
	PreparedStatement ps;
	// 쿼리 결과 ( Update의 경우 True/False, Select의 경우 Rows를 반환함)
	ResultSet rs;

	String url, user, pass;

	// 반드시 public default
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.err.println("Fail finding Oracle driver");
			// System.exit(0);
		}

		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "jsp01";
		pass = "jsp01";

	}

	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select name from jsp_member where ssn1=? and ssn2 =?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	public int insertMember(MemberDTO mbdto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into jsp_member values" + "(member_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mbdto.getName());
			ps.setString(2, mbdto.getId());
			ps.setString(3, mbdto.getPasswd());
			ps.setString(4, mbdto.getSsn1());
			ps.setString(5, mbdto.getSsn2());
			ps.setString(6, mbdto.getEmail());
			ps.setString(7, mbdto.getHp1());
			ps.setString(8, mbdto.getHp2());
			ps.setString(9, mbdto.getHp3());
			// Today date
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = 
					new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(10, sdf.format(date));
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

	}

}