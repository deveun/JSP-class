package my.student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//DAO : Data Access Object (DB�� �����͸� ����, �а�, ����, ����)
public class StudentDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	String url, user, pass;

	// �ݵ�� public default
	public StudentDAO() {
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

	// INSERT (������ DTO ��ü)
	public int insertStudent(StudentDTO dto) throws SQLException {
		return insertStudent(dto.getId(), dto.getName(), dto.getCname());
	}

	// INSERT
	public int insertStudent(String id, String name, String cname) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into jspstudent values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, cname);
			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	// DELETE
	public int deleteStudent(String id) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from jspstudent where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			return ps.executeUpdate();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	// LIST
	// DTO �� �����ͺ��̽��� ������ ��üȭ ��Ų Ŭ����.
	// ������ ����� DTO�� ���, ��� ������(Rows)�� ArrayList�� �ִ´�.
	public List<StudentDTO> listStudent() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jspstudent";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<StudentDTO> list = new ArrayList<StudentDTO>();
			while (rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCname(rs.getString("cname"));
				list.add(dto);
			}
			return list;
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}

	// SEARCH
	// DTO �� �����ͺ��̽��� ������ ��üȭ ��Ų Ŭ����.
	// ������ ����� DTO�� ���, ��� ������(Rows)�� ArrayList�� �ִ´�.
	public List<StudentDTO> searchStudent(String id) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from jspstudent where id like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + id + "%");
			rs = ps.executeQuery();
			List<StudentDTO> list = new ArrayList<StudentDTO>();
			while (rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCname(rs.getString("cname"));
				list.add(dto);
			}
			return list;
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}
}
