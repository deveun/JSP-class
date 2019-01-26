package my.member;

import java.sql.*;

//DAO : Data Access Object (DB�� �����͸� ����, �а�, ����, ����)
//DB ������ ���� ������ Ŭ���� �Լ��� �����ϰ�, DTO�� �����͸� �����Ͽ� ���� ����.
//�� �Լ����� JSP���� ���.
public class MemberDAO {

	// DB Connection
	Connection con;
	// (����/����)������
	PreparedStatement ps;
	// ���� ��� ( Update�� ��� True/False, Select�� ��� Rows�� ��ȯ��)
	ResultSet rs;

	String url, user, pass;

	// �ݵ�� public default
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